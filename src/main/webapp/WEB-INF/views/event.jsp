<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/includes/head.jsp" />
<jsp:include page="/WEB-INF/includes/header.jsp"/>

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
			
			<form:form action="delete" method="get">
							<input name="eventId" type="hidden" value="${event.eventId}"/>
							<input class="btn btn-danger" type="submit" value="Remove event"/>
						</form:form>
			</div>	
			<div class="updateButton">
				<!-- a type="button" href="update/${event.eventId}" oncLick="editEvent()" style="text-decoration:none">Update</a-->
				
				<button type="button" onclick="editEvent()">Update</button>
			</div>
		
		<form:form modelAttribute="event" method="GET" action="showEvent">
		<form:hidden path="eventId" value="${event.eventId}"/>
			
			<!--input type="submit" value="Location: ${event.location} 
										Event Date: ${event.eventDate}"/-->
			<div class="tile-title">
				<button type="submit">Location: ${event.location} <br/>
										Event Date: ${event.eventDate}</button>
			</div>							
			
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
<div id="editEvent" style="display:none;">
	<h5>Edit Event Information</h5>
	<form:form modelAttribute="event" method="POST" action="update">
	<form:hidden path="eventId" value="${event.eventId}"/>
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
		<td><input type="submit" onclick="showList()" value="Done"/>
	</tr>
</table>
</form:form>
</div>

<script src="resources/js/event.js"></script>
<jsp:include page="/WEB-INF/includes/event.jsp" />
