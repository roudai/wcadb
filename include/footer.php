<footer class="footer">
  <div class="container">
		<p class="pull-right">Last Update: 
		<a href="https://www.worldcubeassociation.org/results/misc/export.html" target="_blank" class="text-primary">
		<?php
			$contents = @file_get_contents('db/latest');
			echo $contents;
		?>
		</a></p>
  </div>
</footer>
