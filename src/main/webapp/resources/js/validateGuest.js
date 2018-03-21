/** VALIDATION FOR ADD GUEST**/

var validFirstName = false;
var validLastName = false;
var validEmail = false;

function validateGuestForm(){
	console.log(validFirstName);
	console.log(validLastName);
	console.log(validEmail);
	if (validFirstName && validLastName){
		form.submit();
		form.reset();
	}
	else{
		return false;
	}
	return true;
}

function validateFirstName(){
	var fName = document.getElementsByClassName("fName")[0].value;
	
	if (fName == ""){
		document.getElementById("fNameError").innerHTML = "<i class='fas fa-times' font-size:''></i>  Please enter first name";
		validFirstName = false;
	}
	else{
		document.getElementById("fNameError").innerHTML = "";
		validFirstName = true;
	}
}

function validateLastName(){
	var lName = document.getElementsByClassName("lName")[0].value;
	
	if (lName == ""){
		document.getElementById("lNameError").innerHTML = "<i class='fas fa-times'></i>  Please enter last name";
		validLastName = false;
	}
	else{
		document.getElementById("lNameError").innerHTML = "";
		validLastName = true;
	}
}



//function validateEmail(){
//	var eAdd = document.getElementsByClassName("eAdd")[0].value;
//	var emailRegEx = /^\w+.\w+@[a-zA-Z0-9]+?\.[a-zA-Z]{2,3}$/;
//	
//	if (eAdd === ""){
//		document.getElementById("eAddError").innerHTML = "<i class='fas fa-times'></i>  Please enter an email";
//		validEmail = false;
//	}
//	if(emailRegEx.test("eAdd") === false){
//		document.getElementById("eAddError").innerHTML = "<i class='fas fa-times'></i>  Email is not valid";
//		validEmail = false;
//	}
//	else {
//		document.getElementById("eAddError").innerHTML = "";
//		validEmail = true;
//	}
//}

/**VALIDATION FOR EDIT GUEST**/

//var evalidFirstName = false;
//var evalidLastName = false;
//var evalidEmail = false;

function evalidateGuestForm(){
	console.log(evalidFirstName);
	console.log(evalidLastName);
	//console.log(evalidEmail);
	if (evalidFirstName && evalidLastName){
		form.submit();
		form.reset();
	}
	else{
		return false;
	}
	return true;
}

function evalidateFirstName(){
	var efName = document.getElementsByClassName("efName")[0].value;
	
	if (efName != ""){
		document.getElementById("efNameError").innerHTML = "";
		evalidFirstName = true;
	}
//	else{
//		document.getElementById("efNameError").innerHTML = "";
//		evalidFirstName = true;
//	}
}

function evalidateLastName(){
	var elName = document.getElementsByClassName("elName")[0].value;
	
	if (elName != ""){
		document.getElementById("elNameError").innerHTML = "";
		evalidLastName = true;
	}
//	else{
//		document.getElementById("elNameError").innerHTML = "";
//		evalidLastName = true;
//	}
}


