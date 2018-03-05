<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="resources/css/eventPage.css"></script>
<jsp:include page="/WEB-INF/includes/head.jsp" />
<jsp:include page="/WEB-INF/includes/header-event.jsp" />



<div class="container">

	<div id="alertMsg">
		<div class="${(insertError != null) ? 'alert alert-danger' :''}" role="alert">${insertError}</div>
		<div class="${(deleteEvent != null) ? 'alert alert-danger' :''}" role="alert">${deleteEvent}</div>
		<div class="${(not empty noEvents) ? 'alert alert-danger' :''}" role="alert">${noEvents}</div>
	</div>
			
	<div class="addEventBtn" style="margin-bottom: 45px;">
		<span>
			<i class="fas fa-plus-circle" data-toggle="modal" data-target="#showAddForm"></i>
		</span>
	</div>

<!-- SHOWING THE EVENTS -->
<div class="tile" id="showEventList" >
		<c:forEach items="${listEvent}" var="event">
			<div class="eventTile" style="float:left;">
				<h4>${event.eventName} 
					<form:form action="delete" method="get" style="float:right" onclick="deleteEvent()">
						<input name="eventId" type="hidden" value="${event.eventId}"/>
						<button id="deleteBtn" type="submit" class="far fa-trash-alt" style="margin-top:2.5px;"></button>
					</form:form>
					<span>
						<button id="deleteBtn" type="submit" class="fas fa-edit" data-toggle="modal" data-target="#editEvent" style="color: black;" style="margin-top:2.5px;"></button>
					</span>
					<!--span>
						<i class="fas fa-edit" data-toggle="modal" data-target="#editEvent" style="color: black;"></i>
					</span-->
				</h4><br/>
			<hr>
				<form:form modelAttribute="event" method="GET" action="showEvent">
				<form:hidden path="eventId" value="${event.eventId}"/>
			
					<div class="tile-title">
						<button class="eventButton" type="submit" class="btn btn-default">
							<span>
								Location: ${event.location} <br/> <br/>
								Event Date: ${event.eventDate}
							</span>
						</button>
					</div>							
				</form:form>
			</div>
		</c:forEach>
</div>
		
</div>
<!-- ADD AN EVENT FORM  -->
<div class="container-add-modal">
  <!-- The Modal -->

  <div class="modal fade" id="showAddForm" style="top: 20%;">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Add Event</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <form:form modelAttribute="event" class="eventForm" method="POST" action="add" onsubmit="return validateEventForm();">
	<form:hidden path="eventId"/>

		<div>
			<label> Event Name: </label> 
			<form:input path="eventName" class="eventName form-control" oninput="validateEventName()"/>
			<span id="eventNameError" class="formError"></span>
		<br>
		</div>
		<div>
			<label>Location: </label>
			<form:input path="location" class="location form-control" oninput="validateLocation()"/>
				<span id="locationError" class="formError"></span>
			<br>
			<!--form:input type="text" name="eventLocation" path="location"/>
			<div id="eventLocationError" class="inputError"></div-->
		</div>
		<div>
			<label>Date: </label>
			<form:input path="eventDate" type="date" class="eventDate form-control" oninput="validateDate()"/>
				<span id="eventDateError" class="formError"></span>
			<br>
			<!--form:input type="date" name="eventDate" path="eventDate"/>
			<div id="eventDateError" class="inputError"></div-->
		</div>
	<!-- Modal footer -->
        <div>
		<input class="btn btn-success" type="submit" value="Done"/>
	</div>
</form:form>
      </div>
    </div>
    </div>
    </div>
</div>

<!-- EDIT EVENTS FORM-->
<div class="container-edit-modal">
  <!-- The Modal -->

  <div class="modal fade" id="editEvent" style="top: 20%;">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Edit Event</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
    <form:form modelAttribute="event" method="POST" action="update">
	<form:hidden path="eventId" value="${event.eventId}"/>
		<div>
			<label>Event Name: </label>
			<form:input path="eventName" value="${event.eventName}" class="eventName form-control" oninput="validateEventName()"/>
				<span id="eventNameError" class="formError"></span>
		<br>
		</div>
		<div>
			<label>Location:</label>
			<form:input path="location" value="${event.location}" class="location form-control" oninput="validateLocation()"/>
				<span id="locationError" class="formError"></span>
			<br>
		</div>
		<div>
			<label>Date: </label>
			<form:input path="eventDate" type="date" value="${event.eventDate}" class="eventDate form-control" oninput="validateDate()"/>
				<span id="eventDateError" class="formError"></span>
			<br>
			<!--form:input type="date" name="eventDate" path="eventDate"/>
			<div id="eventDateError" class="inputError"></div-->
		</div>
		<!-- Modal footer -->
	        <div>
			<input class="btn btn-success" type="submit" value="Save" style="float: right;"/>
		</div>
</form:form>
</div>
</div>
</div>
</div>
</div>


<script src="resources/js/event.js"></script>
<jsp:include page="/WEB-INF/includes/footer.jsp"/>