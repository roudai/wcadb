<?php
require_once("include/results_include.php");
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

	<?php getCompetition() ?>

	<?php if(countResults()){ ?>
	<ul class="nav nav-tabs">
		<li class="active"><a href="#top_tab" data-toggle="tab"><?php echo $Ltop3[$lang] ?></a></li>
		<li><a href="#results_tab" data-toggle="tab"><?php echo $LallResults[$lang] ?></a></li>
		<?php if(countScrambles()){ ?>
		<li><a href="#scrambles_tab" data-toggle="tab"><?php echo $Lscramble[$lang] ?></a></li>
		<?php } ?>
		<li><a href="#persons_tab" data-toggle="tab"><?php echo $persons[$lang] ?></a></li>
	</ul>

	<div id="myTabContent" class="tab-content">
		<!-- 上位３名 -->
	    <div class="tab-pane in active" id="top_tab">
			<div class="table-responsive">
				<table class="table table-striped table-hover table-bordered">
					<thead>
						<tr>
							<th><?php echo $Levent[$lang] ?></th>
							<th><?php echo $L1st[$lang] ?></th><th><?php echo $Ltime[$lang] ?></th>
							<th><?php echo $L2nd[$lang] ?></th><th><?php echo $Ltime[$lang] ?></th>
							<th><?php echo $L3rd[$lang] ?></th><th><?php echo $Ltime[$lang] ?></th>
						</tr>
					</thead>
					<tbody>
						<?php getWinner() ?>
					</tbody>
				</table>
			</div>
		</div>
	
		<!-- 全結果 -->
		<div class="tab-pane" id="results_tab">
			<div class="panel-group" id="accordion1">
				<?php getAllResults() ?>
			</div>
		</div>
	
		<?php if(countScrambles()){ ?>
		<!-- スクランブル -->
		<div class="tab-pane" id="scrambles_tab">
			<div class="panel-group" id="accordion2">
				<?php getScrambles() ?>
			</div>
		</div>
		<?php } ?>
		
		<!-- 人単位 -->
		<div class="tab-pane" id="persons_tab">
			<div class="panel-group" id="accordion3">
		      <?php getPersons() ?>
			</div>
		</div>
		
	</div>
	<?php }else{ echo "<p class='text-warning'>" . $error4[$lang] . "</p>"; } ?>

	</div>
</body>
</html>