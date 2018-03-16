/** VALIDATION **/

var validEventName = false;
var validLocation = false;
var validDate = false;

function validateEventForm(){
	if (validEventName && validLocation && validDate){
		form.submit();
		form.reset();
	}
	else{
		return false;
	}
	return true;
}

/** Validate event name**/

function validateEventName(){
	var eventName = document.getElementsByClassName("eventName").value;
	if (eventName == ""){
		document.getElementById("eventNameError").innerHTML = "<i class='fas fa-times'></i> Please enter an event name";
		validEventName = false;
	}
	else{
		document.getElementById("eventNameError").innerHTML = "";
		validEventName = true;
	}
}

function validateLocation(){
	var location = document.getElementsByClassName("location").value;
	if (location == ""){
		document.getElementById("locationError").innerHTML = "<i class='fas fa-times'></i>  Please enter a location";
		validLocation = false;
	}
	else{
		document.getElementById("locationError").innerHTML = "";
		validLocation = true;
	}
}

function validateDate(){
	var today = new Date();
	var eventDate = new Date(document.getElementsByClassName("eventDate").value);
	
	if (eventDate.value == ""){
		document.getElementById("eventDateError").innerHTML = "<i class='fas fa-times'></i>  Please enter valid date";
		console.log("yes!");
		validDate = false;
	}
	else if(eventDate < today){
		document.getElementById("eventDateError").innerHTML = "<i class='fas fa-times'></i>  Please enter valid date";
		validDate = false;
	}
	else{
		document.getElementById("eventDateError").innerHTML = "";
		validDate = true;
	}
}


/** EVENT PAGE SHOW AND HIDE **/

function closeAddForm(){
	document.getElementById("showEventList").style.display= 'inline-block';
	document.getElementById("showAddForm").style.display = 'none';
}

function showForm(){
	document.getElementById("showEventList").style.display = 'none';
	document.getElementById("showAddForm").style.display = 'inline-block';
	document.getElementById("editEvent").style.display = 'none';
	document.getElementById("noEvent").style.display = 'none';
}

function showEditEvent(){
	document.getElementById("showEventList").style.display = 'none';
	document.getElementById("showAddForm").style.display = 'none';
	document.getElementById("editEvent").style.display = 'inline-block';
	//$('editEvent').modal();
	$('editButton').submit();
	
}
	