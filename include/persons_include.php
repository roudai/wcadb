<?php
require_once("db/dbconnect.php");
require_once("include/common.php");
$common = new common();

$page = "persons";

// パラメータ
$year = "";
$region = "";
$gender = "";
$search = "";
if(isset($_GET['year'])){
	$year = $_GET['year'];
}
if(isset($_GET['region'])){
	$region = $_GET['region'];
}
if(isset($_GET['gender'])){
	$gender = $_GET['gender'];
}
if(isset($_GET['search'])){
	$search = $_GET['search'];
}

// DB接続
$dbconnect = new dbconnect();
$pdo = $dbconnect->connect();

// 年
function getYear(){
	global $year;
	for ($y=date("Y");$y>=2003;$y--) {
		echo "<OPTION value='" . $y ."'"; if($y==$year) echo selected; echo ">" . $y . "</OPTION>";
	}
	echo "<OPTION value='1982' "; if($y==1982) echo selected; echo ">1982</OPTION>";
}

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

// 人一覧
function getPersons(){
	global $common,$region,$gender,$search,$year,$pdo;
	global $Lname,$Lgender,$Lregion,$pmatch,$error1,$error2,$error3,$lang;

  if($year=="" AND $region == "" AND $search == ""){
    exit;
  }
	// 年
	if($year=="0" OR $year==""){
		$yearSql = "TRUE ";
	}else{
		$yearSql = "id LIKE '" . $year . "%' ";
	}
	
	// 地域
	if($region=='World' or $region==''){
		$countrySql = "";
	}elseif(substr($region,0,1)=='_'){
		$countrySql = "AND continentId = '" . $region . "' ";
	}else{
		$countrySql = "AND countryId = '" . $region . "' ";
	}
	
	// 性別
	if($gender == 'all' or $gender == ''){
		$genderSql = "";
	}elseif($gender == 'female'){
		$genderSql = "AND gender = 'f' ";
	}elseif($gender == 'male'){
		$genderSql = "AND gender = 'm' ";
	}
	
	// 検索条件
	if($search==''){
		$searchSql = "";
	}else{
		$searchSql = " AND (id LIKE '%" . $search . "%' OR name LIKE '%" . $search . "%')";
	}

	$sql_cnt = "SELECT COUNT(*) as num FROM `Persons` WHERE " . $yearSql . $countrySql . $genderSql . $searchSql;
	$sql = "SELECT * FROM `Persons` WHERE " . $yearSql . $countrySql . $genderSql . $searchSql . "ORDER BY name";
	$stmt_cnt = $pdo->query($sql_cnt);
	$stmt = $pdo->query($sql);
	$row_cnt = $stmt_cnt->fetch(PDO::FETCH_ASSOC);
	
	if($row_cnt['num'] > 3000){
		echo "<p class='text-warning'>{$error2[$lang]}</p>";
	}elseif($row_cnt['num'] == 0){
		echo "<p class='text-info'>{$error1[$lang]}</p>";
	}else{
		echo "<p class='text-info'>" . $row_cnt['num'] . $pmatch[$lang] . "</p>";
	}
	
	// テーブル作成
	if($row_cnt['num'] > 0){
echo <<<EOT
	  <div class="table-responsive">
		<table class="table table-striped table-hover table-condensed table-responsive data">
			<thead>
				<tr>
  				<th>{$Lname[$lang]}</th>
  				<th>WCA ID</th>
  				<th>{$Lregion[$lang]}</th>
  				<th>{$Lgender[$lang]}</th>
				</tr>
			</thead>
			<tbody>
EOT;
		$i = 0;
		foreach($stmt as $row){
echo <<<EOT
		<tr>
			<td><a href='person.php?id={$row['id']}'>{$row['name']}</a></td>
			<td>{$row['id']}</td>
			<td>{$common->showFlag($row['countryId'])}{$row['countryId']}</td>
			<td>{$common->genderConvert($row['gender'])}</td>
		</tr>
EOT;
		$i ++;
		if($i == 3000){ break; }
		}
echo <<<EOT
  			</tbody>
  		</table>
  	</div>
EOT;
		if($i == 3000){ echo "<p class='text-warning'>{$error3[$lang]}</p>";}
	}

}

?>