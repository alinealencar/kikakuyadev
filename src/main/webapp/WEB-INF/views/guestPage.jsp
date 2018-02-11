<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add a guest</title>
</head>
<body>
<form:form id="guestForm" method="post" modelAttribute="guest">
	<span>First Name: </span>
	<form:input path="firstName"/>

	<br>
	
	<span>Last Name: </span>
	<form:input path="lastName"/>
	
	<br>
	<span>Email: </span>
	<form:input path="email"/>
	
	<br>
	
	<span>Companion: </span> <br/>
		<span>Adult:</span>
        	<form:select path="adultsMax">
  				<option value="1">1</option>
  				<option value="2">2</option>
            	<option value="3">3</option>
            	<option value="4">4</option>
			</form:select>
        <span>Kid:</span>
        	<form:select path="kidsMax">
  				<option value="1">1</option>
  				<option value="2">2</option>
            	<option value="3">3</option>
			</form:select>
	<br>
	<span>Status: </span>
		<form:select path="isPresent">
  			<option value="1">Present</option>
  			<option value="0">Not present</option>
		</form:select>
	<br>
	
	<span>Belong to: </span>
	<form:input path="company"/>
	
	<br>
	<span>Note: </span>
	<form:input path="specialRequests"/>
	<br/>
	<span><input id="addGuest" type="button" value="Done" onclick="submitForm('addGuest')"></span>
	<span><input id="editGuest" type="button" value="Save" onclick="submitForm('editGuest')"></span>
</form:form>
<script>
    function submitForm(action)
    {
        document.getElementById('guestForm').action = action;
        document.getElementById('guestForm').submit();
    }
</script>
</body>
</html>