<!-- Change feature variable -->
<%! String feature = "Guests" ;%>

<% session.setAttribute("feature", feature); %>
<% session.setAttribute("title", "KIKAKUYA - " + feature); %>
<jsp:include page="/WEB-INF/includes/head.jsp" />
<jsp:include page="/WEB-INF/includes/header.jsp"/>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<div class="container">
	<!-- body contents start -->
	<h2>Send Messages</h2>
	<div>
		<div class="${(sendRSVPSuccess != null) ? 'alert alert-success':''}" role="alert">${sendRSVPSuccess}</div>
		<div class="${(sendRSVPError != null) ? 'alert alert-danger':''}" role="alert">${sendRSVPError}</div>
		<div class="${(sendBroadcastSuccess != null) ? 'alert alert-success':''}" role="alert">${sendBroadcastSuccess}</div>
	</div>
	<div class="form-group row">
		<div class="col-sm-4">
		  	<h5>1. Select type of the message</h5>
		</div>
		<label class="radio-inline text-sm-center col-sm-4" onclick="showRSVP()">
			<input type="radio" name="messageType" value="RSVP">RSVP
		</label>
		<label class="radio-inline text-sm-center col-sm-4" onclick="showBroadcast()">
			<input type="radio" name="messageType" value="broadcast">Broadcast Message
		</label>
	</div>


	<div  id="rsvpForm" style="display:none;">
		<form:form action="rsvp" method="post" modelAttribute="email">
		
			<div  class="form-group row">
				<div class="col-sm-4">
					<h5>2. Reply Due</h5>
				</div>		
  				<label for="replyDue" class="sr-only col-2 col-form-label">Reply Due</label>
  				<div class="col-sm-8">
    				<form:input class="form-control" type="date"  id="replyDue" path="replyDue"/>
  				</div>
     		</div>
     		
     		<div  class="form-group row">
				<div class="col-sm-4">
					<h5>3. Meal choices</h5>
				</div>
				<div class="col-sm-8">		
 					<div class="form-check form-check-inline">
  						<form:checkbox class="form-check-input" id="beef" value="Beef" path="mealChoiceBeef" />
  						<label class="form-check-label" for="beaf">Beef</label>
					</div>
					<div class="form-check form-check-inline">
					  <form:checkbox class="form-check-input" id="pork" value="Pork" path="mealChoicePork" />
					  <label class="form-check-label" for="pork">Pork</label>
					</div>
					<div class="form-check form-check-inline">
					  <form:checkbox class="form-check-input" id="chicken" value="Chicken" path="mealChoiceChicken" />
					  <label class="form-check-label" for="chicken">Chicken</label>
					</div>
					<div class="form-check form-check-inline">
  						<form:checkbox class="form-check-input" id="vegetarian" value="Vegetarian" path="mealChoiceVeg" />
  						<label class="form-check-label" for="vegetarian">Vegetarian</label>
					</div>
					<div class="form-check form-check-inline">
					  <form:checkbox class="form-check-input" id="fish" value="Fish" path="mealChoiceFish" />
					  <label class="form-check-label" for="fish">Fish</label>
					</div>
					<div class="form-check form-check-inline">
					  <form:checkbox class="form-check-input" id="kids" value="Kids" path="mealChoiceKids" />
					  <label class="form-check-label" for="kids">Kids</label>
					</div>
  				</div>
     		</div>
     		
     		<div  class="form-group row">
     			<div class="col-sm-4 text-center">
	     			 <button type="submit" class="btn btn-success col-6">Send</button>
	     		</div>
	     		<div class="col-sm-4 text-center">
	     			 <button type="button" class="btn btn-outline-secondary col-6">Clear</button>
	     		</div>
	     		<div class="col-sm-4 text-center">
					 <button type="button" class="btn btn-danger col-6">Cancel</button>
				</div>
     		</div>
     		
		</form:form>		
	</div>

	
	<div id="broadcastForm" style="display:none;">
		<form:form action="broadcast" method="post" modelAttribute="email">
		
			<div  class="form-group row">
				<div class="col-sm-4">
					<h5>2. Subject of the message</h5>
				</div>
  				<label for="subject" class="sr-only col-2 col-form-label">Subject</label>
  				<div class="col-sm-8">
    				<form:input class="form-control" type="text" id="subject" path="title"/>
  				</div>
			</div>
    
    		<div  class="form-group row">
				<div class="col-sm-4">
					<h5>3. Select recipients</h5>
				</div>
				<div class="col-sm-4">
					<div class="form-check">
						<form:radiobutton class="form-check-input" name="recipients" id="all" value="all" path="status" onclick="hideSelectGuests()" />
						<label class="form-check-label" for="all">
							 All
						</label>
					</div>
					<div class="form-check">
					  	<form:radiobutton class="form-check-input" name="recipients" id="attending" value="1" path="status" onclick="hideSelectGuests()" />
					  	<label class="form-check-label" for="attending">
					    	Attending guests
					  	</label>
					</div>
					<div class="form-check">
					  	<form:radiobutton class="form-check-input" name="recipients" id="absent" value="absent" path="status" onclick="hideSelectGuests()" />
					  	<label class="form-check-label" for="absent">
					    	Absent guests
					  	</label>
					</div>
					<div class="form-check">
					  	<form:radiobutton class="form-check-input" name="recipients" id="noReply" value="noReply" path="status" onclick="hideSelectGuests()" />
					  	<label class="form-check-label" for="noReply">
					    	Guests who haven't reply
					  	</label>
					</div>
					<div class="form-check">
					  	<input class="form-check-input" type="radio" name="recipients" id="select" value="select" path="status" onclick="showSelectGuests()">
					  	<label class="form-check-label" for="select">
					    	Select guests
					  	</label>
					</div>
					<div id="guestDropdown" class="form-group" style="display:none;">
					    <label for="guestSelection" class="sr-only">Guest Selection</label>
					    <select class="form-control" id="guestSelection" onchange="selectedGuestList()" >
					      <c:forEach items="${guests}" var="guest" varStatus="loop">
					      	<option value="${guest.guestId}">${guest.firstName} ${guest.lastName}</option>
					      </c:forEach>
					    </select>
					</div>
					
				</div>
				<div id="guestTextarea" class="col-sm-4" style="display:none;">
					<label for="selectedGuests">Selected guests:</label>
    				<form:textarea class="form-control" id="selectedGuests" rows="5" path="recipients"></form:textarea>
				</div>
  			</div>
  			
  			<div  class="form-group row">
  				<div class="col-sm-4">
					<h5>4. Compose message</h5>
				</div>
				<div class="col-sm-8">
					<h5><label for="message" class="sr-only">Compose message</label></h5>				
    				<form:textarea class="form-control" id="message" rows="3" path="message"></form:textarea>
    			</div>
  			</div>
  			
  			<div  class="form-group row">
     			<div class="col-sm-4 text-center">
	     			 <button type="submit" class="btn btn-success col-6">Send</button>
	     		</div>
	     		<div class="col-sm-4 text-center">
	     			 <button type="button" class="btn btn-outline-secondary col-6">Clear</button>
	     		</div>
	     		<div class="col-sm-4 text-center">
					 <button type="button" class="btn btn-danger col-6">Cancel</button>
				</div>
     		</div>
  			
		</form:form>		
	</div>
	

