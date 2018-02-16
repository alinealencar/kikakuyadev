<!-- Change feature variable -->
<%! String feature = "Guests" ;%>

<% session.setAttribute("feature", feature); %>
<% session.setAttribute("title", "KIKAKUYA - " + feature); %>
<jsp:include page="/WEB-INF/includes/head.jsp" />
<jsp:include page="/WEB-INF/includes/header.jsp"/>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<div id="contents" class="container">
	<!-- body contents start -->
	<h2>Send Messages</h2>
	<div id="alertMessage">
		<div class="${(sendRSVPSuccess != null) ? 'alert alert-success':''}" role="alert">${sendRSVPSuccess}</div>
		<div class="${(sendRSVPError != null) ? 'alert alert-danger':''}" role="alert">${sendRSVPError}</div>
		<div class="${(sendBroadcastSuccess != null) ? 'alert alert-success':''}" role="alert">${sendBroadcastSuccess}</div>
	</div>
	<div class="form-group row">
		<div class="col-sm-4">
		  	<h5>1. Select type of the message</h5>
		</div>
		<label class="radio-inline text-sm-center col-sm-4" onclick="showRSVP()">
			<input id="rbRsvp" type="radio" name="messageType" value="RSVP" required>RSVP
		</label>
		<label class="radio-inline text-sm-center col-sm-4" onclick="showBroadcast()">
			<input id="rbBroadcast" type="radio" name="messageType" value="broadcast">Broadcast Message
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
    				<form:input class="form-control" type="date" id="replyDue" path="replyDue" required="true"/>
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
	     			 <button type="reset" class="btn btn-outline-secondary col-6">Clear</button>
	     		</div>
	     		<div class="col-sm-4 text-center">
					 <button type="button" class="btn btn-danger col-6" oncLick="cancel()">Cancel</button>
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
    				<form:input class="form-control" type="text" id="subject" path="title" required="true"/>
  				</div>
			</div>
    
    		<div  class="form-group row">
				<div class="col-sm-4">
					<h5>3. Select recipients</h5>
				</div>
				<div class="col-sm-4">
					<div class="form-check">
						<form:radiobutton class="form-check-input" name="recipients" id="all" value="all" path="status" onclick="hideSelectGuests()" checked="true"/>
						<label class="form-check-label" for="all">
							 All
						</label>
					</div>
					<div class="form-check">
					  	<form:radiobutton class="form-check-input" name="recipients" id="attending" value="attending" path="status" onclick="hideSelectGuests()" />
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
					  	<form:radiobutton class="form-check-input" name="recipients" id="select" value="select" path="status" onclick="showSelectGuests()" />
					  	<label class="form-check-label" for="select">
					    	Select guests
					  	</label>
					</div>
					<div id="guestDropdown" class="form-group" style="display:none;">
					    <label for="guestSelection" class="sr-only">Guest Selection</label>
					    <form:select class="form-control" id="guestSelection" multiple="true" path="recipients">
					      <c:forEach items="${guests}" var="guest" varStatus="loop">
					      	<option value="${guest.guestId}">${guest.firstName} ${guest.lastName}</option>
					      </c:forEach>
					    </form:select>
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
    				<form:textarea class="form-control" id="message" rows="3" path="message" required="true"></form:textarea>
    			</div>
  			</div>
  			
  			<div  class="form-group row">
     			<div class="col-sm-4 text-center">
	     			 <button type="submit" class="btn btn-success col-6">Send</button>
	     		</div>
	     		<div class="col-sm-4 text-center">
	     			 <button type="reset" id="clear" class="btn btn-outline-secondary col-6">Clear</button>
	     		</div>
	     		<div class="col-sm-4 text-center">
					 <button type="reset" class="btn btn-danger col-6" onclick="cancel()">Cancel</button><br>
				</div>
     		</div>
  			
		</form:form>		
	</div>
	

<script>
function showRSVP() {
    var rsvp = document.getElementById("rsvpForm");
    var broadcast = document.getElementById("broadcastForm");
    var alertMsg = document.getElementById("alertMessage");
    if (rsvp.style.display === "none") {
        rsvp.style.display = "block";
        broadcast.style.display = "none";
        alertMsg.style.display = "none";
    }
}

function showBroadcast() {
    var rsvp = document.getElementById("rsvpForm");
    var broadcast = document.getElementById("broadcastForm");
    var alertMsg = document.getElementById("alertMessage");
    if (broadcast.style.display === "none") {
        broadcast.style.display = "block";
        rsvp.style.display = "none";
        alertMsg.style.display = "none";
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

$(function() {
    $('#clear').click(function() {
    	document.getElementById('selectedGuests').innerHTML = "";
		$('#guestSelection').hide();
		$('#selectedGuests').hide();
    });
});

$(function() {
    $('#select').click(function() {
		$('#guestSelection').show();
		$('#selectedGuests').show();
    });
});

function cancel(){
	var rsvp = document.getElementById("rsvpForm");
    var broadcast = document.getElementById("broadcastForm");
    document.getElementById("rbRsvp").checked = false;
    document.getElementById("rbBroadcast").checked = false;
    rsvp.style.display = "none";
    broadcast.style.display = "none";
}

function getSelectedOptions(sel, fn) {
    var opts = [], opt;
    
    for (var i=0, len=sel.options.length; i<len; i++) {
        opt = sel.options[i];
        
        if ( opt.selected ) {
            opts.push(opt);
            
            if (fn) {
                fn(opt);
            }
        }
    }
    
    return opts;
}

function callback(opt) {
    var display = document.getElementById('selectedGuests');
    display.innerHTML += opt.innerHTML + ' \n';
}

document.getElementById('guestSelection').onchange = function(e) {
    var display = document.getElementById('selectedGuests');
    display.innerHTML = ''; // reset
  
    getSelectedOptions(this, callback);
    
    var str = display.innerHTML.slice(0, -2);
    display.innerHTML = str;
};



</script>
  	<!-- body contents end -->
</div>
<jsp:include page="/WEB-INF/includes/footer.jsp"/>