<?php
require_once("include/awecc_include.php");
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
	
	<h1 class='h2 text-center'>"All WCA Events Completion" Club</h1>
	<h5 class='text-right'><a href="https://www.speedsolving.com/forum/showthread.php?39896-quot-All-WCA-Events-Completion-quot-Club/" target="_brank">SpeedSolving.com</a></h5>
	
	<h3>Platinum member</h5>
	<p><?php echo $aweccP[$lang] ?></p>
	<div class="table-responsive">
		<table class="table table-striped table-hover table-responsive table-bordered">
			<thead>
				<tr>
					<th>No.</td>
					<th>WCA ID</td>
					<th><?php echo $Lname[$lang] ?></td>
					<th><?php echo $Lregion2[$lang] ?></td>
					<th>WR</td>
					<th>CR</td>
					<th><?php echo $Lpodium[$lang] ?></td>
					<th><?php echo $Ldate[$lang] ?></td>
				</tr>
			</thead>
			<tbody>
				<?php getMember('Platinum') ?>
			</tbody>
		</table>
	</div>
	
	<h3>Gold member</h5>
	<p><?php echo $aweccG[$lang] ?></p>
	<div class="table-responsive">
		<table class="table table-striped table-hover table-responsive table-bordered">
			<thead>
				<tr>
					<th>No.</td>
					<th>WCA ID</td>
					<th><?php echo $Lname[$lang] ?></td>
					<th><?php echo $Lregion2[$lang] ?></td>
					<th>WR</td>
					<th>CR</td>
					<th><?php echo $Lpodium[$lang] ?></td>
					<th><?php echo $Ldate[$lang] ?></td>
				</tr>
			</thead>
			<tbody>
				<?php getMember('Gold') ?>
			</tbody>
		</table>
	</div>

	<h3>Silver member</h5>
	<p><?php echo $aweccS[$lang] ?></p>
	<div class="table-responsive">
		<table class="table table-striped table-hover table-responsive table-bordered">
			<thead>
				<tr>
					<th>No.</td>
					<th>WCA ID</td>
					<th><?php echo $Lname[$lang] ?></td>
					<th><?php echo $Lregion2[$lang] ?></td>
					<th>WR</td>
					<th>CR</td>
					<th><?php echo $Lpodium[$lang] ?></td>
					<th><?php echo $Ldate[$lang] ?></td>
				</tr>
			</thead>
			<tbody>
				<?php getMember('Silver') ?>
			</tbody>
		</table>
	</div>
	
	<h3>Bronze member</h5>
	<p><?php echo $aweccB[$lang] ?></p>
	<div class="table-responsive">
		<table class="table table-striped table-hover table-responsive table-bordered">
			<thead>
				<tr>
					<th>No.</td>
					<th>WCA ID</td>
					<th><?php echo $Lname[$lang] ?></td>
					<th><?php echo $Lregion2[$lang] ?></td>
					<th>WR</td>
					<th>CR</td>
					<th><?php echo $Lpodium[$lang] ?></td>
					<th><?php echo $Ldate[$lang] ?></td>
				</tr>
			</thead>
			<tbody>
				<?php getMember('Bronze') ?>
			</tbody>
		</table>
	</div>
	
	<h3>One event missing</h5>
	<p><?php echo $aweccM[$lang] ?></p>
	<div class="table-responsive">
		<table class="table table-striped table-hover table-responsive table-bordered">
			<thead>
				<tr>
					<th>No.</td>
					<th>WCA ID</td>
					<th><?php echo $Lname[$lang] ?></td>
					<th><?php echo $Lregion2[$lang] ?></td>
					<th><?php echo $Llackeve[$lang] ?></td>
				</tr>
			</thead>
			<tbody>
				<?php getMissing() ?>
			</tbody>
		</table>
	</div>
	
</div>
	
	</div>

</body>
</html>