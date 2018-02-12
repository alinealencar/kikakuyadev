<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<% session.setAttribute("title", "KIKAKUYA"); %>
<jsp:include page="/WEB-INF/includes/head.jsp" />
<body>
<div id="login">
	<form:form action="login" method="post" modelAttribute="user">
		<span>Email: </span>
		<form:input path="email"/>
		<span>Password: </span>
		<form:password path="userPassword"/>
		<input type="checkbox" name="isRememberMe" value="1"/> Remember Me
		<br>
		<input type="submit" value="Login">
	</form:form>
</div>
<br>
<span>${signUpSuccess}</span>
<span>${signUpError}</span>
<div id="SignUp">
	<form:form action="signup" class="signUpForm" method="post" modelAttribute="user" onsubmit="return validateSignUpForm();">
		<span>Name: </span>
		<form:input path="userName" class="signUpName" oninput="validateName('signUpName')"/>
		<span id="nameError" class="formError"></span>
		<br>
		<span>Email: </span>
		<form:input path="email" class="signUpEmail" oninput="validateEmail('signUpEmail', 'emailSignUpError')"/>
		<span id="emailSignUpError" class="formError"></span>
		<br>
		<span>Password: </span>
		<form:password path="userPassword" class="signUpPassword" oninput="validatePassword()"/>
		<span id="passwordSignUpError" class="formError"></span>
		<br>
		<span>Confirm Password: </span>
		<input type="password" id = "signUpConfirmPassword" oninput="validatePassword()"/>
		<span id="confirmPasswordSignUpError" class="formError"></span>
		<br>
		
		<input type="submit" value="Sign Up">
	</form:form>
</div>
<jsp:include page="/WEB-INF/includes/footer.jsp"/>