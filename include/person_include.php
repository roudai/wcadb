<?php
require_once("db/dbconnect.php");
require_once("include/common.php");
$common = new common();

$page = "persons";

// パラメータ
$id = "";
if(isset($_GET['id'])){
	$id = $_GET['id'];
}

// DB接続
$dbconnect = new dbconnect();
$pdo = $dbconnect->connect();

// 人情報
function getPerson(){
	global $common,$id,$pdo;
	global $Lregion,$Lgender,$Lcomnum,$lang;
	$sql = "SELECT * FROM `Persons` WHERE id = '" . $id . "' AND subid = '1'";
	$stmt = $pdo->query($sql);
	$row = $stmt->fetch(PDO::FETCH_ASSOC);

	$sql_awedd = "SELECT rank FROM `Awecc` WHERE id = '" . $id . "'";
	$stmt_awecc = $pdo->query($sql_awedd);
	$row_awecc = $stmt_awecc->fetch(PDO::FETCH_ASSOC);
	switch($row_awecc['rank']){
		case "Platinum": $awecc = "Platinum Member"; break;
		case "Gold": $awecc = "Gold Member"; break;
		case "Silver": $awecc = "Silver Member"; break;
		default: $awecc = "";
	}

echo <<<EOT
	<h1 class='h3 text-center'>{$row['name']}</h1>
	<h4 class='text-center'><a href='/awecc.php'>{$awecc}</a></h4>
	<div class="table-responsive">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th class="col-md-2">WCA ID</td>
					<th class="col-md-3">{$Lregion[$lang]}</td>
					<th class="col-md-2">{$Lgender[$lang]}</td>
					<th class="col-md-2">{$Lcomnum[$lang]}</td>
					<th class="col-md-1">Gold</td>
					<th class="col-md-1">Silver</td>
					<th class="col-md-1">Bronze</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><a href='https://www.worldcubeassociation.org/results/p.php?i={$row['id']}' target='_blank'>{$row['id']}</a></td>
					<td>{$common->showFlag($row['countryId'])}{$row['countryId']}</td>
					<td>{$common->genderConvert($row['gender'])}</td>
					<td>{$row['competitions']}</td>
					<td>{$row['gold']}</td>
					<td>{$row['silver']}</td>
					<td>{$row['bronze']}</td>
				</tr>
			</tbody>
		</table>
	</div>
	<br />
EOT;
}

function getRecords(){
	global $common,$id,$pdo;
$sql = <<<EOT
	SELECT A.eventId,A.countryRank AS sNR,A.continentRank AS sCR,A.worldRank AS sWR,A.best AS single,B.best AS average,
	B.worldRank AS aWR,B.continentRank AS aCR,B.countryRank AS aNR,C.num AS Gold,D.num AS Silver,E.num AS Bronze 
	FROM (SELECT * FROM `RanksSingle` WHERE personId = '{$id}') A
	LEFT OUTER JOIN (SELECT * FROM `RanksAverage` WHERE personId = '{$id}') B ON A.eventId = B.eventId
	LEFT OUTER JOIN (SELECT * FROM `Prize` WHERE personId = '{$id}' AND pos = '1') C ON A.eventId = C.eventId
	LEFT OUTER JOIN (SELECT * FROM `Prize` WHERE personId = '{$id}' AND pos = '2') D ON A.eventId = D.eventId
	LEFT OUTER JOIN (SELECT * FROM `Prize` WHERE personId = '{$id}' AND pos = '3') E ON A.eventId = E.eventId
	INNER JOIN (SELECT id,rank FROM Events) F ON A.eventId = F.id ORDER BY F.rank
EOT;
	$stmt = $pdo->query($sql);
	
	foreach($stmt as $row)
echo <<<EOT
	  <tr>
		  <td>{$common->iconConvert($row['eventId'])}<strong>{$common->eventConvert($row['eventId'])}</strong></td>
		  <td class="text-right">{$common->rankColorConvert($row['sNR'])}</td>
		  <td class="text-right">{$common->rankColorConvert($row['sCR'])}</td>
		  <td class="text-right">{$common->rankColorConvert($row['sWR'])}</td>
		  <td class="text-right">{$common->resultConvert($row['eventId'],$row['single'])}</td>
		  <td class="text-right">{$common->resultConvert($row['eventId'],$row['average'],true)}</td>
		  <td class="text-right">{$common->rankColorConvert($row['aWR'])}</td>
		  <td class="text-right">{$common->rankColorConvert($row['aCR'])}</td>
		  <td class="text-right">{$common->rankColorConvert($row['aNR'])}</td>
		  <td class="text-right">{$row['Gold']}</td>
		  <td class="text-right">{$row['Silver']}</td>
		  <td class="text-right">{$row['Bronze']}</td>
	  </tr>	
EOT;
}

