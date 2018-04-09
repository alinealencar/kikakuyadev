<%! String feature = "Events" ;%>

<% session.setAttribute("feature", feature); %>
<% session.setAttribute("title", "KIKAKUYA - " + feature); %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/includes/head.jsp" />
<jsp:include page="/WEB-INF/includes/header-event.jsp" />
<script src="resources/js/validateEvent.js"></script>
<script src="resources/js/events.js"></script>

<div class="container">
	<div class="row"  style="margin-bottom: 45px;">
		<div id="alertMsg" class="col-sm-10">
			<div class="${(insertSuccess != null) ? 'successAlert':''}">${insertSuccess}</div>
			<div class="${(insertError != null) ? 'errorAlert':''}">${insertError}</div>	
			<div class="${(deleteEventSuccess != null) ? 'successAlert':''}">${deleteEventSuccess}</div>	
			<div class="${(deleteEventError != null) ? 'errorAlert':''}">${deleteEventError}</div>	
			<div class="${(updateSuccess != null) ? 'successAlert':''}">${updateSuccess}</div>	
			<div class="${(updateError != null) ? 'errorAlert':''}">${updateError}</div>				
		</div>
		<div class="col-sm-2 text-right">		
			<div class="addEventBtn">
				<span>
						<a class="button" id="btnAddEvent" href="#addEvent" style="color:#D90368;"><i class="fas fa-plus-circle" ></i></a>
				</span>
			</div>
		</div>
	</div>
			<c:if test="${not empty noEvents}">
				<div class="text-center">
					<h5>${noEvents}</h5>
				</div>
				<div class="text-center">
					<img class="img-fluid" src="resources/images/general/not_found.png" alt="not found" height="200" width="200">
				</div>
			</c:if>
			
	<!-- SHOWING THE EVENTS -->
	<div class="tile row text-center" id="showEventList">
		<c:forEach items="${listEvent}" var="event">
			<div class="col-sm-4 eventsList">
				<div class="eventTile">
					<div class="tile-head">	
						<div class="row">
							<div class="col-8">
							</div>
							<div class="col-2 text-right" style="padding-right:0; padding-top:5px">								
								<form:form id="deleteForm" action="delete" method="get" onsubmit="return deleteEvent()">
									<input name="eventId" type="hidden" value="${event.eventId}"/>
									<button id="deleteBtn" type="submit" class="far fa-trash-alt" style="margin-top:2.5px;"></button>
								</form:form>
							</div>
							<div class="col-2 text-left" style="padding-left:0; padding-top:5px">
								<a id="deleteBtn editEventBtn" onclick="updateEvent('${event.eventId}','${event.eventName}', '${event.eventDate}', '${event.location}');" href="#editEvent" ><i class="fas fa-edit" style="color: #2E294E; margin-top:2.5px;"></i></a>
							</div>
							<br/>
						</div>					
					</div>
					
					<form:form modelAttribute="event" method="GET" action="showEvent">
					<form:hidden path="eventId" value="${event.eventId}"/>									
					<div class="tile-content">						
						<button class="eventButton" type="submit" class="btn btn-default">
							<div class="col-10">
								<h4>${event.eventName} </h4>
							</div>
							<hr>
							<div class="col-10">
								Address: ${event.location}
							</div>
							<div class="col-10">
								Event Date: ${event.eventDate}
							</div>
						</button>
					</div>							
					</form:form>
				</div>
			</div>
		</c:forEach>
	</div>	
<!-- end of showing event -->	
<!-- ADD AN EVENT FORM  -->

