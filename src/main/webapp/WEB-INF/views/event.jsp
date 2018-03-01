<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/includes/head.jsp" />
<jsp:include page="/WEB-INF/includes/eventHead.jsp" />


<div>
	<div class="${(insertError  != null) ? 'alert alert-danger' :''}" role="alert">${insertError }</div>
	<div class="${(addAnEvent  != null) ? 'alert alert-danger' :''}" role="alert">${addAnEvent }</div>
	<div class="${(noEvents  != null) ? 'alert alert-danger' :''}" role="alert">${noEvents }</div>
</div>
<div class="addEventBtn">
	<span class="glyphicon glyphicon-plus-sign" style="font-size:42px; color:#D90368; float:right; margin-right: 5%;" onclick="showForm()"></span>
</div>
<div class="container">
				
<!-- SHOWING THE EVENTS -->
	<div class="tile" id="showEventList">
		<c:forEach items="${listEvent}" var="event">
			<div class="eventTile" style="float:left;">
				<h4>${event.eventName} 
					<form:form action="delete" method="get" style="float:right">
						<input name="eventId" type="hidden" value="${event.eventId}"/>
						<button id="deleteBtn" type="submit" class="fas fa-trash"></button>
					</form:form>
					<span onclick="editEvent(); return false">
						<i class="fas fa-edit"></i>
					</span>
				</h4>
			
		<form:form modelAttribute="event" method="GET" action="showEvent">
		<form:hidden path="eventId" value="${event.eventId}"/>
			
			<!--input type="submit" value="Location: ${event.location} 
										Event Date: ${event.eventDate}"/-->
			<div class="tile-title">
				<button class="eventButton" type="submit" class="btn btn-default">
					<span>Location: ${event.location} <br/>
										Event Date: ${event.eventDate}</span></button>
			</div>							
			
		</form:form>
		
			</div>
		</c:forEach>
	</div>

<!-- ADD AN EVENT FORM  -->
<div id="showAddForm" style="display:none;">
<form:form modelAttribute="event" class="eventForm" method="POST" action="add" onsubmit="return validateEventForm();">
	<form:hidden path="eventId"/>

	<div>
		
		Event Name: <form:input path="eventName" class="eventName form-control" oninput="validateEventName()"/>
			<span id="eventNameError" class="formError"></span>
		<br>
		<!--Event Name: <form:input type="text" name="eventName" path="eventName" class="textInput"/>
		<div id="eventNameError" class="inputError"></div-->
	</div>
	<div>
		Location: <form:input path="location" class="location form-control" oninput="validateLocation()"/>
			<span id="locationError" class="formError"></span>
		<br>
		<!--form:input type="text" name="eventLocation" path="location"/>
		<div id="eventLocationError" class="inputError"></div-->
	</div>
	<div>
		Date: <form:input path="eventDate" type="date" class="eventDate form-control" oninput="validateDate()"/>
			<span id="eventDateError" class="formError"></span>
		<br>
		<!--form:input type="date" name="eventDate" path="eventDate"/>
		<div id="eventDateError" class="inputError"></div-->
	</div>
	<div>
		<!-- button type="submit" onclick="showList()">Save</button-->
		<input type="submit" value="Done" class="btn"/>
	</div>

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
<style>

.container{
	margin-top:60px;
}

h4{
	margin: 0px 10px 0px 10px;
	float:right;
}	

.eventTile{
	border-radius: 25px;
	height: 100%;
	float: center;
	border: solid;
	margin-right: 10px;
	}
	
.tile {
  /*transform: scale(1); */
  border-radius: 25px;
  width: 100%;
  margin: 5px;
  margin-left: 10px;
  
}

.tile-title{
	margin: 10px 10px 10px 10px;
}

footer {
	clear: both;
	height: 50px;
    padding: 15px;
    color: #F1E9DA;
	background-color: #541388;
	margin-top: 15px;	
}


.textInput{
	margin-top: 2px;
	height: 28px;
	border: 1px solid #5E6E66;
	font-size: 16px;
	padding: 1px;
	width: 100%;
}

.inputError{
	color: red;
}

.btn{
	padding: 7px;
	width: 100%;
	
}

#deleteBtn{
	outline: none;
  	color: black;
  	background-color: transparent;
  	border: none;
  	cursor: context-menu;
}

.eventButton {
  background-color: transparent;
  border: none;
  color: black;
  text-align: left;
  transition: all 0.5s;
  cursor: context-menu;
  margin: 5px;
}

.eventButton span {
  cursor: context-menu;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.eventButton span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.eventButton:hover span {
  padding-right: 25px;
  padding-left: 25px;
  padding-bottom: 10px;
}

.eventButton:hover span:after {
  opacity: 1;
  right: 0;
}

</style>
<script src="resources/js/event.js"></script>
<jsp:include page="/WEB-INF/includes/event.jsp" />
	