<?php
require_once("db/dbconnect.php");
require_once("include/common.php");
$common = new common();

$page = "index";

// パラメータ
$region = "";
$gender = "";
if(isset($_GET['region'])){
	$region = $_GET['region'];
}
if(isset($_GET['gender'])){
	$gender = $_GET['gender'];
}

// DB接続
$dbconnect = new dbconnect();
$pdo = $dbconnect->connect();

// 大陸名
function getContinents(){
	global $region,$pdo;
	$sql = "SELECT id,name FROM `Continents` ORDER BY id";
	$stmt = $pdo->query($sql);
	foreach($stmt as $row){
		echo "<OPTION value = '" . $row['id'] . "'"; if($row['id']==$region) echo selected; echo ">" . $row['name'] . "</OPTION>";
	}
}

// 国名
function getCountries(){
	global $region,$pdo,$lang;
	$sql = "SELECT countryId FROM `Persons` WHERE subid = '1' GROUP BY countryId ORDER BY countryId";
	$stmt = $pdo->query($sql);
	foreach($stmt as $row){
		if($lang=='en'){
			echo "<OPTION value = '" . $row['countryId'] . "'"; if($row['countryId']==$region) echo selected; echo ">" . $row['countryId'] . "</OPTION>";
		}elseif($lang=='jp'){
			echo "<OPTION value = '" . $row['countryId'] . "'"; 
			if($row['countryId']==$region OR ($region=="" AND $row['countryId']=='Japan')) echo selected; 
			echo ">" . $row['countryId'] . "</OPTION>";
		}
	}
}
	