<div id="addEvent" class="overlay">
	<div class="popup">
		<h2>Add Event</h2>
		<a class="close" href="#">&times;</a>
		<p style="font-size: 12px">Note: You can only add up to 3 events</p>
		<div class="content">
		<hr>
			<form:form modelAttribute="event" class="eventForm" method="POST" action="add" onsubmit="return validateEventForm();">
						<form:hidden path="eventId"/>
			
						<div>
							<label> Event Name<span style="font-size:22px;color:red">*</span>: </label> 
							<form:input path="eventName" class="eventName form-control" oninput="validateEventName()" maxlength="20"/>
							<span id="eventNameError" class="formError"></span>
							<br>
						</div>
						<div>
							<label>Address<span style="font-size:22px;color:red">*</span>: </label>
							<form:input path="location" class="location form-control" oninput="validateLocation()" maxlength="100"/>
								<span id="locationError" class="formError"></span>
							<br>
						</div>
						<div>
							<label>Date<span style="font-size:22px;color:red">*</span>: </label>
							<form:input path="eventDate" type="date" class="eventDate form-control" oninput="validateDate()"/>
								<span id="eventDateError" class="formError"></span>
							<br>
						</div>
						
				        <div class="text-right">
							<button type="submit" class="btn btn-success">Done</button>
						</div>
			</form:form>
		</div>
	</div>
</div>

<!-- end of add event form-->

<!-- EDIT EVENTS FORM-->

<div id="editEvent" class="overlay">
	<div class="popup">
		<h2>Edit Event</h2>
		<a class="close" href="#">&times;</a>
		<div class="content">
		<hr>
			<form:form modelAttribute="event" method="POST" action="update" onsubmit="return validateEditEventForm();">
				<form:hidden id="editEventId" path="eventId" />
				<div>
					<label>Event Name: </label>
					<form:input id="editEventName" path="eventName" class="eventName-edit form-control" oninput="validateEditEventName()"/>
					<span id="eventEditNameError" class="formError"></span>
					<br>
				</div>
				<div>
					<label>Address:</label>
					<form:input id="editLocation" path="location" class="location-edit form-control" oninput="validateEditLocation()"/>
					<span id="locationEditError" class="formError"></span>
					<br>
				</div>
				<div>
					<label>Date: </label>
					<form:input id="editEventDate" path="eventDate" type="date" class="date-edit form-control" oninput="validateEditDate()"/>
					<span id="eventEditDateError" class="formError"></span>
					<br>
				</div>
				<hr>
	        	<div>
					<input class="btn btn-success" type="submit" value="Save" style="float: right;"/>
				</div>
			</form:form>
		</div>
	</div>
</div>

</div>
<style>
    body {
  font-family: Arial, sans-serif;
  background: url(http://www.shukatsu-note.com/wp-content/uploads/2014/12/computer-564136_1280.jpg) no-repeat;
  background-size: cover;
  height: 100vh;
}

a:visited, hover {
    color: #D90368;
}

h1 {
  text-align: center;
  font-family: Tahoma, Arial, sans-serif;
  color: #06D85F;
  margin: 80px 0;
}

.overlay {
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  background: rgba(0, 0, 0, 0.7);
  transition: opacity 500ms;
  visibility: hidden;
  opacity: 0;
}
.overlay:target {
  visibility: visible;
  opacity: 1;
}

.popup {
  margin: 70px auto;
  padding: 20px;
  background: #fff;
  border-radius: 5px;
  width: 50%;
  position: relative;
  transition: all 5s ease-in-out;
}

.popup h2 {
  margin-top: 0;
  color: #333;
  font-family: Tahoma, Arial, sans-serif;
}
.popup .close {
  position: absolute;
  top: 20px;
  right: 30px;
  transition: all 200ms;
  font-size: 30px;
  font-weight: bold;
  text-decoration: none;
  color: #333;
}
.popup .close:hover {
  color: #06D85F;
}
.popup .content {
  max-height: 70%;
  overflow: auto;
}

@media screen and (max-width: 1000px){
  .box{
    width: 70%;
  }
  .popup{
    width: 60%;
  }
}
.successAlert{
	color: #025b19; 
	background-color: rgba(182, 249, 229, 0.5); 
	border: 2px solid #14e595; 
	margin: 7px 0px; 
	padding: 8px;
	border-radius: 5px;
}

.errorAlert{
	color: #c11d07; 
	background-color: rgba(242, 198, 205, 0.5); 
	border: 2px solid #e85c76; 
	margin: 8px 0px; 
	padding:8px;
	border-radius: 5px;
}
</style>

<jsp:include page="/WEB-INF/includes/footer.jsp"/>