<?php
require_once("db/dbconnect.php");
require_once("include/common.php");
$common = new common();

$page = "other";

// DB接続
$dbconnect = new dbconnect();
$pdo = $dbconnect->connect();
	
// 
function getJdata(){
	global $common,$pdo;
	global $lang,$Ltype,$Lrecord,$Lperson,$Lregion2,$Lcompetition,$Ldate,$Lsingle,$Laverage;

$sql = <<<EOT
	SELECT A.id,B.jname,B.jarea,A.year,A.month,A.day,A.endMonth,A.endDay FROM
	(SELECT id,year,month,day,endMonth,endDay FROM `Competitions` WHERE countryId = 'Japan') A LEFT OUTER JOIN
	(SELECT id,jname,jarea FROM `JCompetitions`) B ON A.id = B.id
	ORDER BY A.year DESC,A.month DESC,A.day DESC
EOT;
	$stmt = $pdo->query($sql);

	foreach($stmt AS $row){
echo <<<EOT
		<tr>
			<td>{$common->dateConvert($row['year'],$row['month'],$row['day'],$row['endMonth'],$row['endDay'])}</td>
			<td>{$row['id']}</td>
			<td>{$row['jname']}</td>
			<td>{$row['jarea']}</td>
		</tr>
EOT;
	}
}
?>