function getHistory(){
	global $common,$id,$pdo;
	global $Lcompetition,$Lround,$Lplace,$Lbest,$Laverage,$LresultDetails,$lang;

$sql_event = <<<EOT
	SELECT A.* FROM
	(SELECT eventId FROM `Results` WHERE personId = '{$id}' GROUP BY eventId) A
	INNER JOIN (SELECT id,rank FROM `Events`) B ON A.eventId = B.id
	ORDER BY B.rank
EOT;
	$stmt_event = $pdo->query($sql_event);

	$i = 1;
	foreach($stmt_event AS $row_event){
$sql_history = <<<EOT
	SELECT A.* FROM
	(SELECT * FROM `Results` WHERE personId ='{$id}' AND eventId = '{$row_event['eventId']}') A 
	INNER JOIN (SELECT id,rank FROM `Rounds`) B	ON A.roundId = B.id
	ORDER BY A.year,A.month,A.day,B.rank
EOT;
	$stmt_history = $pdo->query($sql_history);
	
	$j = 1;
	$pbSingle = 9999999999;
	$pbAverage = 9999999999;
	$history_array = array();
	foreach($stmt_history AS $row_history){
		if($row_history['best'] <= $pbSingle AND $row_history['best'] > 0){
			$pbSingleUp = true;
			$pbSingle = $row_history['best'];
		}else{
			$pbSingleUp = false;
		}
		if($row_history['average'] <= $pbAverage AND $row_history['average'] > 0){
			$pbAverageUp = true;
			$pbAverage = $row_history['average'];
		}else{
			$pbAverageUp = false;
		}
		$history_array[$j] = array(
				'countryId' => $row_history['countryId'],
				'competitionId' => $row_history['competitionId'],
				'cellName' => $row_history['cellName'],
				'jname' => $row_history['jname'],
				'roundId' => $row_history['roundId'],
				'pos' => $row_history['pos'],
				'best' => $row_history['best'],
				'regionalSingleRecord' => $row_history['regionalSingleRecord'],
				'average' => $row_history['average'],
				'regionalAverageRecord' => $row_history['regionalAverageRecord'],
				'value1' => $row_history['value1'],
				'value2' => $row_history['value2'],
				'value3' => $row_history['value3'],
				'value4' => $row_history['value4'],
				'value5' => $row_history['value5'],
				'pbSingle' => $pbSingleUp,
				'pbAverage' => $pbAverageUp
			);
		$j++;
	}
	
echo <<<EOT
	<div class="panel panel-default">
		<a class="list-group-item" data-toggle="collapse" data-parent="#accordion1" href="#collapse1{$i}">
			{$common->iconConvert($row_event['eventId'])}
			<strong>{$common->eventConvert($row_event['eventId'])}</strong>
		</a>
		<div id="collapse1{$i}" class="panel-collapse collapse">
			<div class="panel-body">
				<div class="table-responsive">
					<table class="table table-striped table-hover table-condensed">
						<thead>
							<tr>
								<th class='col-sm-3'>{$Lcompetition[$lang]}</th>
								<th class='col-sm-2'>{$Lround[$lang]}</th>
								<th class='col-sm-1'>{$Lplace[$lang]}</th>
								<th class='col-sm-1'>{$Lbest[$lang]}</th>
								<th class='col-sm-1'>{$Laverage[$lang]}</th>
								<th class='col-sm-4' colspan="5">{$LresultDetails[$lang]}</th>
							</tr>
						</thead>
						<tbody>
EOT;
	$preCompetition = "";
	for ($j = count($history_array) ; $j > 0; $j--) {
		if($history_array[$j]['competitionId'] == $preCompetition){
			$competition = "";
		}else{
			if($lang=='jp' AND is_null($history_array[$j]['jname']) == false){
				$competition = "{$common->showFlag($history_array[$j]['countryId'])}<a href='/results.php?id=" . $history_array[$j]['competitionId'] . "'>" .  $history_array[$j]['jname'] . "</a>";
			}else{
				$competition = "{$common->showFlag($history_array[$j]['countryId'])}<a href='/results.php?id=" . $history_array[$j]['competitionId'] . "'>" .  $history_array[$j]['cellName'] . "</a>";
			}
		}
		if($history_array[$j]['pbSingle']==true){
			$single = "<span class='text-danger'><strong>" . $common->resultConvert($row_event['eventId'],$history_array[$j]['best']) . "</strong></span>";
		}elseif($history_array[$j]['pbSingle']==false){
			$single = $common->resultConvert($row_event['eventId'],$history_array[$j]['best']);
		}
		if($history_array[$j]['pbAverage']==true){
			$average = "<span class='text-danger'><strong>" . $common->resultConvert($row_event['eventId'],$history_array[$j]['average'],"average") . "</strong></span>";
		}elseif($history_array[$j]['pbAverage']==false){
			$average = $common->resultConvert($row_event['eventId'],$history_array[$j]['average'],"average");
		}
echo <<<EOT
							<tr>
								<td>{$competition}</td>
								<td>{$common->roundConvert($history_array[$j]['roundId'])}</td>
								<td>{$history_array[$j]['pos']}</td>
								<td>{$single} &nbsp;
								    <span class="text-info"><strong>{$history_array[$j]['regionalSingleRecord']}</strong></span></td>
								<td>{$average} &nbsp;
								    <span class="text-info"><strong>{$history_array[$j]['regionalAverageRecord']}</strong></span></td>
								<td>{$common->resultConvert($row_event['eventId'],$history_array[$j]['value1'])}</td>
								<td>{$common->resultConvert($row_event['eventId'],$history_array[$j]['value2'])}</td>
								<td>{$common->resultConvert($row_event['eventId'],$history_array[$j]['value3'])}</td>
								<td>{$common->resultConvert($row_event['eventId'],$history_array[$j]['value4'])}</td>
								<td>{$common->resultConvert($row_event['eventId'],$history_array[$j]['value5'])}</td>
							</tr>
EOT;
			$preCompetition = $history_array[$j]['competitionId'];
		}
echo <<<EOT
						</tbody>
					</table>
				</div><!-- table-responsive -->
			</div><!-- panel-body -->
		</div><!-- panel-collapse -->
	</div><!-- panel -->
EOT;
		$i ++;
	}
}

