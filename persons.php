<?php
require_once("include/persons_include.php");
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
  			<label><?php echo $Lyear[$lang]?></label>
  			<SELECT class = "form-control" name = "year">
  				<OPTION value="0"><?php echo $Lall[$lang]?></OPTION>
  				<?php getYear() ?>
  			</SELECT>
  		</div>
  		<!-- 地域 -->
  		<div class="form-group">
  			<label><?php echo $Lregion[$lang]?></label>
  			<SELECT class = "form-control" name = "region">
  				<OPTION value = 'World'>World</OPTION>
  				<optgroup label="<?php echo $Lcontinents[$lang]?>">
  					<?php getContinents() ?>
  				</optgroup>
  				<optgroup label="<?php echo $Lcountries[$lang]?>">
  					<?php getCountries() ?>
  				</optgroup>
  			</SELECT>
  		</div>
  		<div class="form-group">
  			<label><?php echo $Lgender[$lang]?></label>
  			<SELECT class = "form-control" name = "gender">
    			<OPTION value = 'all'><?php echo $Lall[$lang]?></OPTION>
    			<OPTION value = 'male' <?php if($gender=="male") echo selected; ?>><?php echo $Lmale[$lang]?></OPTION></OPTION>
    			<OPTION value = 'female' <?php if($gender=="female") echo selected; ?>><?php echo $Lfemale[$lang]?></OPTION>
  			</SELECT>
  		</div>
  		<!-- 検索条件 -->
  		<div class="form-group">
  			<label><?php echo $Lname[$lang]?>,WCA ID</label>
  			<input type='text' class='form-control' name='search' value='<?php echo $search; ?>'>
  		</div>
  		<button type="submit" class="btn btn-primary form-control-static"><?php echo $Lsubmit[$lang] ?></button>
  	</form>
  	
  	<?php getPersons() ?>
  	
  	</div>
  </body>
</html>