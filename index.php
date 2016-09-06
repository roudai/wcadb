<?php
require_once("include/index_include.php");
require_once("include/language.php");
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
		<!-- 地域 -->
		<div class="form-group">
			<label><?php echo $Lregion[$lang] ?></label>
			<SELECT class = "form-control" name = "region">
				<OPTION value = 'World'>World</OPTION>
				<optgroup label='<?php echo $Lcontinents[$lang] ?>'>
					<?php getContinents() ?>
				</optgroup>
				<optgroup label='<?php echo $Lcountries[$lang] ?>'>
					<?php getCountries() ?>
				</optgroup>
			</SELECT>
		</div>
		<div class="form-group">
			<label><?php echo $Lgender[$lang] ?></label>
			<SELECT class = "form-control" name = "gender">
  			<OPTION value = 'all'><?php echo $Lall[$lang] ?></OPTION>
  			<OPTION value = 'male' <?php if($gender=="male") echo selected; ?>><?php echo $Lmale[$lang] ?></OPTION></OPTION>
  			<OPTION value = 'female' <?php if($gender=="female") echo selected; ?>><?php echo $Lfemale[$lang] ?></OPTION>
			</SELECT>
		</div>
		<button type="submit" class="btn btn-primary form-control-static"><?php echo $Lsubmitrec[$lang] ?></button>
	</form>

	<div class="tab-pane" id="results_tab">
		<div class="panel list-group">
			<?php getRecord() ?>
		</div>
	</div>

	</div>
	<?php include_once("include/footer.php") ?>
</body>
</html>