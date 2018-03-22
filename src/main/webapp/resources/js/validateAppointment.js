/** Validation **/

var aTitle = false;
var aDay = false;
var aMonth = false;
var aYear = false;
var aHour = false;
var aMinute = false;
var aAmPm = false;
var aAddress = false;
var aColor = false;

function validateAppt(){
	console.log(aTitle);
	console.log(aAddress);
	console.log(aColor);
	
	if (aTitle && aAddress && aColor){
		form.submit();
		form.reset();
	}
	else{
		return false;
	}
	return true;
}

function aptTitle(){
	var apptTitle = document.getElementsByClassName("apptTitle")[0].value;
	
	if (apptTitle == ""){
		document.getElementById("aTitleError").innerHTML = "<i class='fas fa-times'></i>  Please enter a title";
		aTitle = false;
	}
	else{
		document.getElementById("aTitleError").innerHTML = "";
		aTitle = true;
	}
}

function aptAddress(){
	var apptAddress = document.getElementsByClassName("apptAddress")[0].value;
	
	if (apptAddress == ""){
		document.getElementById("aAddressError").innerHTML = "<i class='fas fa-times'></i>  Please enter an address";
		aAddress = false;
	}
	else{
		document.getElementById("aAddressError").innerHTML = "";
		aAddress = true;
	}
}
function aptColor(){
	var apptColor = document.apt.aptColor;
	
	for (var i = 0; i < apptColor.length; i++){
		if (apptColor[i].checked)
			break;
	}
	if (i == apptColor.length){
		document.getElementById("aColorError").innerHTML = "<i class='fas fa-times'></i>  Please select a color";
	}
	else{
		document.getElementById("aColorError").innerHTML = "";
	}
}

