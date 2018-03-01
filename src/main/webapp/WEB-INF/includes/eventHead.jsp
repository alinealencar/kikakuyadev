<body>
<div id="container" class="container.container-fluid">
	<header>
		<div class="row">
			<div class="col-sm-1">
				<img alt="Kikakuya logo" src="resources/images/header/logo.png">

				<div id="sm-account" class="dropdown float-right d-block d-sm-none">
		     		<button id="btn-account" class="btn btn-link" type="button" data-toggle="dropdown">
				    	<span class="material-icons" style="font-size:200%">menu</span>
				    </button>
					<div class="dropdown-menu dropdown-menu-right">
						<h6 class="dropdown-header">Name:</h6>
					    <a class="dropdown-item disabled" href="#">${User.userName}</a>
					    <h6 class="dropdown-header">Email:</h6>
					    <a class="dropdown-item disabled" href="#">${User.userEmail}</a>
					    <div class="dropdown-divider"></div>
					    <a class="dropdown-item linked" href="#">Events</a>
					    <form id="logout" action="logout" method="post"><a class="dropdown-item linked" href="javascript:{}" onclick="console.log('logout'); document.getElementById('logout').submit();">Logout</a></form>
					</div>
				</div>
			</div>
			<div class="col-sm-10">
			</div>
			<div class="col-sm-1 d-none d-sm-block d-md-none">
				<div id="sm-account" class="dropdown float-right">
		     		<button id="btn-account" class="btn btn-link" type="button" data-toggle="dropdown">
				    	<span class="material-icons" style="font-size:200%">menu</span>
				    </button>
					<div class="dropdown-menu dropdown-menu-right">
						<h6 class="dropdown-header">Name:</h6>
					    <a class="dropdown-item disabled" href="#">${User.userName}</a>
					    <h6 class="dropdown-header">Email:</h6>
					    <a class="dropdown-item disabled" href="#">${User.userEmail}</a>
					    <div class="dropdown-divider"></div>
					    <a class="dropdown-item linked" href="#">Events</a>
					    <form id="logout" action="logout" method="post"><a class="dropdown-item linked" href="javascript:{}" onclick="console.log('logout'); document.getElementById('logout').submit();">Logout</a></form>
					</div>
				</div>
			</div>
			<div id="lg-account" class="col-sm-1 d-none d-md-block">	 
				<div class="dropdown float-right">
		     		<button id="btn-account" class="btn btn-link dropdown-toggle" type="button" data-toggle="dropdown">${User.userName}
				    	<span class="caret"></span>
				    </button>
					<div class="dropdown-menu dropdown-menu-right">
						<h6 class="dropdown-header">Name:</h6>
					    <a class="dropdown-item disabled" href="#">${User.userName}</a>
					    <h6 class="dropdown-header">Email:</h6>
					    <a class="dropdown-item disabled" href="#">${User.userEmail}</a>
					    <div class="dropdown-divider"></div>
					    <a class="dropdown-item linked" href="#">Events</a>
					    <form id="logout" action="logout" method="post"><a class="dropdown-item linked" href="javascript:{}" onclick="console.log('logout'); document.getElementById('logout').submit();">Logout</a></form>
					</div>
				 </div>
			</div>
		</div><!-- .row -->
	</header>
