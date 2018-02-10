<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add a guest</title>
</head>
<body>
<form:form action="" method="post" modelAttribute="">
	<span>First Name: </span>
	<form:input path="firstName"/>

	<br>
	
	<span>Last Name: </span>
	<form:password path="lastName"/>
	
	<br>
	<span>Email: </span>
	<form:input path="email"/>
	
	<br>
	
	<span>Companion: </span> <br/>
		<div>Adult:</div>
        	<select>
  				<option value="1">1</option>
  				<option value="2">2</option>
            	<option value="3">3</option>
			</select>
        <div>Kid:</div>
        	<select>
  				<option value="1">1</option>
  				<option value="2">2</option>
            	<option value="3">3</option>
			</select>
	<form:password path=""/>
	
	<br>
	<span>Status: </span>
		<select>
  			<option value="1">Present</option>
  			<option value="2">Not present</option>
		</select>
	<form:input path="isPresent"/>
	
	<br>
	
	<span>Belong to: </span>
	<form:password path="company"/>
	
	<br>
	<span>Note: </span>
	<form:input path="specialRequests"/>
	<br/>
	<span><input type="submit" value="Done"></span>
</form:form>
</body>
</html>