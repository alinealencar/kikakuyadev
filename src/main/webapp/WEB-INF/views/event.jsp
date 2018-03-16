<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="resources/css/eventPage.css"></script>
<jsp:include page="/WEB-INF/includes/head.jsp" />
<jsp:include page="/WEB-INF/includes/header-event.jsp" />


<div class="container">
	<div class="row"  style="margin-bottom: 45px;">
		<div  class="col-sm-10">
			<div id="alertMsg">
				<div class="${(insertError != null) ? 'alert alert-danger' :''}" role="alert">${insertError}</div>
				<div class="${(deleteEvent != null) ? 'alert alert-danger' :''}" role="alert">${deleteEvent}</div>
				
			</div>
		</div>
		<div class="col-sm-2 text-right">		
			<div class="addEventBtn">
				<span>
					<i class="fas fa-plus-circle" data-toggle="modal" data-target="#showAddForm" onclick="showList()"></i>
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
	<div class="tile row text-center" id="showEventList" >
		<c:forEach items="${listEvent}" var="event">
			<div class="col-sm-4">
				<div class="eventTile">
					<div class="tile-head">	
						<div class="row">
							<div class="col-8">
							</div>
							<div class="col-2 text-right" style="padding-right:0; padding-top:5px">								
								<form:form action="delete" method="get" onclick="deleteEvent()">
									<input name="eventId" type="hidden" value="${event.eventId}"/>
									<button id="deleteBtn" type="submit" class="far fa-trash-alt" style="margin-top:2.5px;"></button>
								</form:form>
							</div>
							<div class="col-2 text-left" style="padding-left:0; padding-top:5px">
								<span>
								<form:form action="edit" method="POST" modelAttribute="event" id="editButton" data-toggle="modal" data-target="editEvent">
									<form:hidden path="eventId" value="${event.eventId}"/>
									<button id="deleteBtn" type="submit" class="fas fa-edit"  style="color: #2E294E; margin-top:2.5px;"></button>
								</form:form>
								</span>
								
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
								Location: ${event.location}
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
							<label> Event Name<span style="font-size:22px;color:red">*</span>: </label> 
							<form:input path="eventName" class="eventName form-control" oninput="validateEventName()" maxlength="20"/>
							<span id="eventNameError" class="formError"></span>
							<br>
						</div>
						<div>
							<label>Location<span style="font-size:22px;color:red">*</span>: </label>
							<form:input path="location" class="location form-control" oninput="validateLocation()" maxlength="20"/>
								<span id="locationError" class="formError"></span>
							<br>
							<!--form:input type="text" name="eventLocation" path="location"/>
							<div id="eventLocationError" class="inputError"></div-->
						</div>
						<div>
							<label>Date<span style="font-size:22px;color:red">*</span>: </label>
							<form:input path="eventDate" type="date" class="eventDate form-control" oninput="validateDate()"/>
								<span id="eventDateError" class="formError"></span>
							<br>
							<!--form:input type="date" name="eventDate" path="eventDate"/>
							<div id="eventDateError" class="inputError"></div-->
						</div>
						
						<!-- Modal footer -->
				        <div class="text-right">
							<input class="btn btn-success" type="submit" value="Done"/>
						</div>
					</form:form>
			    </div>
    		</div>
    	</div>
	</div>
</div>
<!-- end of add event form-->

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
        		<div class="modal-body" >
    				<form:form modelAttribute="event" method="POST" action="update" >
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

</div>
<script src="resources/js/event.js"></script>
<jsp:include page="/WEB-INF/includes/footer.jsp"/>