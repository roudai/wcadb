<?php
require_once("db/dbconnect.php");
require_once("include/common.php");
$common = new common();

$page = "competitions";

// パラメータ
$id = "";
if(isset($_GET['id'])){
	$id = $_GET['id'];
}

// DB接続
$dbconnect = new dbconnect();
$pdo = $dbconnect->connect();

// 大会情報
function getCompetition(){
	global $common,$id,$pdo;
	global $Ldate,$Lcity,$Llink,$lang;
	$sql = "SELECT * FROM Competitions WHERE id = '" . $id . "'";
	$stmt = $pdo->query($sql);
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
    
	if($lang=='jp' AND is_null($row['jname']) == false){
		$competition = $row['jname'];
		$city = $row['jarea'];
	}else{
		$competition = $row['name'];
		$city = $row['cityName'];
	}
		
echo <<<EOT
	<h1 class = 'h3 text-center'>{$competition}</h1>
	<div class="table-responsive">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th class="col-md-4">{$Ldate[$lang]}</td>
					<th class="col-md-4">{$Lcity[$lang]}</td>
					<th class="col-md-4">WCA {$Llink[$lang]}</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>{$common->dateConvert($row['year'],$row['month'],$row['day'],$row['endMonth'],$row['endDay'])}</td>
					<td>{$common->showFlag($row['countryId'])}<strong>{$row['countryId']}</strong>, {$city}</td>
					<td><a href='https://www.worldcubeassociation.org/results/c.php?i={$row['id']}' target='_blank'>{$row['cellName']}</a></td>
				</tr>
			</tbody>
		</table>
	</div>
	<br />
EOT;
}

function countResults(){
	global $common,$id,$pdo;

	$sql = "SELECT COUNT(*) AS cnt FROM `Results` WHERE competitionId = '" . $id . "'";
	$stmt = $pdo->query($sql);
	$row = $stmt->fetch(PDO::FETCH_ASSOC);
	
	if($row['cnt'] == 0){
		return false;
	}else{
		return true;
	}
}

function countScrambles(){
	global $common,$id,$pdo;

	$sql = "SELECT COUNT(*) AS cnt FROM `Scrambles` WHERE competitionId = '" . $id . "'";
	$stmt = $pdo->query($sql);
	$row = $stmt->fetch(PDO::FETCH_ASSOC);
	
	if($row['cnt'] == 0){
		return false;
	}else{
		return true;
	}
}

// トップ3
function getWinner(){
	global $common,$id,$pdo;
	
$sql = <<<EOT
	SELECT A.eventId,A.formatId,
	       A.personCountryId AS country1,A.personName AS person1,A.personId AS id1,A.best AS best1,A.average AS average1,
	       B.personCountryId AS country2,B.personName AS person2,B.personId AS id2,B.best AS best2,B.average AS average2,
	       C.personCountryId AS country3,C.personName AS person3,C.personId AS id3,C.best AS best3,C.average AS average3 FROM 
	(SELECT eventId FROM `Results` WHERE competitionId = '{$id}' GROUP BY eventId) X
	LEFT OUTER JOIN (SELECT * FROM `Results` WHERE competitionId = '{$id}' AND roundId IN('c','f') AND pos = '1' AND best > 0) A ON A.eventId = X.eventId 
	LEFT OUTER JOIN (SELECT * FROM `Results` WHERE competitionId = '{$id}' AND roundId IN('c','f') AND pos = '2' AND best > 0) B ON B.eventId = X.eventId 
	LEFT OUTER JOIN (SELECT * FROM `Results` WHERE competitionId = '{$id}' AND roundId IN('c','f') AND pos = '3' AND best > 0) C ON C.eventId = X.eventId 
	INNER JOIN (SELECT * FROM `Events`) Z ON A.eventId = Z.id 
	ORDER BY Z.rank
EOT;
	$stmt = $pdo->query($sql);
	
	$prerow = null;
    foreach($stmt AS $row){
        echo "<tr>";
        if($row['eventId'] != $prerow['eventId']){
            echo "<td><b>" . $common->iconConvert($row['eventId']) . $common->eventConvert($row['eventId']) . "</b></td>\n";
        }else{
            echo "<td></td>\n";
        }
        if(is_null($row['person1']) == false AND ($row['person1'] != $prerow['person1'] or $row['eventId'] != $prerow['eventId'])){
            echo "<td>{$common->showFlag($row['country1'])}<a href='person.php?id=" . $row['id1'] . "'>" . $row['person1'] . "</a></td>\n";
            if($row['formatId'] == 'a' or $row['formatId'] == 'm'){
                echo "<td>" . $common->resultConvert($row['eventId'],$row['average1'],true) . "</td>\n";
            }else{
                echo "<td>" . $common->resultConvert($row['eventId'],$row['best1']) . "</td>\n"; 
            }            
        }else{
            echo "<td></td><td></td>\n";
        }        
        if(is_null($row['person2']) == false AND ($row['person2'] != $prerow['person2'] or $row['eventId'] != $prerow['eventId'])){
            echo "<td>{$common->showFlag($row['country2'])}<a href='person.php?id=" . $row['id2'] . "'>" . $row['person2'] . "</a></td>\n";
            if($row['formatId'] == 'a' or $row['formatId'] == 'm'){
                echo "<td>" . $common->resultConvert($row['eventId'],$row['average2'],true) . "</td>\n";
            }else{
                echo "<td>" . $common->resultConvert($row['eventId'],$row['best2']) . "</td>\n"; 
            }            
        }else{
            echo "<td></td><td></td>";
        } 
        if(is_null($row['person3']) == false AND ($row['person3'] != $prerow['person3'] or $row['eventId'] != $prerow['eventId'])){
            echo "<td>{$common->showFlag($row['country3'])}<a href='person.php?id=" . $row['id3'] . "'>" . $row['person3'] . "</a></td>\n";
            if($row['formatId'] == 'a' or $row['formatId'] == 'm'){
                echo "<td>" . $common->resultConvert($row['eventId'],$row['average3'],true) . "</td>\n";
            }else{
                echo "<td>" . $common->resultConvert($row['eventId'],$row['best3']) . "</td>\n"; 
            }            
        }else{
            echo "<td></td><td></td>\n";
        } 
        echo "</tr>\n";
        $prerow = $row;
    }
}

