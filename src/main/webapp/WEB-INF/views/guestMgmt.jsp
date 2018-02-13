<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- Change feature variable -->
<%! String feature = "Guests" ;%>

<% session.setAttribute("feature", feature); %>
<% session.setAttribute("title", "KIKAKUYA - " + feature); %>
<jsp:include page="/WEB-INF/includes/head.jsp" />
<jsp:include page="/WEB-INF/includes/header.jsp"/>

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
	
	<span>Plus ones: </span> <br/>
		<span>Adult:</span>
        	<form:select path="adultsMax">
        		<option value="0">0</option>
  				<option value="1">1</option>
  				<option value="2">2</option>
            	<option value="3">3</option>
            	<option value="4">4</option>
			</form:select>
        <span>Kid:</span>
        	<form:select path="kidsMax">
        		<option value="0">0</option>
  				<option value="1">1</option>
  				<option value="2">2</option>
            	<option value="3">3</option>
			</form:select>
	<br>
	<span>RSVP Status: </span>
		<form:select path="isPresent">
			<option value=""> - </option>
  			<option value="1">Present</option>
  			<option value="0">Not present</option>
		</form:select>
	<br>
	
	<span>Group: </span>
	<form:input path="company"/>
	
	<br>
	<span>Note: </span>
	<form:input path="specialRequests"/>
	<br/>
	<!-- TO IMPLEMENT: Show addGuest first and hide editGuest. When the user clicks on "edit", hide addGuest and show editGuest -->
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
<jsp:include page="/WEB-INF/includes/footer.jsp"/>