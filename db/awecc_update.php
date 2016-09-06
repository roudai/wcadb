<?php
require_once("dbconnect_tmp.php");

// DB接続
$dbconnect = new dbconnect();
$pdo = $dbconnect->connect();

$sql = "SELECT * FROM `Awecc` WHERE `rank` = 'Bronze'";
$stmt = $pdo->query($sql);

foreach($stmt as $row){
        $sql_day = "SELECT MAX(`FirstDay`) AS `LastDay` FROM( ";
        $sql_day .= "SELECT A.`eventId`,MIN(B.`date`) AS `FirstDay` FROM ";
        $sql_day .= "(SELECT `competitionId`,`eventId`,`best`,`personId` FROM `Results` WHERE `personId` = '" . $row['id'] . "' AND `best` <> '-1') A ";
        $sql_day .= "INNER JOIN (SELECT `id`,CAST(CONCAT(CAST(`year` AS CHAR),'-',CAST(`endMonth` AS CHAR),'-',CAST(`endDay` AS CHAR)) AS DATE) AS date FROM `Competitions`) B ";
        $sql_day .= "ON A.`competitionId` = B.`id` ";
        $sql_day .= "GROUP BY `eventId`) AS FirstTable";

        $stmt_day = $pdo->query($sql_day);
        $row_day = $stmt_day->fetch(PDO::FETCH_ASSOC);

        $sql_update = "UPDATE `Awecc` SET day = '" . $row_day['LastDay'] . "' WHERE id = '" . $row['id'] . "'";
        $stmt_update = $pdo->query($sql_update);
}

$sql = "SELECT * FROM `Awecc` WHERE rank IN('Gold','Platinum')";
$stmt = $pdo->query($sql);

