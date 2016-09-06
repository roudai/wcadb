<?php
require_once("include/rankings_include.php");
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

	<!-- フォームtest -->
	<form class="form-inline" action="" method="get">
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
		<div class="form-group">
			<label><?php echo $Levent[$lang] ?></label>
			<SELECT class = "form-control" name = "events">
				<?php getEvents() ?>
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
		<div class="form-group">
			<label><?php echo $Lshow[$lang] ?></label>
			<SELECT class = "form-control" name = "show">
  			<OPTION value = '100' <?php if($show=="100") echo selected; ?>><?php echo $L100[$lang] ?></OPTION>
  			<OPTION value = '1000' <?php if($show=="1000") echo selected; ?>><?php echo $L1000[$lang] ?></OPTION>
  			<OPTION value = 'all' <?php if($show=="all") echo selected; ?>><?php echo $Lall[$lang] ?></OPTION>
			</SELECT>
		</div>
		<button type="submit" name="type" value="single" class="btn btn-primary form-control-static"><?php echo $Lsingle[$lang] ?></button>
		<button type="submit" name="type" value="average" class="btn btn-primary form-control-static"><?php echo $Laverage[$lang] ?></button>
	</form>
				
	<?php if(viewRanking()){ ?>
  <div class="table-responsive">
  	<table class="table table-striped table-hover table-condensed">
  		<thead>
  			<tr>
  				<th class="col-md-1"><?php echo $Lrank[$lang] ?></th>
  				<th class="col-md-3"><?php echo $Lperson[$lang] ?></th>
  				<th class="col-md-2"><?php echo $Lregion2[$lang] ?></th>
  				<th class="col-md-1"><?php echo $Ltime[$lang] ?></th>
  				<th class="col-md-3"><?php echo $Lcompetition[$lang] ?></th>
  				<th class="col-md-2"><?php echo $Ldate[$lang] ?></th>
  			</tr>
  		</thead>
  		<tbody>
  		  <?php getRanking() ?>
  		</tbodY>
	  </table>
	 </div>
	</div>
  <?php }else{ echo "<p class='text-info'>No results found.<p>"; } ?>
</body>
</html>