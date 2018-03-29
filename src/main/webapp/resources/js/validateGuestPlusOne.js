/**Validate oninput edit plus one**/

var validGuest = false;
var validMeal = false;

//Validate guest plus one name
function validateName(val){
	var guestName = val.value;
	
	if (guestName == "" ){
		document.getElementById("plusOneError").innerHTML = "<span style='font-size: 10px; text-align:left;'><i class='fas fa-times'></i>  Please enter name";
		//$('#titleError').show();
		validGuest = false;
	}
	else{
		document.getElementById("plusOneError").innerHTML = "";
		validGuest = true;
	}
}

//Validate meal choice
function validateMeal(val){
	var guestName = val.value;
	
	if (guestName == "" ){
		document.getElementById("mealError").innerHTML = "<span style='font-size: 10px; text-align:left;'><i class='fas fa-times'></i>  Please enter name";
		//$('#titleError').show();
		validMeal = false;
	}
	else{
		document.getElementById("mealError").innerHTML = "";
		validMeal = true;
	}
}