function getCompetitions(){
	global $common,$id,$pdo;
	global $Levent,$Lround,$Lplace,$Lbest,$Laverage,$LresultDetails,$lang;

$sql_competitions = <<<EOT
	SELECT * FROM `Results` WHERE personId = '{$id}' GROUP BY cellName ORDER BY year DESC,month DESC,day DESC
EOT;
	$stmt_competitions = $pdo->query($sql_competitions);

	$i = 1;
	foreach($stmt_competitions AS $row_competitions){
		if($lang=='jp' AND is_null($row_competitions['jname']) == false){
			$competition = $row_competitions['jname'];
		}else{
			$competition = $row_competitions['cellName'];
		}
$sql = <<<EOT
	SELECT A.* FROM
	(SELECT * FROM `Results` WHERE competitionId ='{$row_competitions['competitionId']}' AND personId = '{$id}') A 
	INNER JOIN (SELECT id,rank FROM `Events`) B ON A.eventId = B.id
	INNER JOIN (SELECT id,rank FROM `Rounds`) C	ON A.roundId = C.id
	ORDER BY A.year DESC,A.month DESC,A.day DESC,B.rank,C.rank DESC
EOT;
	$stmt = $pdo->query($sql);
echo <<<EOT
		<div class="panel panel-default">
			<a class="list-group-item" data-toggle="collapse" data-parent="#accordion2" href="#collapse2{$i}">
				{$common->showFlag($row_competitions['countryId'])}
				<strong>{$competition}</strong> &nbsp;
				({$common->dateConvert($row_competitions['year'],$row_competitions['month'],$row_competitions['day'],$row_competitions['endMonth'],$row_competitions['endDay'])})
			</a>
			<div id="collapse2{$i}" class="panel-collapse collapse">
				<div class="panel-body">
				<span class='pull-right'><a href=/results.php?id={$row_competitions['competitionId']}>{$row_competitions['cellName']}</a></span>
					<div class="table-responsive">
						<table class="table table-striped table-hover table-condensed">
							<thead>
								<tr>
									<th>{$Levent[$lang]}</th>
									<th>{$Lround[$lang]}</th>
									<th>{$Lplace[$lang]}</th>
									<th>{$Lbest[$lang]}</th>
									<th>{$Laverage[$lang]}</th>
									<th colspan="5">{$LresultDetails[$lang]}</th>
								</tr>
							</thead>
							<tbody>
EOT;
		$preEvent = "";
		foreach($stmt as $row){
			if($row['eventId'] == $preEvent){
				$eventId = "";
			}else{
				$eventId = $row['eventId'];
			}
echo <<<EOT
								<tr>
									<td>{$common->iconConvert($eventId)}{$common->eventConvert($eventId,true)}</a></td>
									<td>{$common->roundConvert($row['roundId'])}</td>
									<td>{$row['pos']}</td>
									<td>{$common->resultConvert($row['eventId'],$row['best'])} &nbsp;
									    <span class="text-info"><strong>{$row['regionalSingleRecord']}</strong></span></td>
									<td>{$common->resultConvert($row['eventId'],$row['average'],true)} &nbsp;
									    <span class="text-info"><strong>{$row['regionalAverageRecord']}</strong></span></td>
									<td>{$common->resultConvert($row['eventId'],$row['value1'])}</td>
									<td>{$common->resultConvert($row['eventId'],$row['value2'])}</td>
									<td>{$common->resultConvert($row['eventId'],$row['value3'])}</td>
									<td>{$common->resultConvert($row['eventId'],$row['value4'])}</td>
									<td>{$common->resultConvert($row['eventId'],$row['value5'])}</td>
								</tr>
EOT;
			$preEvent = $row['eventId'];
		}
echo <<<EOT
							</tbody>
						</table>
					</div><!-- table-responsive -->
				</div><!-- panel-body -->
			</div><!-- panel-collapse -->
		</div><!-- panel -->
EOT;
		$i ++;
	}
}

