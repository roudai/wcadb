<?php
require_once("db/dbconnect.php");
require_once("include/common.php");
$common = new common();

$page = "other";

// パラメータ
$region = "";
if(isset($_GET['region'])){
	$region = $_GET['region'];
}

// DB接続
$dbconnect = new dbconnect();
$pdo = $dbconnect->connect();

// 
function getMember($value){
	global $common,$pdo;

$sql = <<<EOT
	SELECT * FROM `Awecc` WHERE rank = '{$value}' ORDER BY day
EOT;
	$stmt = $pdo->query($sql);
	
	$i = 1;
	foreach($stmt AS $row){
echo <<<EOT
		<tr>
			<td>{$i}</td>
			<td>{$row['id']}</td>
			<td><a href='person.php?id={$row['id']}'>{$row['name']}</a></td>
			<td>{$common->showFlag($row['countryId'])}{$row['countryId']}</td>
			<td>{$row['HoWR']}</td>
			<td>{$row['HoCR']}</td>
			<td>{$row['WCPodium']}</td>
			<td>{$row['day']}</td>
		</tr>
EOT;
	$i ++;
	}
}

function getMissing(){
	global $common,$pdo;

$sql = <<<EOT
	SELECT A.* FROM
	(SELECT * FROM `Awecc` WHERE rank = 'Missing') A INNER JOIN
	(SELECT id,rank FROM `Events`) B ON A.lack = B.id
	ORDER BY B.rank,A.id
EOT;
	$stmt = $pdo->query($sql);
	
	$i = 1;
	foreach($stmt AS $row){
echo <<<EOT
		<tr>
			<td>{$i}</td>
			<td>{$row['id']}</td>
			<td><a href='person.php?id={$row['id']}'>{$row['name']}</a></td>
			<td>{$common->showFlag($row['countryId'])}{$row['countryId']}</td>
			<td>{$common->eventConvert($row['lack'])}</td>
		</tr>
EOT;
	$i ++;
	}
}

?>