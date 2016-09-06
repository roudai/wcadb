<?php
require_once("include/person_include.php");
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
  	
  	<?php getPerson() ?>

		<?php if(countPodium('World') != 0 OR countPodium('Euro') != 0  OR countPodium('Asian') != 0 OR countPodium('Japan') != 0 OR countHistoryR('WR') != 0 OR countHistoryR('CR') != 0 OR countHistoryR('NR') != 0){ ?>
		<div class="panel-group" id="accordion3">
			<!-- 世界大会入賞 -->
			<?php if(countPodium('World')){ ?>
			<div class="panel panel-default">
				<a class="list-group-item" data-toggle="collapse" data-parent="#accordion3" href="#collapse31">
					<?php echo $wpodium[$lang] ?>
				</a>
				<div id="collapse31" class="panel-collapse collapse">
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-striped table-hover table-condensed">
								<thead>
									<tr>
										<th class='col-sm-2'><?php echo $Lyear[$lang] ?></th>
										<th class='col-sm-2'><?php echo $Levent[$lang] ?></th>
										<th class='col-sm-1'><?php echo $Lplace[$lang] ?></th>
										<th class='col-sm-1'><?php echo $Lsingle[$lang] ?></th>
										<th class='col-sm-1'><?php echo $Laverage[$lang] ?></th>
										<th class='col-sm-5' colspan="5"><?php echo $LresultDetails[$lang] ?></th>
									</tr>
								</thead>
								<tbody>
	                			<?php getPodium('World') ?>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<?php } ?>

			<!-- ユーロ大会入賞 -->
			<?php if(countPodium('Euro')){ ?>
			<div class="panel panel-default">
				<a class="list-group-item" data-toggle="collapse" data-parent="#accordion3" href="#collapse32">
					<?php echo $epodium[$lang] ?>
				</a>
				<div id="collapse32" class="panel-collapse collapse">
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-striped table-hover table-condensed">
								<thead>
									<tr>
										<th class='col-sm-2'><?php echo $Lyear[$lang] ?></th>
										<th class='col-sm-2'><?php echo $Levent[$lang] ?></th>
										<th class='col-sm-1'><?php echo $Lplace[$lang] ?></th>
										<th class='col-sm-1'><?php echo $Lsingle[$lang] ?></th>
										<th class='col-sm-1'><?php echo $Laverage[$lang] ?></th>
										<th class='col-sm-5' colspan="5"><?php echo $LresultDetails[$lang] ?></th>
									</tr>
								</thead>
								<tbody>
	                			<?php getPodium('Euro') ?>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<?php } ?>
			
			<!-- アジア大会入賞 -->
			<?php if(countPodium('Asian')){ ?>
			<div class="panel panel-default">
				<a class="list-group-item" data-toggle="collapse" data-parent="#accordion3" href="#collapse33">
					<?php echo $apodium[$lang] ?>
				</a>
				<div id="collapse33" class="panel-collapse collapse">
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-striped table-hover table-condensed">
								<thead>
									<tr>
										<th class='col-sm-2'><?php echo $Lyear[$lang] ?></th>
										<th class='col-sm-2'><?php echo $Levent[$lang] ?></th>
										<th class='col-sm-1'><?php echo $Lplace[$lang] ?></th>
										<th class='col-sm-1'><?php echo $Lsingle[$lang] ?></th>
										<th class='col-sm-1'><?php echo $Laverage[$lang] ?></th>
										<th class='col-sm-5' colspan="5"><?php echo $LresultDetails[$lang] ?></th>
									</tr>
								</thead>
								<tbody>
	                			<?php getPodium('Asian') ?>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<?php } ?>
			
			<!-- 日本大会入賞 -->
			<?php if(countPodium('Japan')){ ?>
			<div class="panel panel-default">
				<a class="list-group-item" data-toggle="collapse" data-parent="#accordion3" href="#collapse34">
					<?php echo $jpodium[$lang] ?>
				</a>
				<div id="collapse34" class="panel-collapse collapse">
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-striped table-hover table-condensed">
								<thead>
									<tr>
										<th class='col-sm-2'><?php echo $Lyear[$lang] ?></th>
										<th class='col-sm-2'><?php echo $Levent[$lang] ?></th>
										<th class='col-sm-1'><?php echo $Lplace[$lang] ?></th>
										<th class='col-sm-1'><?php echo $Lsingle[$lang] ?></th>
										<th class='col-sm-1'><?php echo $Laverage[$lang] ?></th>
										<th class='col-sm-5' colspan="5"><?php echo $LresultDetails[$lang] ?></th>
									</tr>
								</thead>
								<tbody>
	                			<?php getPodium('Japan') ?>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<?php } ?>
			
			<!-- 世界記録 -->
			<?php if(countHistoryR('WR')){ ?>
			<div class="panel panel-default">
				<a class="list-group-item" data-toggle="collapse" data-parent="#accordion3" href="#collapse35">
					<?php echo $historyWR[$lang] ?>
				</a>
				<div id="collapse35" class="panel-collapse collapse">
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-striped table-hover table-condensed">
								<thead>
									<tr>
										<th class='col-sm-2'><?php echo $Levent[$lang] ?></</th>
										<th class='col-sm-1'><?php echo $Lsingle[$lang] ?></</th>
										<th class='col-sm-1'><?php echo $Laverage[$lang] ?></</th>
										<th class='col-sm-3'><?php echo $Lcompetition[$lang] ?></</th>
										<th class='col-sm-2'><?php echo $Ldate[$lang] ?></</th>
										<th class='col-sm-2'><?php echo $Lround[$lang] ?></</th>
										<th class='col-sm-3' colspan="5"><?php echo $LresultDetails[$lang] ?></th>
									</tr>
								</thead>
								<tbody>
	                			<?php getHistoryR('WR') ?>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<?php } ?>
			
			<!-- 大陸記録 -->
			<?php if(countHistoryR('CR')){ ?>
			<div class="panel panel-default">
				<a class="list-group-item" data-toggle="collapse" data-parent="#accordion3" href="#collapse36">
					<?php echo $historyCR[$lang] ?>
				</a>
				<div id="collapse36" class="panel-collapse collapse">
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-striped table-hover table-condensed">
								<thead>
									<tr>
										<th class='col-sm-2'><?php echo $Levent[$lang] ?></</th>
										<th class='col-sm-1'><?php echo $Lsingle[$lang] ?></</th>
										<th class='col-sm-1'><?php echo $Laverage[$lang] ?></</th>
										<th class='col-sm-3'><?php echo $Lcompetition[$lang] ?></</th>
										<th class='col-sm-2'><?php echo $Ldate[$lang] ?></</th>
										<th class='col-sm-2'><?php echo $Lround[$lang] ?></</th>
										<th class='col-sm-3' colspan="5"><?php echo $LresultDetails[$lang] ?></th>
									</tr>
								</thead>
								<tbody>
	                			<?php getHistoryR('CR') ?>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<?php } ?>
			
			<!-- 国内記録 -->
			<?php if(countHistoryR('NR')){ ?>
			<div class="panel panel-default">
				<a class="list-group-item" data-toggle="collapse" data-parent="#accordion3" href="#collapse37">
					<?php echo $historyNR[$lang] ?>
				</a>
				<div id="collapse37" class="panel-collapse collapse">
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-striped table-hover table-condensed">
								<thead>
									<tr>
										<th class='col-sm-2'><?php echo $Levent[$lang] ?></</th>
										<th class='col-sm-1'><?php echo $Lsingle[$lang] ?></</th>
										<th class='col-sm-1'><?php echo $Laverage[$lang] ?></</th>
										<th class='col-sm-3'><?php echo $Lcompetition[$lang] ?></</th>
										<th class='col-sm-2'><?php echo $Ldate[$lang] ?></</th>
										<th class='col-sm-2'><?php echo $Lround[$lang] ?></</th>
										<th class='col-sm-3' colspan="5"><?php echo $LresultDetails[$lang] ?></th>
									</tr>
								</thead>
								<tbody>
	                			<?php getHistoryR('NR') ?>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<?php } ?>
		</div>
		<?php } ?>
		
    <ul class="nav nav-tabs">
    	<li class="active"><a href="#top_tab" data-toggle="tab"><?php echo $records[$lang] ?></a></li>
    	<li><a href="#history_tab" data-toggle="tab"><?php echo $Lhistory[$lang] ?></a></li>
    	<li><a href="#competitions_tab" data-toggle="tab"><?php echo $competitions[$lang] ?></a></li>
    </ul>
	
    <div id="myTabContent" class="tab-content">
      <!-- 記録 -->
      <div class="tab-pane in active" id="top_tab">
        <div class="table-responsive">
      		<table class="table table-striped table-hover table-responsive table-bordered" id="myTable">
      			<thead>
      				<tr>
      					<th><?php echo $Levent[$lang] ?></th>
      					<th class="text-center">NR</th>
      					<th class="text-center">CR</th>
      					<th class="text-center">WR</th>
      					<th class="text-center"><?php echo $Lsingle[$lang] ?></th>
      					<th class="text-center"><?php echo $Laverage[$lang] ?></th>
      					<th class="text-center">WR</th>
      					<th class="text-center">CR</th>
      					<th class="text-center">NR</th>
      					<th class="text-center">Gold</th>
      					<th class="text-center">Silver</th>
      					<th class="text-center">Bronze</th>
      				</tr>
      			</thead>
      			<tbody>
              <?php getRecords() ?>
            </tbody>
          </table>
        </div>
      </div>
        
  		<!-- 結果履歴 -->
  		<div class="tab-pane" id="history_tab">
        <div class="panel-group" id="accordion1">
		      <?php getHistory() ?>
  		  </div>
  		</div>
  	
  		<!-- 大会 -->
  		<div class="tab-pane" id="competitions_tab">
        <div class="panel-group" id="accordion2">
		      <?php getCompetitions() ?>
  		  </div>
  		</div>
    </div>
  
  	</div>
  </body>
</html>