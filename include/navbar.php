<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#mainNavbar">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="./"><?php echo $title[$lang] ?></a>
			</div>
			<div class="collapse navbar-collapse" id="mainNavbar">
			<ul class="nav navbar-nav">
				<li<?php if($page=='index') echo " class='active'"; ?>><a href="./"><?php echo $records[$lang] ?></a></li>
				<li<?php if($page=='rankings') echo " class='active'"; ?>><a href="rankings.php"><?php echo $rankings[$lang] ?></a></li>
				<li<?php if($page=='competitions') echo " class='active'"; ?>><a href="competitions.php"><?php echo $competitions[$lang] ?></a></li>
				<li<?php if($page=='persons') echo " class='active'"; ?>><a href="persons.php"><?php echo $persons[$lang] ?></a></li>
		        <li<?php if($page=='other') echo " class='active'"; ?> class="dropdown">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown"><?php echo $other[$lang] ?><b class="caret"></b></a>
		          <ul class="dropdown-menu">
			    <li><a href="kinchranks.php">KinchRanks</a></li>
			    <li><a href="ckinchranks.php">Countries KinchRanks</a></li>            
			    <li><a href="awecc.php">"All WCA Events Completion" Club</a></li>
		          </ul>
		        </li>
			</ul>
		</div>
	</div>
</nav>