<script>
function showRSVP() {
    var rsvp = document.getElementById("rsvpForm");
    var broadcast = document.getElementById("broadcastForm");
    if (rsvp.style.display === "none") {
        rsvp.style.display = "block";
        broadcast.style.display = "none";
    }
}
function showBroadcast() {
    var rsvp = document.getElementById("rsvpForm");
    var broadcast = document.getElementById("broadcastForm");
    if (broadcast.style.display === "none") {
        broadcast.style.display = "block";
        rsvp.style.display = "none";
    }
}
function showSelectGuests(){
	var guestDropdown = document.getElementById("guestDropdown"); 
	var guestTextarea = document.getElementById("guestTextarea"); 
	
	if(guestDropdown.style.display === "none"){
		guestDropdown.style.display = "block";
		guestTextarea.style.display = "block";
	}
}
function hideSelectGuests(){
	var guestDropdown = document.getElementById("guestDropdown"); 
	var guestTextarea = document.getElementById("guestTextarea"); 
	
	if(guestDropdown.style.display === "block"){
		guestDropdown.style.display = "none";
		guestTextarea.style.display = "none";
	}
}
/********************* need to modify**************************/
function selectedGuestList(){
	var guestTextarea = document.getElementById('guestTextarea');
    var guestDropdown = document.getElementById('guestDropdown');
    guestDropdown.onchange = function(){
    	guestTextarea.text = guestTextarea.text  + this.text; //to appened
         //mytextbox.innerHTML = this.value;
    }
}
</script>
	
  	<!-- body contents end -->
</div>
<jsp:include page="/WEB-INF/includes/footer.jsp"/>