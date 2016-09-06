<?php
require_once("include/language.php");
class common{
	public function dateConvert($year,$month,$day,$endMonth,$endDay){
		if($month != $endMonth){
			return $year . "-" . $month . "-" . $day . "~" . $endMonth . "-" . $endDay;
		}elseif($day != $endDay){
			return $year . "-" . $month . "-" . $day . "~" . $endDay;
		}else{
			return $year . "-" . $month . "-" . $day;
		}
	}
	
	public function iconConvert($value){
		switch ($value){
			case "333": return "<span class='cubing-icon icon-333'></span> &nbsp;";
			case "444": return "<span class='cubing-icon icon-444'></span> &nbsp;";
			case "555": return "<span class='cubing-icon icon-555'></span> &nbsp;";
			case "222": return "<span class='cubing-icon icon-222'></span> &nbsp;";
			case "333bf": return "<span class='cubing-icon icon-333bf'></span> &nbsp;";
			case "333oh": return "<span class='cubing-icon icon-333oh'></span> &nbsp;";
			case "333fm": return "<span class='cubing-icon icon-333fm'></span> &nbsp;";
			case "333ft": return "<span class='cubing-icon icon-333ft'></span> &nbsp;";
			case "minx": return "<span class='cubing-icon icon-minx'></span> &nbsp;";
			case "pyram": return "<span class='cubing-icon icon-pyram'></span> &nbsp;";
			case "sq1": return "<span class='cubing-icon icon-sq1'></span> &nbsp;";
			case "clock": return "<span class='cubing-icon icon-clock'></span> &nbsp;";
			case "skewb": return "<span class='cubing-icon icon-skewb'></span> &nbsp;";
			case "666": return "<span class='cubing-icon icon-666'></span> &nbsp;";
			case "777": return "<span class='cubing-icon icon-777'></span> &nbsp;";
			case "444bf": return "<span class='cubing-icon icon-444bf'></span> &nbsp;";
			case "555bf": return "<span class='cubing-icon icon-555bf'></span> &nbsp;";
			case "333mbf": return "<span class='cubing-icon icon-333mbf'></span> &nbsp;";
			case "magic": return "&nbsp; &nbsp; &nbsp; &nbsp;";
			case "mmagic": return "&nbsp; &nbsp; &nbsp; &nbsp;";
			case "333mbo": return "<span class='cubing-icon icon-333mbf'></span> &nbsp;";
		}
	}	

	public function genderConvert($value){
		global $lang,$Lmale,$Lfemale;
		switch ($value){
			case "m": return $Lmale[$lang];
			case "f": return $Lfemale[$lang];
		}
	}
	
	public function eventConvert($value,$link = false){
	global $lang,$event333,$event444,$event555,$event222,$event333bf,$event333oh,$event333fm,$event333ft,$eventMinx,$eventPyram,$eventSq1,$eventClock,$eventSkewb,$event666,$event777,$event444bf,$event555bf,$event333mbf,$eventMagic,$eventMmagic,$event333mbo;
		$res = "";
		if($link){
			switch ($value){
				case "magic": case "mmagic": case "333mbo":
					$res = ""; break;
				default :
					$res = "<a href='/rankings.php?events=" . $value . "'>"; break;
			}
		}
		switch ($value){
			case "333": $res .= $event333[$lang]; break;
			case "444": $res .= $event444[$lang]; break;
			case "555": $res .= $event555[$lang]; break;
			case "222": $res .= $event222[$lang]; break;
			case "333bf": $res .= $event333bf[$lang]; break;
			case "333oh": $res .= $event333oh[$lang]; break;
			case "333fm": $res .= $event333fm[$lang]; break;
			case "333ft": $res .= $event333ft[$lang]; break;
			case "minx": $res .= $eventMinx[$lang]; break;
			case "pyram": $res .= $eventPyram[$lang]; break;
			case "sq1": $res .= $eventSq1[$lang]; break;
			case "clock": $res .= $eventClock[$lang]; break;
			case "skewb": $res .= $eventSkewb[$lang]; break;
			case "666": $res .= $event666[$lang]; break;
			case "777": $res .= $event777[$lang]; break;
			case "444bf": $res .= $event444bf[$lang]; break;
			case "555bf": $res .= $event555bf[$lang]; break;
			case "333mbf": $res .= $event333mbf[$lang]; break;
			case "magic": $res .= $eventMagic[$lang]; break;
			case "mmagic": $res .= $eventMmagic[$lang]; break;
			case "333mbo": $res .= $event333mbo[$lang]; break;
		}
		if($link){
			switch ($value){
				case "magic": case "mmagic": case "333mbo":
					$res .= ""; break;
				default :
					$res .= "</a>"; break;
			}
		}
		return $res;
	}
	
