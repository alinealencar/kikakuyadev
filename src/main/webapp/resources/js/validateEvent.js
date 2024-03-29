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
		var eventName = document.getElementsByClassName("eventName")[0].value;
		var eNameRegEx = /^[\w\s]*$/
		
		if (eventName == ""){
			document.getElementById("eventNameError").innerHTML = "<i class='fas fa-times'></i>  Please enter an event name";
			validEventName = false;
		}
		else if (!eventName.match(eNameRegEx)){
			document.getElementById("eventNameError").innerHTML = "<i class='fas fa-times'></i>  No special characters";
			validEventName = false;
		}
		else{
			document.getElementById("eventNameError").innerHTML = "";
			validEventName = true;
		}
		var location = document.getElementsByClassName("location")[0].value;
		if (location == ""){
			document.getElementById("locationError").innerHTML = "<i class='fas fa-times'></i>  Please enter a location";
			validLocation = false;
		}
		else{
			document.getElementById("locationError").innerHTML = "";
			validLocation = true;
		}
		var today = new Date();
		var eventDate = new Date(document.getElementsByClassName("eventDate")[0].value);
		
		if (eventDate.value == null || eventDate.value == ""){
			document.getElementById("eventDateError").innerHTML = "<i class='fas fa-times'></i>  Please enter valid date";
			validDate = false;
		}
		else if(eventDate.value < today || !eventDate.value){
			document.getElementById("eventDateError").innerHTML = "<i class='fas fa-times'></i>  You chose a past date";
			validDate = false;
		}
		else{
			document.getElementById("eventDateError").innerHTML = "";
			validDate = true;
		}
		return false;
	}
	return true;
}

/** Validate event name**/

function validateEventName(){
	var eventName = document.getElementsByClassName("eventName")[0].value;
	var eNameRegEx = /^[\w\s]*$/
	
	if (eventName == ""){
		document.getElementById("eventNameError").innerHTML = "<i class='fas fa-times'></i>  Please enter an event name";
		$("#eventNameError").show();
		validEventName = false;
	}
	else if (!eventName.match(eNameRegEx)){
		document.getElementById("eventNameError").innerHTML = "<i class='fas fa-times'></i>  No special characters";
		$("#eventNameError").show();
		validEventName = false;
	}
	else{
		document.getElementById("eventNameError").innerHTML = "";
		validEventName = true;
	}
}

function validateLocation(){
	var location = document.getElementsByClassName("location")[0].value;
	if (location == ""){
		document.getElementById("locationError").innerHTML = "<i class='fas fa-times'></i>  Please enter a location";
		$("#locationError").show();
		validLocation = false;
	}
	else{
		document.getElementById("locationError").innerHTML = "";
		validLocation = true;
	}
}

function validateDate(){
	var today = new Date();
	var eventDate = new Date(document.getElementsByClassName("eventDate")[0].value);
	
	if (eventDate.value == ""){
		document.getElementById("eventDateError").innerHTML = "<i class='fas fa-times'></i>  Please enter valid date";
		$("#eventDateError").show();
		validDate = false;
	}
	else if(eventDate < today){
		document.getElementById("eventDateError").innerHTML = "<i class='fas fa-times'></i>  You chose a past date";
		$("#eventDateError").show();
		validDate = false;
	}
	else{
		document.getElementById("eventDateError").innerHTML = "";
		validDate = true;
	}
}

/**VALIDATE EDIT EVENT**/

var validEditEventName = false;
var validEditLocation = false;
var validEditDate = false;

function validateEditEventForm(){
	if (validEditEventName && validEditLocation && validEditDate){
		console.log(validEditEventName);
		console.log(validEditLocation);
		console.log(validEditDate);
		form.submit();
		form.reset();
	}
	else{
		var eventEditName = document.getElementsByClassName("eventName-edit")[0].value;
		var editRegEx = /^[\w\s]*$/
		
		if (eventEditName == "" || eventEditName == null){
			document.getElementById("eventEditNameError").innerHTML = "<i class='fas fa-times'></i>  Please enter an event name";
			validEditEventName = false;
		}
		else if (!eventEditName.match(editRegEx)){
			document.getElementById("eventEditNameError").innerHTML = "<i class='fas fa-times'></i>  No special characters";
			validEditEventName = false;
		}
		else{
			document.getElementById("eventEditNameError").innerHTML = "";
			validEditEventName = true;
		}
		var editLocation = document.getElementsByClassName("location-edit")[0].value;
		if (editLocation == ""){
			document.getElementById("locationEditError").innerHTML = "<i class='fas fa-times'></i>  Please enter a location";
			validEditLocation = false;
		}
		else{
			document.getElementById("locationEditError").innerHTML = "";
			validEditLocation = true;
		}
		var editToday = new Date();
		var eventEditDate = new Date(document.getElementsByClassName("date-edit")[0].value);
		
		if (eventEditDate.value == "" || eventEditDate.value == "null"){
			document.getElementById("eventEditDateError").innerHTML = "<i class='fas fa-times'></i>  Please enter valid date";
			console.log("yes!");
			validEditDate = false;
		}
		else if(eventEditDate < editToday){
			document.getElementById("eventEditDateError").innerHTML = "<i class='fas fa-times'></i>  You chose a past date";
			validEditDate = false;
		}
		else{
			document.getElementById("eventEditDateError").innerHTML = "";
			validEditDate = true;
		}
		return false;
	}
	return true;
}

