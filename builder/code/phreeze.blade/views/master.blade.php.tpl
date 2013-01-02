<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<base href="{ldelim}{ldelim} $ROOT_URL {rdelim}{rdelim}" />
		<title>
		@section('title')
			{$appname}
		@yield_section</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<meta name="description" content="{$appname}" />
		<meta name="author" content="phreeze builder | phreeze.com" />

		<!-- Le styles -->
		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
		<link href="styles/style.css" rel="stylesheet" />
		<link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link href="bootstrap/css/font-awesome.css" rel="stylesheet" />
		<link href="bootstrap/css/bootstrap-datepicker.css" rel="stylesheet" />
		<link href="bootstrap/css/bootstrap-combobox.css" rel="stylesheet" />
		
		<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
		<!--[if lt IE 9]>
			<script type="text/javascript" src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->

		<!-- Le fav and touch icons -->
		<link rel="shortcut icon" href="images/favicon.ico" />
		<link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/apple-touch-icon-114-precomposed.png" />
		<link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/apple-touch-icon-72-precomposed.png" />
		<link rel="apple-touch-icon-precomposed" href="images/apple-touch-icon-57-precomposed.png" />

		<script type="text/javascript" src="scripts/libs/LAB.min.js"></script>
		<script type="text/javascript">
			$LAB
				.script("//code.jquery.com/jquery-1.8.2.min.js").wait()
				.script("bootstrap/js/bootstrap.min.js");
		</script>

	@section('customHeader')
	@yield_section

	</head>

	<body>

		@section('navbar')

			<div class="navbar navbar-inverse navbar-fixed-top">
				<div class="navbar-inner">
					<div class="container">
						<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</a>
						<a class="brand" href="./">{$appname}</a>
						<div class="nav-collapse">
							<ul class="nav">
{foreach from=$selectedTables item=table name=ddForEach}{if isset($tableInfos[$table->Name])}
{if $smarty.foreach.ddForEach.index == $max_items_in_topnav && !$smarty.foreach.ddForEach.last}
							</ul>
							<ul class="nav">
								<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">More <b class="caret"></b></a>
								<ul class="dropdown-menu">
{/if}
								<li @if (isset($nav) && $nav=='{$tableInfos[$table->Name]['plural']|lower}') class="active"@endif><a href="./{$tableInfos[$table->Name]['plural']|lower}">{$tableInfos[$table->Name]['plural']}</a></li>
{if $smarty.foreach.ddForEach.last && $smarty.foreach.ddForEach.index != $max_items_in_topnav}
								</ul>
								</li>
{/if}
{/if}{/foreach}
							</ul>

							<ul class="nav pull-right">
								<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-lock"></i> Login <i class="caret"></i></a>
								<ul class="dropdown-menu">
									<li><a href="./loginform">Login</a></li>
									<li><a href="./secureuser">Example User Page <i class="icon-lock"></i></a></li>
									<li><a href="./secureadmin">Example Admin Page <i class="icon-lock"></i></a></li>
								</ul>
								</li>
							</ul>
						</div><!--/.nav-collapse -->
					</div>
				</div>
			</div>
		@yield_section

		@section('container')
		
			<div class="container">

				@section('banner')
					<h1>{$appname}</h1>
				@yield_section

				@section('content')
				@yield_section

				<hr>

				<footer>
					<p>&copy; <?php echo date('Y'); ?> {$appname}</p>
				</footer>

			</div> <!-- /container -->
		
		@yield_section

		@section('titlecustomFooterScripts')
		@yield_section

	</body>
</html>