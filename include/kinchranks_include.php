<?php
require_once("db/dbconnect.php");
require_once("include/common.php");
$common = new common();

$page = "other";

// パラメータ
$kinch = "";
$region = "";
$gender = "";
$show = "";
if(isset($_GET['kinch'])){
	$kinch = $_GET['kinch'];
}
if(isset($_GET['region'])){
	$region = $_GET['region'];
}
if(isset($_GET['gender'])){
	$gender = $_GET['gender'];
}
if(isset($_GET['show'])){
	$show = $_GET['show'];
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

function getKinchRanks(){
  global $common,$pdo,$region,$gender,$show,$kinch,$type,$lang;

	$sql = getSql();
	$stmt = $pdo->query($sql);

	$i = 1;
	$preScore = "";
	foreach($stmt AS $row){

		if($kinch == 'all' or $show == ''){
			$score = $row['Score'];
			$s333  = $row['333'];  $s444   = $row['444'];   $s555 = $row['555'];     $s222   = $row['222'];   $s333oh = $row['333oh']; $s333ft  = $row['333ft'];
			$sMinx = $row['minx']; $sPyram = $row['pyram']; $sSq1 = $row['sq1'];     $sClock = $row['clock']; $sSkewb = $row['skewb']; $s666    = $row['666'];
			$s777  = $row['777'];  $s333bf = $row['333bf']; $s333fm = $row['333fm']; $s444bf = $row['444bf']; $s555bf = $row['555bf']; $s333mbf = $row['333mbf'];
		}elseif($kinch == 'main'){
			$score = $row['ScoreMain'];
			$s333  = $row['333'];  $s444   = $row['444'];   $s555 = $row['555'];     $s222   = $row['222'];   $s333oh = "0.00";        $s333ft  = "0.00";
			$sMinx = "0.00";       $sPyram = "0.00";        $sSq1 = "0.00";          $sClock = "0.00";        $sSkewb = "0.00";        $s666    = "0.00";
			$s777  = "0.00";       $s333bf = "0.00";        $s333fm = "0.00";        $s444bf = "0.00";        $s555bf = "0.00";        $s333mbf = "0.00";
		}elseif($kinch == '333'){
			$score = $row['Score333'];
			$s333  = $row['333'];  $s444   = "0.00";        $s555 = "0.00";          $s222   = "0.00";        $s333oh = $row['333oh']; $s333ft  = $row['333ft'];
			$sMinx = "0.00";       $sPyram = "0.00";        $sSq1 = "0.00";          $sClock = "0.00";        $sSkewb = "0.00";        $s666    = "0.00";
			$s777  = "0.00";       $s333bf = $row['333bf']; $s333fm = $row['333fm']; $s444bf = "0.00";        $s555bf = "0.00";        $s333mbf = "0.00";
		}elseif($kinch == 'big'){
			$score = $row['ScoreBig'];
			$s333  = "0.00";       $s444   = "0.00";        $s555 = $row['555'];     $s222   = "0.00";        $s333oh = "0.00";        $s333ft  = "0.00";
			$sMinx = "0.00";       $sPyram = "0.00";        $sSq1 = "0.00";          $sClock = "0.00";        $sSkewb = "0.00";        $s666    = $row['666'];
			$s777  = $row['777'];  $s333bf = "0.00";        $s333fm = "0.00";        $s444bf = "0.00";        $s555bf = "0.00";        $s333mbf = "0.00";
		}elseif($kinch == 'bld'){
			$score = $row['ScoreBld'];
			$s333  = "0.00";       $s444   = "0.00";        $s555 = "0.00";          $s222   = "0.00";        $s333oh = "0.00";        $s333ft  = "0.00";
			$sMinx = "0.00";       $sPyram = "0.00";        $sSq1 = "0.00";          $sClock = "0.00";        $sSkewb = "0.00";        $s666    = "0.00";
			$s777  = "0.00";       $s333bf = $row['333bf']; $s333fm = "0.00";        $s444bf = $row['444bf']; $s555bf = $row['555bf']; $s333mbf = $row['333mbf'];
		}elseif($kinch == 'var'){
			$score = $row['ScoreVar'];
			$s333  = "0.00";       $s444   = "0.00";        $s555 = "0.00";          $s222   = "0.00";        $s333oh = "0.00";        $s333ft  = "0.00";
			$sMinx = $row['minx']; $sPyram = $row['pyram']; $sSq1 = $row['sq1'];     $sClock = $row['clock']; $sSkewb = $row['skewb']; $s666    = "0.00";
			$s777  = "0.00";       $s333bf = "0.00";        $s333fm = "0.00";        $s444bf = "0.00";        $s555bf = "0.00";        $s333mbf = "0.00";
		}
	
		if ($score == $preScore){
			$rank = "";
		}elseif((($show == '100' or $show == '') AND $i > 100) OR ($show == 1000 AND $i > 1000)){
			break;
		}else{
			$rank = $i;	
		}
echo <<<EOT
		<tr>
			<td>{$rank}</td>
			<td>{$common->showFlag($row['countryId'])}<a href='person.php?id={$row['personId']}'>{$row['name']}</a></td>
			<td><span class='text-warning'><strong>{$common->scoreColor($score)}</strong></span></td>
			<td class='text-right'>{$common->scoreColor($s333)}</td>
			<td class='text-right'>{$common->scoreColor($s444)}</td>
			<td class='text-right'>{$common->scoreColor($s555)}</td>
			<td class='text-right'>{$common->scoreColor($s222)}</td>
			<td class='text-right'>{$common->scoreColor($s333oh)}</td>
			<td class='text-right'>{$common->scoreColor($s333ft)}</td>
			<td class='text-right'>{$common->scoreColor($sMinx)}</td>
			<td class='text-right'>{$common->scoreColor($sPyram)}</td>
			<td class='text-right'>{$common->scoreColor($sSq1)}</td>
			<td class='text-right'>{$common->scoreColor($sClock)}</td>
			<td class='text-right'>{$common->scoreColor($sSkewb)}</td>
			<td class='text-right'>{$common->scoreColor($s666)}</td>
			<td class='text-right'>{$common->scoreColor($s777)}</td>
			<td class='text-right'>{$common->scoreColor($s333bf)}</td>
			<td class='text-right'>{$common->scoreColor($s333fm)}</td>
			<td class='text-right'>{$common->scoreColor($s444bf)}</td>
			<td class='text-right'>{$common->scoreColor($s555bf)}</td>
			<td class='text-right'>{$common->scoreColor($s333mbf)}</td>
		</tr>
EOT;
	$preScore = $score;
	$preRank = $rank;
	$i ++;
	}
  		
}

function getSql(){
	global $region,$events,$gender,$show,$kinch,$type,$lang;

	if(($lang=='en' AND ($region=='World' or $region=='')) OR ($lang=='jp' AND $region=='World')){
		$countrySql = "TRUE ";
	}elseif($lang=='jp' AND $region==''){
		$countrySql = "countryId = 'Japan' ";
	}elseif(substr($region,0,1) == '_'){
		$countrySql = "continentId = '" . $region . "' ";
	}else{
		$countrySql = "countryId = '" . $region . "' ";
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
	}
	
	if($kinch == 'all' or $show == ''){
		$score = "Score";
	}elseif($kinch == 'main'){
		$score = "ScoreMain";
	}elseif($kinch == '333'){
		$score = "Score333";
	}elseif($kinch == 'big'){
		$score = "ScoreBig";
	}elseif($kinch == 'bld'){
		$score = "ScoreBld";
	}elseif($kinch == 'var'){
		$score = "ScoreVar";
	}
	
	if(($lang=='en' AND ($region=='World' or $region=='')) OR ($lang=='jp' AND $region=='World')){
		if($gender == 'all' or $gender == ''){
			$table = "KinchRanksWorld";
		}elseif($gender == 'female'){
			$table = "KinchRanksWorldFemale";
		}elseif($gender == 'male'){
			$table = "KinchRanksWorldMale";
		}
	}elseif($lang=='jp' AND $region==''){
		if($gender == 'all' or $gender == ''){
			$table = "KinchRanksRegion";
		}elseif($gender == 'female'){
			$table = "KinchRanksRegionFemale";
		}elseif($gender == 'male'){
			$table = "KinchRanksRegionMale";
		}
	}elseif(substr($region,0,1) == '_'){
		if($gender == 'all' or $gender == ''){
			$table = "KinchRanksContinent";
		}elseif($gender == 'female'){
			$table = "KinchRanksContinentFemale";
		}elseif($gender == 'male'){
			$table = "KinchRanksContinentMale";
		}
	}else{
		if($gender == 'all' or $gender == ''){
			$table = "KinchRanksRegion";
		}elseif($gender == 'female'){
			$table = "KinchRanksRegionFemale";
		}elseif($gender == 'male'){
			$table = "KinchRanksRegionMale";
		}
	}
	return "SELECT * FROM `" . $table . "` WHERE " . $countrySql . $genderSql . "AND " . $score . " <> 0 ORDER BY " . $score . " DESC,name " . $showSql;
}

?>
