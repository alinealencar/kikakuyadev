/** VALIDATION **/

var validFirstName = false;
var validLastName = false;
var validEmail = false;

function validateGuestForm(){
	if (validName && validEmail){
		form.submit();
		form.reset();
	}
}

function validateName(){
	var firstName = document.getElementsByClassName("firstName")[0].value;
	var lastName = document.getElementsByClassName("firstName")[0].value;
	
	if (firstName == ""){
		document.getElementById("fNameError").innerHTML = "<i class='fas fa-times'></i>  Please enter first name";
		validName = false;
	}
	else{
		document.getElementById("fNameError").innerHTML = "<span style='color:green'><i class='fas fa-check'></i></span>";
		validName = true;
	}
	
	if (lastName == ""){
		document.getElementById("lNameError").innerHTML = "<i class='fas fa-times'></i>  Please enter last name";
		validName = false;
	}
	else{
		document.getElementById("lNameError").innerHTML = "<span style='color:green'><i class='fas fa-check'></i></span>";
		validName = true;
	}
}

function validateEmail(){
	var email = document.getElementsByClassName("email")[0].value;
	var emailRegEx = /^\w+.\w+@[a-zA-Z0-9]+?\.[a-zA-Z]{2,3}$/;
	
	if (email === ""){
		document.getElementById("email").innerHTML = "<i class='fas fa-times'></i>  Please enter an email";
		validEmail = false;
	}
	if(emailRegEx.test("email") === false){
		document.getElementById("email").innerHTML = "<i class='fas fa-times'></i>  Email is not valid";
		validEmail = false;
	}
	else {
		document.getElementById("email").innerHTML = "<span style='color:green'><i class='fas fa-check'></i></span>";
		validEmail = true;
	}
}