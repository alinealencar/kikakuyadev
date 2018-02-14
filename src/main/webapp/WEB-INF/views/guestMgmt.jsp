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
        		<form:option value="0" label="0" selected="selected"/>
        		<form:option value="1" label="1"/>
        		<form:option value="2" label="2"/>
        		<form:option value="3" label="3"/>
        		<form:option value="4" label="4"/>
			</form:select>
        <span>Kid:</span>
        	<form:select path="kidsMax">
        		<form:option value="0" label="0" selected="selected"/>
        		<form:option value="1" label="1"/>
        		<form:option value="2" label="2"/>
        		<form:option value="3" label="3"/>
        		<form:option value="4" label="4"/>
			</form:select>
	<br>
	<span>RSVP Status: </span>
		<form:select path="isPresent">
			<option value="0"> - </option>
  			<option value="1">Present</option>
  			<option value="2">Not present</option>
		</form:select>
	<br>
	
	<span>Group: </span>
	<form:input path="company" value=""/>
	
	<br>
	<span>Note: </span>
	<form:input path="specialRequests" value=""/>
	<br/>
	<!-- TODO: Set value attr to eventId that's in the session scope -->
	<form:hidden path="eventId" value="1"/>
	
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