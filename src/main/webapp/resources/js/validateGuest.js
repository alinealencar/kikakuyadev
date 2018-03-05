/** VALIDATION **/

var validFirstName = false;
var validLastName = false;
var validEmail = false;

function validateGuestForm(){
	if (validFirstName && validLastName && validEmail){
		form.submit();
		form.reset();
	}
}

function validateName(){
	var firstName = document.getElementsByClassName("firstName")[0].value;
	var lastName = document.getElementsByClassName("lastName")[0].value;
	
	if (firstName == ""){
		document.getElementById("fNameError").innerHTML = "<i class='fas fa-times' font-size:''></i>  Please enter first name";
		validFirstName = false;
	}
	else{
		document.getElementById("fNameError").innerHTML = "";
		validFirstName = true;
	}
	
	if (lastName == ""){
		document.getElementById("lNameError").innerHTML = "<i class='fas fa-times'></i>  Please enter last name";
		validLastName = false;
	}
	else{
		document.getElementById("lNameError").innerHTML = "";
		validLastName = true;
	}
}

function validateEmail(){
	var email = document.getElementsByClassName("email")[0].value;
	var emailRegEx = /^\w+.\w+@[a-zA-Z0-9]+?\.[a-zA-Z]{2,3}$/;
	
	if (email === ""){
		document.getElementById("emailError").innerHTML = "<i class='fas fa-times'></i>  Please enter an email";
		validEmail = false;
	}
	if(emailRegEx.test("email") === false){
		document.getElementById("emailError").innerHTML = "<i class='fas fa-times'></i>  Email is not valid";
		validEmail = false;
	}
	else {
		document.getElementById("emailError").innerHTML = "";
		validEmail = true;
	}
}