	public function formatConvert($value){
		switch ($value){
			case "1": return "Best of 1";
			case "2": return "Best of 2";
			case "3": return "Best of 3";
			case "a": return "Average of 5";
			case "m": return "Mean of 3";
		}
	}
	
	public function roundConvert($value){
		global $lang,$roundH,$round0,$roundD,$round1,$roundB,$round2,$roundE,$roundG,$round3,$roundC,$roundF;
		switch ($value){
			case "h": return $roundH[$lang];
			case "0": return $round0[$lang];
			case "d": return $roundD[$lang];
			case "1": return $round1[$lang];
			case "b": return $roundB[$lang];
			case "2": return $round2[$lang];
			case "e": return $roundE[$lang];
			case "g": return $roundG[$lang];
			case "3": return $round3[$lang];
			case "c": return $roundC[$lang];
			case "f": return $roundF[$lang];
		}
	}

	public function resultConvert($eventId,$value,$average=false){
		switch ($value){
			case "": case "0": return "";
			case "-1": return "DNF";
			case "-2": return "DNS";
			default: 
				switch ($eventId) {
					case "333fm": 
						if($average==true){
							$millisec = $value % 100;
							$seconds = floor($value/100);
							return sprintf("%d.%02d", $seconds, $millisec);
						} else {
							return $value;
						}
					case "333mbf":
						$difference = 99 - substr($value, 0, 2);
						$timeInSeconds = $this->timeConvertMbld(substr($value, 2, 5));
						$missed = substr($value,7,2);
						$solved = $difference + $missed;
						$attempted = $solved + $missed;
						return $solved ."/" .$attempted . " " .$timeInSeconds;
					case "333mbo":
						if(strlen($value) == 9){
							$solved = 99 - intval(substr($value, 0, 2));
							$attempted = intval(substr($value, 2, 2));
							$time = intval(substr($value, 4, 5));	
							$difference = 99 - substr($value, 0, 2);
							$timeInSeconds = $this->timeConvertMbld(substr($value, 2, 5));
							$missed = substr($value,7,2);
							$solved = $difference + $missed;
							$attempted = $solved + $missed;
							return $solved ."/" .$attempted . " " .$timeInSeconds;
						}else{
							$solved = 99 - intval(substr($value, 1, 2));
							$attempted = intval(substr($value, 3, 2));
							$time = intval(substr($value, 5, 5));
							$timeInSeconds = $this->timeConvertMbld($time, true);
							return $solved ."/" .$attempted . " " .$timeInSeconds;
						}
					default: return $this->timeConvert($value);
				}
		}
	}
	
	private function timeConvert($value) {
		$millisec = $value % 100;
		$seconds_total = floor($value/100);
		$seconds = $seconds_total % 60;
		$minutes = floor(($seconds_total / 60) % 60);
		
		if ($minutes == 0) {
			return sprintf("%d.%02d", $seconds, $millisec);
		} else {
			return sprintf("%d:%02d.%02d", $minutes, $seconds, $millisec);
		}
	}

	private function timeConvertMbld($value,$old=false) {
		$seconds = $value % 60;
		$minutes = floor(($value / 60) % 60);
		$hour = floor(($value / 3600) % 60);
		if ($value == "03600"){
			return "1:00:00";	
		} else {
			if( $hour == 0){
				return sprintf("%d:%02d", $minutes, $seconds);
			} else {
				return sprintf("%d:%02d:%02d", $hour, $minutes, $seconds);
			}
		}	
	}
	
	public function rankColorConvert($value){
		if($value > 10){
			return $value;
		}else{
			return "<p class='text-warning'>" . $value . "</p>";
		}
	}
	
	public function showFlag($value){
		switch ($value) {
		    case "XA":
		    case "XE":
		    case "XN":
		    case "XO":
		    case "XS":
		        return "";
		        break;
		    default:
		        return "<img src='./img/flags/" . $value . ".png' /> &nbsp;"; 
		        break;
		}

	}
	
	public function scoreColor($score){
		if($score == 100){
			return "<span class='text-danger'>" . $score . "</>";	
		}elseif($score == 0){
			return "<span class='text-muted'>" . $score . "</>";	
		}else{
			return $score;
		}
	}

}
?>
