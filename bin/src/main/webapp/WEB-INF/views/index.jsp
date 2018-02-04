<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Kikakuya</title>
</head>
<body>
<h2>Login</h2>
<form:form action="login" method="post" modelAttribute="user">
	<span>Email: </span>
	<form:input path="email"/>
	
	<br>
	
	<span>Password: </span>
	<form:password path="userPassword"/>
	
	<br>
	<form:checkbox path="isRememberMe" value="1"/> Remember Me
	<br>
	<input type="submit" value="Login">
</form:form>
<br>
<h2>Sign Up</h2>
<form:form action="signup" method="post" modelAttribute="user">
	<span>Name: </span>
	<form:input path="userName"/>
	
	<br>
	
	<span>Email: </span>
	<form:input path="email"/>
	
	<br>
	
	<span>Password: </span>
	<form:password path="userPassword"/>
	
	<br>
	
	<input type="submit" value="Sign Up">
</form:form>

</body>
</html>