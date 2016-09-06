<?php
require_once("include/ckinchranks_include.php");
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
		<div class="form-group">
			<SELECT class = "form-control" name = "kinch">
  			<OPTION value = 'all'><?php echo $kinchAll[$lang] ?></OPTION>
  			<OPTION value = 'main' <?php if($kinch=="main") echo selected; ?>><?php echo $kinchMain[$lang] ?></OPTION></OPTION>
  			<OPTION value = '333' <?php if($kinch=="333") echo selected; ?>><?php echo $kinch333[$lang] ?></OPTION>
			<OPTION value = 'big' <?php if($kinch=="big") echo selected; ?>><?php echo $kinchBig[$lang] ?></OPTION>
			<OPTION value = 'bld' <?php if($kinch=="bld") echo selected; ?>><?php echo $kinchBld[$lang] ?></OPTION>
			<OPTION value = 'var' <?php if($kinch=="var") echo selected; ?>><?php echo $kinchVar[$lang] ?></OPTION>
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
	<h1 class='h2 text-center'>Countries KinchRanks</h1>
	<h5 class='text-right'><a href="http://www.kinch2002.com/kinchranks/" target="_brank">kinch2002</a></h5>
	
  <div class="table-responsive">
  	<table class="table table-striped table-hover table-condensed table-bordered" style="font-size : smaller;">
  		<thead>
  			<tr>
  				<th><?php echo $Lrank[$lang] ?></th>
  				<th><?php echo $Lcountry[$lang] ?></th>
  				<th><?php echo $Lscore[$lang] ?></th>
  				<th class='text-center'>333</th>
  				<th class='text-center'>444</th>
  				<th class='text-center'>555</th>
  				<th class='text-center'>222</th>
  				<th class='text-center'>333oh</th>
  				<th class='text-center'>333ft</th>
  				<th class='text-center'>minx</th>
  				<th class='text-center'>pyram</th>
  				<th class='text-center'>sq1</th>
  				<th class='text-center'>clock</th>
  				<th class='text-center'>skewb</th>
  				<th class='text-center'>666</th>
  				<th class='text-center'>777</th>
  				<th class='text-center'>333bf</th>
  				<th class='text-center'>333fm</th>
  				<th class='text-center'>444bf</th>
  				<th class='text-center'>555bf</th>
  				<th class='text-center'>333mbf</th>
  			</tr>
  		</thead>
  		<tbody>
  		  <?php getKinchRanks() ?>
  		</tbodY>
	  </table>
	 </div>
	</div>

</body>
</html>
