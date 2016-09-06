<?php
require_once("include/jdata_include.php");
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

	<h1 class='h2 text-center'>日本語大会名 `JCompetitions`</h1>
	<div class="table-responsive">
		<table class="table table-striped table-hover table-responsive table-bordered">
			<thead>
				<tr>
					<th>Date</th>
					<th>id</td>
					<th>jname</td>
					<th>jarea</td>
				</tr>
			</thead>
			<tbody>
				<?php getJdata() ?>
			</tbody>
		</table>
	</div>
</html>