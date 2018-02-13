<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create an event</title>
</head>
<body>

<spring:url value="/add" var="saveURL"/>
<form:form modelAttribute="event" method="POST" action="add" >
	<form:hidden path="eventId"/>
<table>
	<tr>
		<td>Event Name:</td>
		<td><form:input path="eventName"/>
	</tr>
	<tr>
		<td>Location:</td>
		<td><form:input path="location"/>
	</tr>

	<tr>
		<td>Date:</td>
		<td><form:input type="date" path="eventDate"/>
	</tr>
	
	<tr>
		<td></td>
		<td><button type="submit">Create Event</button>
	</tr>
</table>

</form:form>
<form:form method="POST" action="list" >
	<a href="list">View</a>
	 <table width="100%" border="1">
	<tr>
		<th>Event Id</th>
		<th>Event Name</th>
		<th>Location</th>
		<th>Event Date</th>
		
		<th colspan="2">Action</th>
	</tr>
	
	<c:forEach items="${listEvent}" var="event">
		<tr>
			<td>${event.eventId}</td>
			<td>${event.eventName}</td>
			<td>${event.location}</td>
			<td>${event.eventDate}</td>
			<form:form modelAttribute="event" method="GET" action="update?eventId=${event.eventId}" >
			<td>
				<!--<spring:url value="update/${event.eventId }" var="updateURL"/>-->
				<a href="update/${event.eventId}">Update</a>
			</td>
			</form:form>
			<form:form modelAttribute="event" method="GET" action="delete?eventId=${event.eventId}" >
			<td>
				<a href="delete/${event.eventId}">Delete</a>
			</td>
			</form:form>
		</tr>
	</c:forEach>
	<div>
		<div class="${(insertError  != null) ? 'alert alert-danger' :''}" role="alert">${insertError }</div>
	</div>
</table>
</form:form>


</body>
</html>