
<!-- Change feature variable -->
<%! String feature = "Guests" ;%>

<% session.setAttribute("feature", feature); %>
<% session.setAttribute("title", "KIKAKUYA - " + feature); %>
<jsp:include page="/WEB-INF/includes/head.jsp" />
<jsp:include page="/WEB-INF/includes/header.jsp"/>

<div class="container">
	<!-- body contents start -->
	<h2>Send Messages</h2>

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
		<form action="" method="post">
		
			<div  class="form-group row">
				<div class="col-sm-4">
					<h5>2. Reply Due</h5>
				</div>		
  				<label for="replyDue" class="sr-only col-2 col-form-label">Reply Due</label>
  				<div class="col-sm-8">
    				<input class="form-control" type="date"  id="replyDue">
  				</div>
     		</div>
     		
     		<div  class="form-group row">
				<div class="col-sm-4">
					<h5>2. Max number of the people with the guest</h5>
				</div>		
  				<label for="adult" class="col-form-label col-sm-2 text-sm-right">Adults:</label>
	   			<div class="col-sm-2">
		      		<select class="form-control" id="adult">
		        		<option>0</option>
		        		<option>1</option>
		        		<option>2</option>
		        		<option>3</option>
		      		</select>
		      	</div>
	   			<label for="kid" class="col-form-label col-sm-2 text-sm-right">Kids:</label>
	   			<div class="col-sm-2">
	      			<select class="form-control" id="kid">
	        			<option>0</option>
	        			<option>1</option>
	        			<option>2</option>
	        			<option>3</option>
	      			</select>
	      		</div>
     		</div>
     		
     		<div  class="form-group row">
				<div class="col-sm-4">
					<h5>3. Meal choices</h5>
				</div>
				<div class="col-sm-8">		
 					<div class="form-check form-check-inline">
  						<input class="form-check-input" type="checkbox" id="beef" value="beef">
  						<label class="form-check-label" for="beaf">Beef</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="pork" value="pork">
					  <label class="form-check-label" for="pork">Pork</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="chicken" value="chicken">
					  <label class="form-check-label" for="chicken">Chicken</label>
					</div>
					<div class="form-check form-check-inline">
  						<input class="form-check-input" type="checkbox" id="vegetarian" value="vegetarian">
  						<label class="form-check-label" for="vegetarian">Vegetarian</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="fish" value="fish">
					  <label class="form-check-label" for="fish">Fish</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" id="kids" value="kids">
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
     		
		</form>		
	</div>

	
	<div id="broadcastForm" style="display:none;">
		<form action="" method="post">
		
			<div  class="form-group row">
				<div class="col-sm-4">
					<h5>2. Subject of the message</h5>
				</div>
  				<label for="subject" class="sr-only col-2 col-form-label">Subject</label>
  				<div class="col-sm-8">
    				<input class="form-control" type="text" id="subject">
  				</div>
			</div>
    
    		<div  class="form-group row">
				<div class="col-sm-4">
					<h5>3. Select recipients</h5>
				</div>
				<div class="col-sm-4">
					<div class="form-check">
						<input class="form-check-input" type="radio" name="recipients" id="all" value="all" checked onclick="hideSelectGuests()">
						<label class="form-check-label" for="all">
							 All
						</label>
					</div>
					<div class="form-check">
					  	<input class="form-check-input" type="radio" name="recipients" id="attending" value="attending" onclick="hideSelectGuests()">
					  	<label class="form-check-label" for="attending">
					    	Attending guests
					  	</label>
					</div>
					<div class="form-check">
					  	<input class="form-check-input" type="radio" name="recipients" id="absent" value="absent" onclick="hideSelectGuests()">
					  	<label class="form-check-label" for="absent">
					    	Absent guests
					  	</label>
					</div>
					<div class="form-check">
					  	<input class="form-check-input" type="radio" name="recipients" id="noReply" value="noReply" onclick="hideSelectGuests()">
					  	<label class="form-check-label" for="noReply">
					    	Guests who haven't reply
					  	</label>
					</div>
					<div class="form-check">
					  	<input class="form-check-input" type="radio" name="recipients" id="select" value="select" onclick="showSelectGuests()">
					  	<label class="form-check-label" for="select">
					    	Select guests
					  	</label>
					</div>
					<div id="guestDropdown" class="form-group" style="display:none;">
					    <label for="guestSelection" class="sr-only">Guest Selection</label>
					    <select class="form-control" id="guestSelection" onchange="selectedGuestList()">
					      <option>1</option>
					      <option>2</option>
					      <option>3</option>
					      <option>4</option>
					      <option>5</option>
					    </select>
					</div>
					
				</div>
				<div id="guestTextarea" class="col-sm-4" style="display:none;">
					<label for="selectedGuests">Selected guests:</label>
    				<textarea class="form-control" id="selectedGuests" rows="5" readonly></textarea>
				</div>
  			</div>
  			
  			<div  class="form-group row">
  				<div class="col-sm-4">
					<h5>4. Compose message</h5>
				</div>
				<div class="col-sm-8">
					<h5><label for="message" class="sr-only">Compose message</label></h5>				
    				<textarea class="form-control" id="message" rows="3"></textarea>
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
  			
		</form>		
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