foreach($stmt as $row){
        $sql_day1 = "SELECT MAX(`FirstDay`) AS `LastDay` FROM( ";
        $sql_day1 .= "SELECT A.`eventId`,MIN(B.`date`) AS `FirstDay` FROM ";
        $sql_day1 .= "(SELECT `competitionId`,`eventId`,`average`,`personId` FROM `Results` WHERE `personId` = '" .$row['id'] . "' AND `average` NOT IN('-1','0') ";
        $sql_day1 .= "AND `eventId` IN('222','333','333bf','333fm','333ft','333oh','444','555','666','777','clock','minx','pyram','skewb','sq1')) A ";
        $sql_day1 .= "INNER JOIN (SELECT `id`,CAST(CONCAT(CAST(`year` AS CHAR),'-',CAST(`endMonth` AS CHAR),'-',CAST(`endDay` AS CHAR)) AS DATE) AS date FROM `Competitions`) B ";
        $sql_day1 .= "ON A.`competitionId` = B.`id` ";
        $sql_day1 .= "GROUP BY `eventId`) AS FirstTable ";

        $stmt_day1 = $pdo->query($sql_day1);
        $row_day1 = $stmt_day1->fetch(PDO::FETCH_ASSOC);

        $sql_day2 = "SELECT MAX(`FirstDay`) AS `LastDay` FROM( ";
        $sql_day2 .= "SELECT A.`eventId`,MIN(B.`date`) AS `FirstDay` FROM ";
        $sql_day2 .= "(SELECT `competitionId`,`eventId`,`best`,`personId` FROM `Results` WHERE `personId` = '" .$row['id'] . "' AND `best` <> '-1' ";
        $sql_day2 .= "AND `eventId` IN('333mbf','444bf','555bf')) A ";
        $sql_day2 .= "INNER JOIN (SELECT `id`,CAST(CONCAT(CAST(`year` AS CHAR),'-',CAST(`endMonth` AS CHAR),'-',CAST(`endDay` AS CHAR)) AS DATE) AS date FROM `Competitions`) B ";
        $sql_day2 .= "ON A.`competitionId` = B.`id` ";
        $sql_day2 .= "GROUP BY `eventId`) AS FirstTable ";

        $stmt_day2 = $pdo->query($sql_day2);
        $row_day2 = $stmt_day2->fetch(PDO::FETCH_ASSOC);

        if($row['rank']=="Platinum"){
                $sql_day3 = "SELECT MIN(B.`edate`) AS `FirstDay` FROM( ";
                $sql_day3 .= "SELECT `competitionId` FROM `Results` WHERE ";
                $sql_day3 .= "personId = '" .$row['id'] ."' AND (`competitionId` LIKE 'WC%' AND pos IN('1','2','3') AND `best` <> '-1' AND `roundId` IN('c','f')) ";
                $sql_day3 .= "GROUP BY `competitionId`) A ";
                $sql_day3 .= "INNER JOIN (SELECT `id`,CAST(CONCAT(`year`,'-',`endMonth`,'-',`endDay`) AS DATE) AS edate FROM `Competitions`) B ";
                $sql_day3 .= "ON A.`competitionId` = B.`id`";

                $stmt_day3 = $pdo->query($sql_day3);
                $row_day3 = $stmt_day3->fetch(PDO::FETCH_ASSOC);
                
                $sql_day4 = "SELECT MIN(B.`edate`) AS `FirstDay` FROM( ";
                $sql_day4 .= "SELECT `competitionId` FROM `Results` WHERE ";
                $sql_day4 .= "(`personId` = '" .$row['id'] ."' AND (`regionalSingleRecord` = 'WR' OR `regionalAverageRecord` = 'WR')) ";
                $sql_day4 .= "GROUP BY `competitionId`) A ";
                $sql_day4 .= "INNER JOIN (SELECT `id`,CAST(CONCAT(`year`,'-',`endMonth`,'-',endDay) AS DATE) AS edate FROM `Competitions`) B ";
                $sql_day4 .= "ON A.`competitionId` = B.`id`";

                $stmt_day4 = $pdo->query($sql_day4);
                $row_day4 = $stmt_day4->fetch(PDO::FETCH_ASSOC);
                
                $sql_day5 = "SELECT MIN(B.`edate`) AS `FirstDay` FROM( ";
                $sql_day5 .= "SELECT `competitionId` FROM `Results` WHERE ";
                $sql_day5 .= "`personId` = '" .$row['id'] ."' AND (`regionalSingleRecord` IN('AfR','AsR','ER','NAR','OcR','SAR') OR `regionalAverageRecord` IN('AfR','AsR','ER','NAR','OcR','SAR')) ";
                $sql_day5 .= "GROUP BY `competitionId`) A ";
                $sql_day5 .= "INNER JOIN (SELECT `id`,CAST(CONCAT(`year`,'-',`endMonth`,'-',`endDay`) AS DATE) AS edate FROM `Competitions`) B ";
                $sql_day5 .= "ON A.`competitionId` = B.`id`";

                $stmt_day5 = $pdo->query($sql_day5);
                $row_day5 = $stmt_day5->fetch(PDO::FETCH_ASSOC);
        }

        if($row['rank'] == "Platinum"){
                $LastDay = max($row_day1['LastDay'] ,$row_day2['LastDay'] ,$row_day3['FirstDay'] ,$row_day4['FirstDay'] ,$row_day5['FirstDay']);
        }else{
                $LastDay = max($row_day1['LastDay'] ,$row_day2['LastDay']);
        }

        $sql_update = "UPDATE `Awecc` SET `day` = '" . $LastDay . "' WHERE `id` = '" . $row['id'] . "'";
        $stmt_update = $pdo->query($sql_update);
}

$sql = "SELECT * FROM `Awecc` WHERE rank = 'Missing'";
$stmt = $pdo->query($sql);

// Goldのうち、HoWR、HoCR、WCPodiumがすべてない人をSilverにする。
        $sql_update = "UPDATE `Awecc` SET rank = 'Silver' WHERE rank = 'Gold' AND (HoWR is null AND HoCR is null AND WCPodium is null)";
        $stmt_update = $pdo->query($sql_update);
		
$sql = "SELECT * FROM `Awecc` WHERE rank = 'Missing'";
$stmt = $pdo->query($sql);

foreach($stmt as $row){
        $sql_lack = "SELECT A.`id` AS lack FROM ";
        $sql_lack .= "(SELECT `id` FROM `Events` WHERE `rank` < '990') A ";
        $sql_lack .= "LEFT OUTER JOIN (SELECT `eventId` FROM `RanksSingle` WHERE `personId` = '" .$row['id'] . "') B ";
        $sql_lack .= "on A.`id` = B.`eventId` WHERE B.`eventId` IS NULL";

        $stmt_lack = $pdo->query($sql_lack);
        $row_lack = $stmt_lack->fetch(PDO::FETCH_ASSOC);
		
	$sql_update = "UPDATE `Awecc` SET lack = '" . $row_lack['lack'] . "' WHERE id = '" . $row['id'] . "'";
        $stmt_update = $pdo->query($sql_update);
}

?>
