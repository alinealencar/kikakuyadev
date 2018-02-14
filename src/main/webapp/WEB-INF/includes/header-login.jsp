<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<body>
<div id="container" class="container.container-fluid">
	<header>
		<div class="row">
			<div class="col-sm-5">
				<img alt="Kikakuya logo" src="resources/images/header/logo.png">
			</div>
			<div class="col-sm-7 text-right">
					<form:form action="login" method="post" modelAttribute="user">
						<div class="form-row"> 
							<div class="col-sm-12">
								<div class="form-row">
									<div class="col-sm-5" style="margin-top: 5px;">
										<label for="userEmail" class="sr-only">Email: </label>
										<form:input path="email" class="form-control"  placeholder="Email"/>
									</div>
									<div class="col-sm-5" style="margin-top: 5px;">
										<label for="userPassword" class="sr-only">Password: </label>
										<form:password path="userPassword"  class="form-control"  placeholder="Password"/>
									</div>
									<div class="col-sm-2" style="margin-top: 5px;">
										<input type="submit" value="Login"  class="btn btn-primary text-right">
									</div>
								</div>
							</div>
						</div>
						

						<input type="checkbox" name="isRememberMe" value="1"/> Stay signed in
					</form:form>
			</div>
		</div><!-- .row -->
	</header>
