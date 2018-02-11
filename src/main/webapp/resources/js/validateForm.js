//flags to check if each value is valid
	var validName = false;
	var validEmail = false; 
	var validPassword = false;
	var validConfirmPassword = false;

/** Validate Sign Up form and submit it */
function validateSignUpForm(){
	if(validName && validEmail && validPassword && validConfirmPassword){
		document.getElementById("signUpForm").reset();
		form.submit();
	}
		
}
	
/** Validate name */
function validateName(name) {
	if(name === "") {
		document.getElementById("nameError").innerHTML = "<i class='fas fa-times'></i>  Please enter a name";
		validName = false;
	}
	else {
		document.getElementById("nameError").innerHTML = "<span style='color:green'><i class='fas fa-check'></i></span>";
		validName = true;
	}
}
	
/** Validate email */
function validateEmail(email, id) {

	var emailRegEx = /^\w+.\w+@[a-zA-Z0-9]+?\.[a-zA-Z]{2,3}$/;

	if (email === "") {
		document.getElementById(id).innerHTML = "<i class='fas fa-times'></i>  Please enter an email";
		validEmail = false;
	}
	if(emailRegEx.test(email) === false){
		document.getElementById(id).innerHTML = "<i class='fas fa-times'></i>  Email is not valid";
		validEmail = false;
	}
	else {
		document.getElementById(id).innerHTML = "<span style='color:green'><i class='fas fa-check'></i></span>";
		validEmail = true;
	}
}

/** Validate password and confirm password */
function validatePassword() {
	var password = document.getElementById("signUpPassword").value;
	var passwordConfirm = document.getElementById("signUpConfirmPassword").value;

	if (password === "") {
		document.getElementById("passwordSignUpError").innerHTML = "<i class='fas fa-times'></i>  Please enter a password";
		validPassword = false;
	}
	//Password must have a minimum of 6 characters
	else if (password.length < 6) {
		document.getElementById("passwordSignUpError").innerHTML = "<i class='fas fa-times'></i>  Password must have a minimum of 6 characters";
		validPassword = false;
	}
	else {
		document.getElementById("passwordSignUpError").innerHTML = "<span style='color:green'><i class='fas fa-check'></i></span>";
		validPassword = true;
	}

	//validate if passwords are matching
	if (passwordConfirm === "") {
		document.getElementById("confirmPasswordSignUpError").innerHTML = "<i class='fas fa-times'></i>  Please type your password again";
		validConfirmPassword = false;
	}
	else if (password !== passwordConfirm){
		document.getElementById("confirmPasswordSignUpError").innerHTML = "<i class='fas fa-times'></i>  Password does not match";
		validConfirmPassword = false;
	} 
	else {
		document.getElementById("confirmPasswordSignUpError").innerHTML = "<span style='color:green'><i class='fas fa-check'></i></span>";
		validConfirmPassword = true;
	}
}
