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
								<div class="col-sm-5" style="margin-top: 10px;">
									<label for="userEmail" class="sr-only">Email: </label>
									<form:input path="email" class="form-control"  placeholder="Email"/>
								</div>
								<div class="col-sm-5" style="margin-top: 10px;">
									<label for="userPassword" class="sr-only">Password: </label>
									<form:password path="userPassword"  class="form-control"  placeholder="Password"/>
								</div>
								<div class="col-sm-2" style="margin-top: 10px;">
									<input type="submit" value="Login" id="btnLogIn" class="btn btn-primary text-right" style="background-color: #D90368; color: #F1E9DA; border-color:#D90368;">
								</div>
							</div>
						</div>
					</div>
					<input type="checkbox" name="isRememberMe" value="1"/> Stay signed in
				</form:form>
			</div>
		</div><!-- .row -->
		<div class="row">
			<div class="col-sm-6 text-center"  style="margin-top: 10px;">
				<img alt="Kikakuya Image" src="resources/images/header/login_image.png" width="70%">
			</div>
			<div class="col-sm-6 text-center" style="margin-top: 10px;">
				<span>${signUpSuccess}</span>
				<span>${signUpError}</span>
				<div class="row">
					<div class="col-sm-3"></div>

					<div id="SignUp" class="col-sm-6">
						<h1 style="margin-top: 10px;">Sign Up</h1>
						<form:form action="signup" class="signUpForm" method="post" modelAttribute="user" onsubmit="return validateSignUpForm();">
							<label for="userName" class="sr-only">Name: </label>
							<form:input path="userName" class="signUpName form-control" oninput="validateName('signUpName')" placeholder="User Name"/>
							<span id="nameError" class="formError"></span>
							<br>
							<label for="userEmail" class="sr-only">Email: </label>
							<form:input path="email" class="signUpEmail  form-control" oninput="validateEmail('signUpEmail', 'emailSignUpError')" placeholder="Email"/>
							<span id="emailSignUpError" class="formError"></span>
							<br>
							<label for="userPassword" class="sr-only">Password: </label>
							<form:password path="userPassword" class="signUpPassword  form-control" oninput="validatePassword()" placeholder="Password"/>
							<span id="passwordSignUpError" class="formError"></span>
							<br>
							<label for="signUpConfirmPassword" class="sr-only">Confirm Password: </label>
							<input type="password" id = "signUpConfirmPassword" class="form-control" oninput="validatePassword()" placeholder="Confirm Password"/>
							<span id="confirmPasswordSignUpError" class="formError"></span>
							<br>
							<input type="submit" value="Sign Up"  class="btn btn-primary text-right" style="background-color: #D90368; color: #F1E9DA; border-color:#D90368;">
						</form:form>
					</div>
					<div class="col-sm-3"></div>
				</div>
			</div>
	</header>