/** Validate event name**/

function validateEditEventName(){
	var eventEditName = document.getElementsByClassName("eventName-edit")[0].value;
	var editRegEx = /^[\w\s]*$/
	
	if (eventEditName == "" || eventEditName == null){
		document.getElementById("eventEditNameError").innerHTML = "<i class='fas fa-times'></i>  Please enter an event name";
		$("#eventEditNameError").show();
		validEditEventName = false;
	}
	else if (!eventEditName.match(editRegEx)){
		document.getElementById("eventEditNameError").innerHTML = "<i class='fas fa-times'></i>  No special characters";
		$("#eventEditNameError").show();
		validEditEventName = false;
	}
	else{
		document.getElementById("eventEditNameError").innerHTML = "";
		validEditEventName = true;
	}
}

function validateEditLocation(){
	var editLocation = document.getElementsByClassName("location-edit")[0].value;
	if (editLocation == ""){
		document.getElementById("locationEditError").innerHTML = "<i class='fas fa-times'></i>  Please enter a location";
		$("#locationEditError").show();
		validEditLocation = false;
	}
	else{
		document.getElementById("locationEditError").innerHTML = "";
		validEditLocation = true;
	}
}

function validateEditDate(){
	var today = new Date();
	var eventEditDate = new Date(document.getElementsByClassName("date-edit")[0].value);
	
	if (eventEditDate.value == "" || eventEditValue.value == null){
		document.getElementById("eventEditDateError").innerHTML = "<i class='fas fa-times'></i>  Please enter valid date";
		$("#eventEditDateError").show();
		validEditDate = false;
	}
	else if(eventEditDate < today){
		document.getElementById("eventEditDateError").innerHTML = "<i class='fas fa-times'></i> You chose a past date";
		$("#eventEditDateError").show();
		validEditDate = false;
	}
	else{
		document.getElementById("eventEditDateError").innerHTML = "";
		validEditDate = true;
	}
}

/** EVENT PAGE SHOW AND HIDE **/


//function showForm(){
//	//document.getElementById("showEventList").style.display = 'none';
//	document.getElementById("showAddForm").style.display = 'block';
//	//document.getElementById("editEvent").style.display = 'none';
//	//document.getElementById("noEvent").style.display = 'none';
//}

function showAddEventForm() {
    var addForm = document.getElementById("addEvent");
    var eventList = document.getElementById("showEventList");
    if (addForm.style.display === "none") {
    	addForm.style.display = "inline-block";
    	eventList.style.display = "none";
    }
}

function showEditEvent(){
	document.getElementById("showEventList").style.display = 'none';
	document.getElementById("showAddForm").style.display = 'none';
	document.getElementById("editEvent").style.display = 'inline-block';
	//$('editEvent').modal();
	$('editButton').submit();
}

function showList(){
	var alertMsg = document.getElementById("alertMsg");
}

//confirm if event will be deleted
function deleteEvent(){
	var event = confirm ("Are you sure you want to delete this event?");
	
	return event;
}

setTimeout(function() {
    $('.successAlert').fadeOut('fast');
    }, 3000);

setTimeout(function() {
    $('.errorAlert').fadeOut('fast');
    }, 3000);

//$(document).ready(function(){
//	if($('.eventsList').length == 3){
//		$("#btnAddEvent").hide();	
//	}
//	else{
//		$("#btnAddEvent").show();
//	}
//});

$(document).ready(function(){
	$("#btnShowAddError").click(function () {
		$("#countEventError").show();
	});
});

function hideError(){
	$("#eventNameError").hide();
	$("#locationError").hide();
	$("#eventDateError").hide();
}
function editHideError(){
	$("#eventEditNameError").hide();
	$("#locationEditError").hide();
	$("#eventEditDateError").hide();
}