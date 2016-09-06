<?php
require_once("db/dbconnect.php");
require_once("include/common.php");
$common = new common();

$page = "competitions";

// パラメータ
$year = "";
$region = "";
$search = "";
if(isset($_GET['year'])){
	$year = $_GET['year'];
}
if(isset($_GET['region'])){
	$region = $_GET['region'];
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
	echo "<OPTION value='1982'"; if($y==1982) echo selected; echo ">1982</OPTION>";
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
	$sql = "SELECT countryId FROM `Competitions` GROUP BY countryId ORDER BY countryId";
	$stmt = $pdo->query($sql);

	foreach($stmt as $row){
		switch ($row['countryId']){
			case 'XA': $countryName = "Multiple Countries(Asia)"; break;
			case 'XE': $countryName = "Multiple Countries(Europe)"; break;
			case 'XN': $countryName = "Multiple Countries(North America)"; break;
			case 'XO': $countryName = "Multiple Countries(Oceania)"; break;
			case 'XS': $countryName = "Multiple Countries(South America)"; break;
			default  : $countryName = $row['countryId']; break;
		}
		if($lang=='en'){
			echo "<OPTION value = '" . $row['countryId'] . "'"; if($row['countryId']==$region) echo selected; echo ">" . $countryName . "</OPTION>";
		}elseif($lang=='jp'){
			echo "<OPTION value = '" . $countryName . "'"; 
			if($row['countryId']==$region OR ($region=="" AND $row['countryId']=='Japan')) echo selected; 
			echo ">" . $row['countryId'] . "</OPTION>";
		}
	}
}

function countCompetitions(){
	global $pdo;

	$sql = getSql(true);
	$stmt = $pdo->query($sql);
	$row = $stmt->fetch(PDO::FETCH_ASSOC);

	if($row['cnt'] == 0){
		return false;
	}else{
		return true;
	}
}

// 大会一覧
function getCompetitions(){
	global $common,$region,$search,$year,$pdo,$lang;
	
	$sql = getSql();
	$stmt = $pdo->query($sql);
	
	// テーブル作成
	foreach($stmt as $row){
		if($row['result']==0){
			$result = "class='info'";
		}else{
			$result = "";
		}
		if($lang=='jp' AND is_null($row['jname']) == false){
			$competition = $row['jname'];
			$city = $row['jarea'];
		}else{
			$competition = $row['cellName'];
			$city = $row['cityName'];
		}
echo <<<EOT
		<tr {$result}>
		<td>{$common->dateConvert($row['year'],$row['month'],$row['day'],$row['endMonth'],$row['endDay'])}</td>
		<td><a href='results.php?id={$row['id']}'>{$competition}</a></td>
		<td>{$common->showFlag($row['countryId'])}<strong>{$row['countryId']}</strong>, {$city}</td>
		</tr>
EOT;
	}
}

function getSql($count = false){
	global $common,$region,$search,$year,$pdo,$lang;
	
	// 年
	if($year=="" or $year=="0" or $year=="1"){
		$yearSql = "TRUE ";
	}else{
		$yearSql = "year = '" . $year . "' ";
	}
	
	// 地域
	if(($lang=='en' AND ($region=='World' or $region=='')) OR ($lang=='jp' AND $region=='World')){
		$countrySql = "AND TRUE ";
	}elseif($lang=='jp' AND $region==''){
		$countrySql = "AND countryId = 'Japan' ";
	}elseif(substr($region,0,1)=='_'){
		$countrySql = "AND countryId IN (SELECT name FROM `Countries` WHERE continentId = '" . $region . "') ";
	}else{
		$countrySql = "AND countryId = '" . $region . "' ";
	}
	
	// 検索条件
	if($search==''){
		$searchSql = "";
	}elseif($lang=='en'){
		$searchSql = "AND (cellName LIKE '%" . $search . "%' OR countryId LIKE '%" . $search . "%' OR cityName LIKE '%" . $search . "%')";
	}elseif($lang=='jp'){
		$searchSql = "AND (cellName LIKE '%" . $search . "%' OR countryId LIKE '%" . $search . "%' OR cityName LIKE '%" . $search . "%' OR jname LIKE '%" . $search . "%' OR jarea LIKE '%" . $search . "%')";
	}

	// 年
	if($count == true){
			return "SELECT COUNT(*) AS cnt FROM Competitions WHERE " . $yearSql . $countrySql . $searchSql;
	}else{
		if($year=="1" or $year==""){
			return "SELECT * FROM Competitions WHERE " . $yearSql . $countrySql . $searchSql . " ORDER BY year DESC,month DESC,day DESC LIMIT 0,200";
		}else{
			return "SELECT * FROM Competitions WHERE " . $yearSql . $countrySql . $searchSql . " ORDER BY year DESC,month DESC,day DESC";
		}
	}
}

?>