function countPodium($value){
	global $common,$id,$pdo;

	switch($value){
		case 'World': $table = "PodiumWorld"; break;
		case 'Euro':  $table = "PodiumEuro" ; break;
		case 'Asian': $table = "PodiumAsian"; break;
		case 'Japan': $table = "PodiumJapan"; break;
	}
	$sql = "SELECT COUNT(*) AS cnt FROM `" .$table . "` WHERE personId = '" . $id . "'";
	$stmt = $pdo->query($sql);
	$row = $stmt->fetch(PDO::FETCH_ASSOC);
	
	if($row['cnt'] == 0){
		return false;
	}else{
		return true;
	}
}

function getPodium($value){
	global $common,$id,$pdo;

	switch($value){
		case 'World': $table = "PodiumWorld"; break;
		case 'Euro':  $table = "PodiumEuro" ; break;
		case 'Asian': $table = "PodiumAsian"; break;
		case 'Japan': $table = "PodiumJapan"; break;
	}
$sql_podium = <<<EOT
	SELECT * FROM {$table} WHERE personId = '{$id}' ORDER BY competitionId DESC,rank
EOT;
	$stmt_podium = $pdo->query($sql_podium);

	$preCompetition = "";
	foreach($stmt_podium AS $row_podium){
		if($row_podium['competitionId'] == $preCompetition){
			$year = "";
		}else{
			$year = $common->showFlag($row_podium['countryId']);
			$year .= "<a href='/results.php?id=" . $row_podium['competitionId'] . "'>" . substr($row_podium['competitionId'], -4) . "</a>";
		}
echo <<<EOT
		<tr>
			<td>{$year}</td>
			<td>{$common->eventConvert($row_podium['eventId'],true)}</td>
			<td>{$row_podium['pos']}</td>
			<td>{$common->resultConvert($row_podium['eventId'],$row_podium['best'])}</td>
			<td>{$common->resultConvert($row_podium['eventId'],$row_podium['average'],'average')}</td>
			<td>{$common->resultConvert($row_podium['eventId'],$row_podium['value1'])}</td>
			<td>{$common->resultConvert($row_podium['eventId'],$row_podium['value2'])}</td>
			<td>{$common->resultConvert($row_podium['eventId'],$row_podium['value3'])}</td>
			<td>{$common->resultConvert($row_podium['eventId'],$row_podium['value4'])}</td>
			<td>{$common->resultConvert($row_podium['eventId'],$row_podium['value5'])}</td>
		</tr>
EOT;
		$preCompetition = $row_podium['competitionId'];
	}
}

