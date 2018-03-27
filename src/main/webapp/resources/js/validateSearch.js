/** VALIDATION **/

var validCategory = false;
var validLocation = false;

function validateSearch(){
	if (validCategory && validLocation){
		form.submit();
		form.reset();
	}
	else{
		//return false;
		var category = document.getElementsByClassName("category")[0].value;
		if (category == ""){
			document.getElementById("categoryError").innerHTML = "<i class='fas fa-times'></i> Please enter a category";
			validCategory = false;
		}
		else{
			document.getElementById("categoryError").innerHTML = "";
			validCategory = true;
		}
		var location = document.getElementsByClassName("location")[0].value;
		if (location == ""){
			document.getElementById("locationError").innerHTML = "<i class='fas fa-times'></i> Please enter a location";
			
			validLocation = false;
		}
		else{
			document.getElementById("locationError").innerHTML = "";
			validLocation = true;
		}
		return false;	
	}
	return true;
}

/** Validate category **/
function validateCategory(){
	var category = document.getElementsByClassName("category")[0].value;
	if (category == ""){
		document.getElementById("categoryError").innerHTML = "<i class='fas fa-times'></i> Please enter a category";
		validCategory = false;
	}
	else{
		document.getElementById("categoryError").innerHTML = "";
		validCategory = true;
	}
}

/** Validate location **/
function validateLocation(){
	var location = document.getElementsByClassName("location")[0].value;
	if (location == ""){
		document.getElementById("locationError").innerHTML = "<i class='fas fa-times'></i> Please enter a location";
		validLocation = false;
	}
	else{
		document.getElementById("locationError").innerHTML = "";
		validLocation = true;
	}
}

/** Validate category **/
function validateCategoryR(){
	var category = document.getElementsByClassName("category")[0].value;
	if (category == ""){
		document.getElementById("categoryError").innerHTML = "";
		validCategory = false;
	}
	else{
		document.getElementById("categoryError").innerHTML = "";
		validCategory = true;
	}
}

/** Validate location **/
function validateLocationR(){
	var location = document.getElementsByClassName("location")[0].value;
	if (location == ""){
		document.getElementById("locationError").innerHTML = "";
		validLocation = false;
	}
	else{
		document.getElementById("locationError").innerHTML = "";
		validLocation = true;
	}
}