// 
function getRecord(){
	global $common,$region,$gender,$pdo;
	global $lang,$Ltype,$Lrecord,$Lperson,$Lregion2,$Lcompetition,$Ldate,$Lsingle,$Laverage;

	if($gender=='all' OR $gender==''){
		$gender_sql = " AND gender = 'a' ";
	}elseif($gender=='male'){
		$gender_sql = " AND gender = 'm' ";
	}elseif($gender=='female'){
		$gender_sql = " AND gender = 'f' ";
	}
	if($gender==""){$gender='all';}
		
$sql_event = <<<EOT
	SELECT id FROM `Events` WHERE rank < 990 ORDER BY rank
EOT;
	$stmt_event = $pdo->query($sql_event);
	
	foreach($stmt_event AS $row_event){
		if(($lang=='en' AND ($region=='World' or $region=='')) OR ($lang=='jp' AND $region=='World')){
			$sql_cnt = "SELECT COUNT(*) AS num FROM `WRecordsSingle` WHERE eventId = '" . $row_event['id'] . "'" . $gender_sql;
			$sql_single = "SELECT * FROM `WRecordsSingle` WHERE eventId = '" . $row_event['id'] . "'" . $gender_sql . " ORDER BY personName";
			$sql_average = "SELECT * FROM `WRecordsAverage` WHERE eventId = '" . $row_event['id'] . "'" . $gender_sql . " ORDER BY personName";
		}elseif($lang=='jp' AND $region==''){
			$sql_cnt = "SELECT COUNT(*) AS num FROM `RecordsSingle` WHERE eventId = '" . $row_event['id'] . "'" . $gender_sql . " AND countryId = 'Japan'";
			$sql_single = "SELECT * FROM `RecordsSingle` WHERE eventId = '" . $row_event['id'] . "'" . $gender_sql . " AND countryId = 'Japan' ORDER BY personName";
			$sql_average = "SELECT * FROM `RecordsAverage` WHERE eventId = '" . $row_event['id'] . "'" . $gender_sql . " AND countryId = 'Japan' ORDER BY personName";
		}elseif(substr($region,0,1)=='_'){
			$sql_cnt = "SELECT COUNT(*) AS num FROM `CRecordsSingle` WHERE eventId = '" . $row_event['id'] . "'" . $gender_sql . " AND continentId = '" . $region . "'";
			$sql_single = "SELECT * FROM `CRecordsSingle` WHERE eventId = '" . $row_event['id'] . "'" . $gender_sql . " AND continentId = '" . $region . "' ORDER BY personName";
			$sql_average = "SELECT * FROM `CRecordsAverage` WHERE eventId = '" . $row_event['id'] . "'" . $gender_sql . " AND continentId = '" . $region . "' ORDER BY personName";
		}else{
			$sql_cnt = "SELECT COUNT(*) AS num FROM `RecordsSingle` WHERE eventId = '" . $row_event['id'] . "'" . $gender_sql . " AND countryId = '" . $region . "'";
			$sql_single = "SELECT * FROM `RecordsSingle` WHERE eventId = '" . $row_event['id'] . "'" . $gender_sql . " AND countryId = '" . $region . "' ORDER BY personName";
			$sql_average = "SELECT * FROM `RecordsAverage` WHERE eventId = '" . $row_event['id'] . "'" . $gender_sql . " AND countryId = '" . $region . "' ORDER BY personName";
		}
		$stmt_cnt = $pdo->query($sql_cnt);
		$stmt_single = $pdo->query($sql_single);
		$stmt_average = $pdo->query($sql_average);
		
		$row_cnt = $stmt_cnt->fetch(PDO::FETCH_ASSOC);
		if($row_cnt['num'] != 0){
echo <<<EOT
		<div class='list-group-item'>
			{$common->iconConvert($row_event['id'])}
			{$common->eventConvert($row_event['id'])}
			<div class="table-responsive">
				<table class="table table-hover table-condensed">
					<thead>
						<tr>
							<th class="col-md-1">{$Ltype[$lang]}</th>
							<th class="col-md-1">{$Lrecord[$lang]}</th>
							<th class="col-md-3">{$Lperson[$lang]}</th>
							<th class="col-md-2">{$Lregion2[$lang]}</th>
							<th class="col-md-3">{$Lcompetition[$lang]}</th>
							<th class="col-md-2">{$Ldate[$lang]}</th>
						</tr>
					</thead>
					<tbody>
EOT;
						$flag = true;
						foreach($stmt_single AS $row_single){
							if($lang=='jp' AND is_null($row_single['jname']) == false){
								$competition_single = $row_single['jname'];
							}else{
								$competition_single = $row_single['cellName'];
							}
							if($flag){
								$type = $Lsingle[$lang];
								$result = $common->resultConvert($row_event['id'],$row_single['best']);
							}else{
								$type = "";
								$result = "";
							}
echo <<<EOT
							<tr>
								<td><a href='rankings.php?region={$region}&events={$row_event['id']}&gender={$gender}&show=100&type=single'>$type</a></td>
								<td>$result</td>
								<td><a href='person.php?id={$row_single['personId']}'>{$row_single['personName']}</a></td>
								<td>{$common->showFlag($row_single['countryId'])}{$row_single['countryId']}</td>
								<td><a href='results.php?id={$row_single['competitionId']}'>{$competition_single}</a></td>
								<td>{$common->dateConvert($row_single['year'],$row_single['month'],$row_single['day'],$row_single['endMonth'],$row_single['endDay'])}</td>
							</tr>
EOT;
							$flag = false;
						}
						
						$flag = true;
						foreach($stmt_average AS $row_average){
							if($lang=='jp' AND is_null($row_average['jname']) == false){
								$competition_average = $row_average['jname'];
							}else{
								$competition_average = $row_average['cellName'];
							}
							if($flag){
								$type = $Laverage[$lang];
								$result = $common->resultConvert($row_event['id'],$row_average['average'],true);
							}else{
								$type = "";
								$result = "";
							}
echo <<<EOT
							<tr>
								<td><a href='rankings.php?region={$region}&events={$row_event['id']}&gender={$gender}&show=100&type=average'>$type</a></td>
								<td>$result</td>
								<td><a href='person.php?id={$row_average['personId']}'>{$row_average['personName']}</a></td>
								<td>{$common->showFlag($row_average['countryId'])}{$row_average['countryId']}</td>
								<td><a href='results.php?id={$row_average['competitionId']}'>{$competition_average}</a></td>
								<td>{$common->dateConvert($row_average['year'],$row_average['month'],$row_average['day'],$row_average['endMonth'],$row_average['endDay'])}</td>
							</tr>
EOT;
							$flag = false;
						}
echo <<<EOT
					</tbody>
				</table>
			</div>
		</div>
EOT;
		}

	}
}
?>