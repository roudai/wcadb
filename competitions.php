<?php
require_once("include/competitions_include.php");
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<?php include 'include/header.php'; ?>
</head>
<body>
	<?php include_once("include/analyticstracking.php") ?>
	<div class="container">
	<!-- ナビゲーションバー -->
	<?php include 'include/navbar.php'; ?>

	<!-- フォーム -->
	<form class="form-inline" action="" method="get">
		<!-- 年 -->
		<div class="form-group">
			<label><?php echo $Lyear[$lang] ?></label>
			<SELECT class = "form-control" name = "year">
				<OPTION value="0"><?php echo $Lall[$lang] ?></OPTION>
				<OPTION value='1' <?php if($year=="1" OR $year=="") echo selected; ?>><?php echo $Lcurrent[$lang] ?></OPTION>
				<?php getYear() ?>
			</SELECT>
		</div>
		<!-- 地域 -->
		<div class="form-group">
			<label><?php echo $Lregion[$lang] ?></label>
			<SELECT class = "form-control" name = "region">
				<OPTION value = 'World'>World</OPTION>
				<optgroup label="<?php echo $Lcontinents[$lang] ?>">
					<?php getContinents() ?>
				</optgroup>
				<optgroup label="<?php echo $Lcountries[$lang] ?>">
					<?php getCountries() ?>
				</optgroup>
			</SELECT>
		</div>
		<!-- 検索条件 -->
		<div class="form-group">
			<label><?php echo $Lcname[$lang] ?>,<?php echo $Lcountry[$lang] ?>,<?php echo $Lcity[$lang] ?></label>
			<input type='text' class='form-control' name='search' value='<?php echo $search; ?>'>
		</div>
		<button type="submit" class="btn btn-primary form-control-static"><?php echo $Lsubmit[$lang] ; ?></button>
	</form>
	
	<!-- 大会一覧 -->
	<?php if(countCompetitions()){ ?>
	<div class="table-responsive">
		<table class="table table-striped table-hover table-condensed table-responsive data">
			<thead>
				<tr>
				<th><?php echo $Ldate[$lang] ?></th>
				<th><?php echo $Lcname[$lang] ?></th>
				<th><?php echo $Lcountry[$lang] ?>,<?php echo $Lcity[$lang] ?></th>
				</tr>
			</thead>
			<tbody>
				<?php getCompetitions() ?>
			</tbody>
		</table>
	</div>
	<?php }else{ echo "<p class='text-info'>$error1[$lang]</p>"; } ?>
</body>
</html>