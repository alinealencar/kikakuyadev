/** VALIDATION FOR ADD GUEST**/

var validFirstName = false;
var validLastName = false;
var validEmail = false;

function validateGuestForm(){
	console.log(validFirstName);
	console.log(validLastName);
	console.log(validEmail);
	if (validFirstName && validLastName && validEmail){
		form.submit();
		form.reset();
	}
	else{
		var fName = document.getElementsByClassName("fName")[0].value;
		
		if (fName == ""){
			document.getElementById("fNameError").innerHTML = "<i class='fas fa-times' font-size:''></i>  Please enter first name";
			validFirstName = false;
		}
		else if (!fName.match(/^[a-zA-Z\s]+$/)){
			document.getElementById("fNameError").innerHTML = "<i class='fas fa-times' font-size:''></i>  Alphabets only";
			validFirstName = false;
		}
		else{
			document.getElementById("fNameError").innerHTML = "";
			validFirstName = true;
		}
		var lName = document.getElementsByClassName("lName")[0].value;
		
		if (lName == ""){
			document.getElementById("lNameError").innerHTML = "<i class='fas fa-times'></i>  Please enter last name";
			validLastName = false;
		}
		else if (!lName.match(/^[a-zA-Z\s]+$/)){
			document.getElementById("lNameError").innerHTML = "<i class='fas fa-times'></i>  Alphabets only";
			validLastName = false;
		}
		else{
			document.getElementById("lNameError").innerHTML = "";
			validLastName = true;
		}
		var email = document.getElementsByClassName("guestEmail")[0].value;
		var emailRegEx = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/
		
		if (!emailRegEx.test(email)){
			document.getElementById("emailError").innerHTML = "<i class='fas fa-times'></i>  Email is not valid";
			validEmail = false;
		}
		else if (email === "" || email === null){
			document.getElementById("emailError").innerHTML = "<i class='fas fa-times'></i>  Enter email address";
			validEmail = false;
		}
		else {
		document.getElementById("emailError").innerHTML = "";
		validEmail = true;
		}
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
	else if (!fName.match(/^[a-zA-Z\s]+$/)){
		document.getElementById("fNameError").innerHTML = "<i class='fas fa-times' font-size:''></i>  Alphabets only";
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
	else if (!lName.match(/^[a-zA-Z\s]+$/)){
		document.getElementById("lNameError").innerHTML = "<i class='fas fa-times'></i>  Alphabets only";
		validLastName = false;
	}
	else{
		document.getElementById("lNameError").innerHTML = "";
		validLastName = true;
	}
}

function validateEmail(){
	var email = document.getElementsByClassName("guestEmail")[0].value;
	var emailRegEx = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/
	
	if (!emailRegEx.test(email)){
		document.getElementById("emailError").innerHTML = "<i class='fas fa-times'></i>  Email is not valid";
		validEmail = false;
	}
	else if (email === "" || email === null){
		document.getElementById("emailError").innerHTML = "<i class='fas fa-times'></i>  Enter email address";
		validEmail = false;
	}
	else {
	document.getElementById("emailError").innerHTML = "";
	validEmail = true;
	}
}

/**VALIDATION FOR EDIT GUEST**/

var editFName = false;
var editLName = false;
var editEmail = false;

function validateEditForm(){
	console.log(editFName);
	console.log(editLName);
	console.log(editEmail);
	if (editFName && editLName && editEmail){
		form.submit();
		form.reset();
	}
	else{
		var editfName = document.getElementsByClassName("editfName")[0].value;
		
		if (editfName == ""){
			document.getElementById("fNameEdit").innerHTML = "<i class='fas fa-times' font-size:''></i>  Please enter first name";
			editFName = false;
		}
		else if (!editfName.match(/^[a-zA-Z\s]+$/)){
			document.getElementById("fNameEdit").innerHTML = "<i class='fas fa-times' font-size:''></i>  Alphabets only";
			editFName = false;
		}
		else{
			document.getElementById("fNameEdit").innerHTML = "";
			editFName = true;
		}
		var editlName = document.getElementsByClassName("editlName")[0].value;
		
		if (editlName == ""){
			document.getElementById("lNameEdit").innerHTML = "<i class='fas fa-times' font-size:''></i>  Please enter first name";
			editLName = false;
		}
		else if (!editlName.match(/^[a-zA-Z\s]+$/)){
			document.getElementById("lNameEdit").innerHTML = "<i class='fas fa-times' font-size:''></i>  Alphabets only";
			editLName = false;
		}
		else{
			document.getElementById("lNameEdit").innerHTML = "";
			editLName = true;
		}
		var editEadd = document.getElementsByClassName("editEmailAdd")[0].value;
		var emailRegEx = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/
		
		if (!emailRegEx.test(editEadd)){
			document.getElementById("editEmailError").innerHTML = "<i class='fas fa-times'></i>  Email is not valid";
			editEmail = false;
		}
		else if (editEadd === "" || editEadd === null){
			document.getElementById("editEmailError").innerHTML = "<i class='fas fa-times'></i>  Enter email address";
			editEmail = false;
		}
		else {
			document.getElementById("editEmailError").innerHTML = "";
			editEmail = true;
		}
		return false
	}
	return true
}

function editFirstName(){
	var editfName = document.getElementsByClassName("editfName")[0].value;
	
	if (editfName == ""){
		document.getElementById("fNameEdit").innerHTML = "<i class='fas fa-times' font-size:''></i>  Please enter first name";
		editFName = false;
	}
	else if (!editfName.match(/^[a-zA-Z\s]+$/)){
		document.getElementById("fNameEdit").innerHTML = "<i class='fas fa-times' font-size:''></i>  Alphabets only";
		editFName = false;
	}
	else{
		document.getElementById("fNameEdit").innerHTML = "";
		editFName = true;
	}
}

function editLastName(){
	var editlName = document.getElementsByClassName("editlName")[0].value;
	
	if (editlName == ""){
		document.getElementById("lNameEdit").innerHTML = "<i class='fas fa-times' font-size:''></i>  Please enter first name";
		editLName = false;
	}
	else if (!editlName.match(/^[a-zA-Z\s]+$/)){
		document.getElementById("lNameEdit").innerHTML = "<i class='fas fa-times' font-size:''></i>  Alphabets only";
		editLName = false;
	}
	else{
		document.getElementById("lNameEdit").innerHTML = "";
		editLName = true;
	}
}

function editEmailAddress(){
		var editEadd = document.getElementsByClassName("editEmailAdd")[0].value;
		var emailRegEx = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/
		
		if (!emailRegEx.test(editEadd)){
			document.getElementById("editEmailError").innerHTML = "<i class='fas fa-times'></i>  Email is not valid";
			editEmail = false;
		}
		else if (editEadd === "" || editEadd === null){
			document.getElementById("editEmailError").innerHTML = "<i class='fas fa-times'></i>  Enter email address";
			editEmail = false;
		}
		else {
			document.getElementById("editEmailError").innerHTML = "";
			editEmail = true;
		}
}

function deleteGuest(){
	var guest = confirm ("Are you sure you want to delete this guest?");
	
	if (guest){
		$("#deleteGuestForm").attr("action", "deleteGuest");
	}
}