function countHistoryR($value){
	global $common,$id,$pdo;

	switch($value){
		case 'WR': $table = "HistoryWR"; break;
		case 'CR': $table = "HistoryCR"; break;
		case 'NR': $table = "HistoryNR"; break;
	}
	
	$sql = "SELECT COUNT(*) AS cnt FROM " . $table . " WHERE personId = '" . $id . "'";
	
	$stmt = $pdo->query($sql);
	$row = $stmt->fetch(PDO::FETCH_ASSOC);
	
	if($row['cnt'] == 0){
		return false;
	}else{
		return true;
	}
}

function getHistoryR($value){
	global $common,$id,$pdo;

	switch($value){
		case 'WR': $table = "HistoryWR"; break;
		case 'CR': $table = "HistoryCR"; break;
		case 'NR': $table = "HistoryNR"; break;
	}
	$sql = "SELECT * FROM " . $table . " WHERE personId = '" . $id . "' ORDER BY eventRank,year DESC,month DESC,day DESC,roundRank DESC";
	$stmt = $pdo->query($sql);

	$preEvent = "";
	foreach($stmt AS $row){
		if($row['eventId'] == $preEvent){
			$event = "";
		}else{
			$event = $common->iconConvert($row['eventId']) . $common->eventConvert($row['eventId'],true);
		}
		if($row['regionalSingleRecord'] == $value OR ($value == 'CR' AND in_array($row['regionalSingleRecord'],array('AfR','AsR','ER','NAR','OcR','SAR')))){
			$single = $common->resultConvert($row['eventId'],$row['best']);
		}else{
			$single = "";
		}
			
		if($row['regionalAverageRecord'] == $value OR ($value == 'CR' AND in_array($row['regionalAverageRecord'],array('AfR','AsR','ER','NAR','OcR','SAR')))){
			$average = $common->resultConvert($row['eventId'],$row['average'],"average");
			$value1 = $common->resultConvert($row['eventId'],$row['value1']);
			$value2 = $common->resultConvert($row['eventId'],$row['value2']);
			$value3 = $common->resultConvert($row['eventId'],$row['value3']);
			$value4 = $common->resultConvert($row['eventId'],$row['value4']);
			$value5 = $common->resultConvert($row['eventId'],$row['value5']);
		}else{
			$average = "";
			$value1 = "";
			$value2 = "";
			$value3 = "";
			$value4 = "";
			$value5 = "";
		}
echo <<<EOT
		<tr>
			<td>{$event}</td>
			<td>{$single}</td>
			<td>{$average}</td>
			<td>{$common->showFlag($row['countryId'])}<a href='/results.php?id={$row['competitionId']}'>{$row['cellName']}</a></td>
			<td>{$common->dateConvert($row['year'],$row['month'],$row['day'],$row['endMonth'],$row['endDay'])}</td>
			<td>{$common->roundConvert($row['roundId'])}</td>
			<td>{$value1}</td>
			<td>{$value2}</td>
			<td>{$value3}</td>
			<td>{$value4}</td>
			<td>{$value5}</td>
		</tr>
EOT;
		$preEvent = $row['eventId'];
	}
}
?>