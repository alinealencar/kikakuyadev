<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container">
<!--button class="w3-button w3-xlarge w3-circle w3-pink" oncLick="showForm()">+</button -->
				<div class="col-2">
					<button id="btnAddVendor" type="button" class="btn btn-link d-none d-md-block" name="addVendor" onclick="showForm()">
      					<span class="material-icons" style="font-size: 200%;">add_circle</span>
   					</button>
   				</div>
<div id = "alertMessage">
	<div class="${(insertError  != null) ? 'alert alert-danger' :''}" role="alert">${insertError }</div>
	<div class="${(addAnEvent  != null) ? 'alert alert-danger' :''}" role="alert">${addAnEvent }</div>
	<div class="${(noEvents  != null) ? 'alert alert-danger' :''}" role="alert">${noEvents }</div>
</div>

<!-- SHOWING THE EVENTS -->
	<div class="tile" id="showEventList">
		<c:forEach items="${listEvent}" var="event">
			<div class="eventTile">${event.eventName}
			
			<div class="deleteButton">
			<form:form modelAttribute="event" method="GET" action="delete?eventId=${event.eventId}" >
				<a type="button" href="delete/${event.eventId}" style="text-decoration:none">Delete</a>
			</form:form>
			</div>	
			<div class="updateButton">
				<!-- a type="button" href="update/${event.eventId}" oncLick="editEvent()" style="text-decoration:none">Update</a-->
				<button id="edit" oncLick="editEvent()" style="text-decoration:none">Update</button> 
			</div>
			
		<!--form:form modelAttribute="event" method="GET" action="event?eventId=${event.eventId}" -->
		<form:form modelAttribute="event" method="GET" action="showEvent">
		<form:hidden path="eventId" value="${event.eventId}"/>
			<a class="tile-title" href="event/${event.eventId}" style="text-decoration:none">
				Location: ${event.location} <br/>
				Event Date: ${event.eventDate}<br/>
			</a>
			<input type="submit" value="Select"/>
		</form:form>
		
			</div>
		</c:forEach>
	</div>

<!-- ADD AN EVENT FORM  -->
<div id="showAddForm" style="display:none;">
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
		<td><button type="submit" onclick="showList()">Save</button>
	</tr>
</table>
</form:form>
</div>
</div>

<!-- EDIT EVENTS FORM-->
<div id="editEvents" style="display:none;">
	<h5>Edit events</h5>
	<form:form modelAttribute="event" method="GET" action="update/${event.eventId}">
	<form:hidden path="eventId"/>
<table>
	<tr>
		<td>Event Name:</td>
		<td><form:input path="eventName" value="${event.eventName}"/>
	</tr>
	<tr>
		<td>Location:</td>
		<td><form:input path="location" value="${event.location}"/>
	</tr>
	<tr>
		<td>Date:</td>
		<td><form:input type="date" path="eventDate" value="${event.eventDate}"/>
	</tr>
	<tr>
		<td></td>
		<td><button type="submit" onclick="showList()">Done</button>
	</tr>
</table>
</form:form>
</div>

<script src="resources/js/event.js"></script>
<jsp:include page="/WEB-INF/includes/event.jsp" />
