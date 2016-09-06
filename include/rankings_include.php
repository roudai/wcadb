<?php
require_once("db/dbconnect.php");
require_once("include/common.php");
$common = new common();

$page = "rankings";

// パラメータ
$region = "";
$events = "";
$gender = "";
$show = "";
$type = "";
if(isset($_GET['region'])){
	$region = $_GET['region'];
}
if(isset($_GET['events'])){
	$events = $_GET['events'];
}
if(isset($_GET['gender'])){
	$gender = $_GET['gender'];
}
if(isset($_GET['show'])){
	$show = $_GET['show'];
}
if(isset($_GET['type'])){
	$type = $_GET['type'];
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

// イベント
function getEvents(){
	global $common,$pdo,$events;
	$sql = "SELECT id FROM `Events` WHERE rank < 990 ORDER BY rank";
	$stmt = $pdo->query($sql);
	foreach($stmt as $row){
		echo "<OPTION value = '" . $row['id'] . "'"; if($row['id']==$events) echo selected; echo ">" . $common->eventConvert($row['id']) . "</OPTION>";
	}
}

function viewRanking(){
		global $events,$type;
		if(($events == '444bf' OR $events == '555bf' OR $events == '333mbf') AND $type == 'average'){
			return false;	
		}else{
			return true;
		}
}

function getRanking(){
  global $common,$pdo,$region,$events,$gender,$show,$type,$lang;

	$sql = getSql();
	$stmt = $pdo->query($sql);

	$i = 1;
	$preRecord = "";
	foreach($stmt AS $row){
		if($lang=='jp' AND is_null($row['jname']) == false){
			$competition = $row['jname'];
		}else{
			$competition = $row['cellName'];
		}
		
		if($type=='' OR $type=='single'){
			$record = $common->resultConvert($events,$row['best']);
		}elseif($type == 'average'){
			$record = $common->resultConvert($events,$row['average'],true);
		}
		
		if ($record == $preRecord){
			$rank = "";
		}elseif((($show == '100' or $show == '') AND $i > 100) OR ($show == 1000 AND $i > 1000)){
			break;
		}else{
			$rank = $i;	
		}
echo <<<EOT
		<tr>
			<td>$rank</td>
			<td><a href='person.php?id={$row['personId']}'>{$row['personName']}</a></td>
			<td>{$common->showFlag($row['countryId'])}{$row['countryId']}</td>
			<td>{$record}</td>
			<td><a href='results.php?id={$row['competitionId']}'>{$competition}</a></td>
			<td>{$common->dateConvert($row['year'],$row['month'],$row['day'],$row['endMonth'],$row['endDay'])}</td>
		</tr>
EOT;
	$preRecord = $record;
	$preRank = $rank;
	$i ++;
	}
  		
}

function getSql(){
	  global $region,$events,$gender,$show,$type,$lang;

	if($events == ""){
		$eventsSql = "eventId = '333' ";
	}else{
		$eventsSql = "eventId = '" . $events . "' ";
	}
	
	if(($lang=='en' AND ($region=='World' or $region=='')) OR ($lang=='jp' AND $region=='World')){
		$countrySql = "";
	}elseif($lang=='jp' AND $region==''){
		$countrySql = "AND countryId = 'Japan' ";
	}elseif(substr($region,0,1) == '_'){
		$countrySql = "AND continentId = '" . $region . "' ";
	}else{
		$countrySql = "AND countryId = '" . $region . "' ";
	}
	
	if($gender == 'all' or $gender == ''){
		$genderSql = "";
	}elseif($gender == 'female'){
		$genderSql = "AND gender = 'f' ";
	}elseif($gender == 'male'){
		$genderSql = "AND gender = 'm' ";
	}
	
	if($show == '100' or $show == ''){
		$showSql = "LIMIT 200";
	}elseif($show == '1000'){
		$showSql = "LIMIT 1100";
	}elseif($show == 'all'){
		$showSql = "";
	}
	
	if($type == '' OR $type == 'single'){
	  return "SELECT * FROM `RanksSingleResults` WHERE " . $eventsSql . $countrySql . $genderSql . "ORDER BY best,personName " . $showSql;
	}elseif($type == 'average'){
	  return "SELECT * FROM `RanksAverageResults` WHERE " . $eventsSql . $countrySql . $genderSql . "ORDER BY average,personName " . $showSql;
	}
}

?>