function getAllResults(){
	global $common,$id,$pdo;
	global $Lplace,$Lperson,$Lbest,$Laverage,$Lregion2,$LresultDetails,$lang;
	
$sql_round = <<<EOT
	SELECT A.* FROM
	(SELECT `eventId`,`roundId`,`formatId` FROM `Results` WHERE `competitionId` =  '{$id}' GROUP BY `eventId`, `roundId`) A
	INNER JOIN (SELECT `id`, `rank` FROM `Events`) B ON A.eventId = B.id
	INNER JOIN (SELECT `id`, `rank` FROM `Rounds`) C ON A.roundId = C.id
	ORDER BY B.rank, C.rank
EOT;
	$stmt_round = $pdo->query($sql_round);

	$i = 1;
	foreach($stmt_round AS $row_round){
$sql_results = <<<EOT
		SELECT * FROM `Results` WHERE competitionId ='{$id}' AND eventId = '{$row_round['eventId']}' AND roundId = '{$row_round['roundId']}' 
		ORDER BY pos
EOT;
		$stmt_results = $pdo->query($sql_results);
echo <<<EOT
		<div class="panel panel-default">
			<a class="list-group-item" data-toggle="collapse" data-parent="#accordion1" href="#collapse1{$i}">
				{$common->iconConvert($row_round['eventId'])}
				<strong>{$common->eventConvert($row_round['eventId'])}</strong> &nbsp;
				{$common->roundConvert($row_round['roundId'])} &nbsp;
				({$common->formatConvert($row_round['formatId'])})
			</a>
			<div id="collapse1{$i}" class="panel-collapse collapse">
				<div class="panel-body">
					<div class="table-responsive">
						<table class="table table-striped table-hover table-condensed">
							<thead>
								<tr>
									<th>{$Lplace[$lang]}</th>
									<th>{$Lperson[$lang]}</th>
									<th>{$Lbest[$lang]}</th>
									<th>{$Laverage[$lang]}</th>
									<th>{$Lregion2[$lang]}</th>
									<th colspan="5">{$LresultDetails[$lang]}</th>
								</tr>
							</thead>
							<tbody>
EOT;
		foreach($stmt_results as $row_results){
echo <<<EOT
								<tr>
									<td>{$row_results['pos']}</td>
									<td><a href='person.php?id={$row_results['personId']}'>{$row_results['personName']}</a></td>
									<td>{$common->resultConvert($row_round['eventId'],$row_results['best'])} &nbsp;
									    <span class="text-info"><strong>{$row_results['regionalSingleRecord']}</strong></sn></td>
									<td>{$common->resultConvert($row_round['eventId'],$row_results['average'],true)} &nbsp;
									    <span class="text-info"><strong>{$row_results['regionalAverageRecord']}</strong></span></td>
									<td>{$common->showFlag($row_results['personCountryId'])}{$row_results['personCountryId']}</td>
									<td>{$common->resultConvert($row_round['eventId'],$row_results['value1'])}</td>
									<td>{$common->resultConvert($row_round['eventId'],$row_results['value2'])}</td>
									<td>{$common->resultConvert($row_round['eventId'],$row_results['value3'])}</td>
									<td>{$common->resultConvert($row_round['eventId'],$row_results['value4'])}</td>
									<td>{$common->resultConvert($row_round['eventId'],$row_results['value5'])}</td>
								</tr>
EOT;
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

function getScrambles(){
	global $common,$id,$pdo;
	global $Lgroup,$Lscramble,$lang;

$sql_round = <<<EOT
	SELECT A.* FROM
	(SELECT `eventId`,`roundId` FROM `Scrambles` WHERE `competitionId` = '{$id}' GROUP BY `eventId`, `roundId`) A
	INNER JOIN (SELECT `id`, `rank` FROM `Events`) B ON A.eventId = B.id
	INNER JOIN (SELECT `id`, `rank` FROM `Rounds`) C ON A.roundId = C.id
	ORDER BY B.rank, C.rank
EOT;
	$stmt_round = $pdo->query($sql_round);

	$i = 1;
	foreach($stmt_round AS $row_round){
$sql_scrambles = <<<EOT
		SELECT * FROM `Scrambles` WHERE competitionId ='{$id}' AND eventId = '{$row_round['eventId']}' AND roundId = '{$row_round['roundId']}' 
		ORDER BY groupId,isExtra,scrambleNum
EOT;
		$stmt_scrambles = $pdo->query($sql_scrambles);
echo <<<EOT
		<div class="panel panel-default">
			<a class="list-group-item" data-toggle="collapse" data-parent="#accordion2" href="#collapse2{$i}">
				{$common->iconConvert($row_round['eventId'])} 
				<strong>{$common->eventConvert($row_round['eventId'])}</strong> &nbsp;
				{$common->roundConvert($row_round['roundId'])}
			</a>
			<div id="collapse2{$i}" class="panel-collapse collapse">
				<div class="panel-body">
					<div class="table-responsive">
						<table class="table table-striped table-hover table-condensed">
							<thead>
								<tr>
									<th>{$Lgroup[$lang]}</th>
									<th>No.</th>
									<th>{$Lscramble[$lang]}</th>
								</tr>
							</thead>
							<tbody>
EOT;
		foreach($stmt_scrambles as $row_scrambles){
			if ($row_scrambles['isExtra'] == 0){ $scrType = '#'; }else{ $scrType = 'Ex#'; };
echo <<<EOT
								<tr>
									<td>{$row_scrambles['groupId']}</td>
									<td>{$scrType}{$row_scrambles['scrambleNum']}</td>
									<td>{$row_scrambles['scramble']}</td>
								</tr>
EOT;
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

function getPersons(){
	global $common,$id,$pdo;
	global $Levent,$Lround,$Lplace,$Lbest,$Laverage,$LresultDetails,$lang;

$sql_person = <<<EOT
	SELECT personId,personName,personCountryId FROM `Results` WHERE competitionId = '{$id}' 
	GROUP BY personId ORDER BY personName
EOT;
	$stmt_person = $pdo->query($sql_person);

	$i = 1;
	foreach($stmt_person AS $row_person){
$sql = <<<EOT
	SELECT A.* FROM
	(SELECT * FROM `Results` WHERE competitionId ='{$id}' AND personId = '{$row_person['personId']}') A 
	INNER JOIN (SELECT id,rank FROM `Events`) B ON A.eventId = B.id
	INNER JOIN (SELECT id,rank FROM `Rounds`) C	ON A.roundId = C.id
	ORDER BY A.year DESC,A.month DESC,A.day DESC,B.rank,C.rank DESC
EOT;
		$stmt = $pdo->query($sql);
echo <<<EOT
	<div class="panel panel-default">
		<a class="list-group-item" data-toggle="collapse" data-parent="#accordion3" href="#collapse3{$i}">
			<strong>{$row_person['personName']}</strong> &nbsp; {$common->showFlag($row_person['personCountryId'])}{$row_person['personCountryId']}
		</a>
		<div id="collapse3{$i}" class="panel-collapse collapse">
			<div class="panel-body">
			<span class='pull-right'><a href=./person.php?id={$row_person['personId']}>{$row_person['personName']}</a></span>
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
								<td>{$common->eventConvert($eventId,true)}</td>
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
?>