/** VALIDATION **/

var validGuest = false;
var validMeal = false;


function validateResponseForm(){
	console.log(validGuest);
	console.log(validMeal);
	if (validGuest && validMeal){
		form.submit();
		form.reset();
	}
	else{
		var guest = val.value;
		if (guest == "" || guest == null){
			//document.getElementById("titleError").innerHTML = "<i class='fas fa-times'></i>  Please enter a list title";
			$(val).siblings('.plusOneError').first().show();
			validGuest = false;
		}
		else{
			//document.getElementById("titleError").innerHTML = "";
			$(val).siblings('.plusOneError').first().hide();
			validGuest = true;
		}		
		var meal = val.value;
		if (meal == "" || meal == null){
			//document.getElementById("titleError").innerHTML = "<i class='fas fa-times'></i>  Please enter a list title";
			$(val).siblings('.mealError').first().show();
			validMeal = false;
		}
		else{
			//document.getElementById("titleError").innerHTML = "";
			$(val).siblings('.mealError').first().hide();
			validMeal = true;
		}		
		return false;
	}
	return true;
}

function validateGuest(val){
	//var listTitle = document.getElementsByClassName("titleList")[0].value;
	var guest = val.value;
	if (guest == ""){
		//document.getElementById("titleError").innerHTML = "<i class='fas fa-times'></i>  Please enter a list title";
		$(val).siblings('.plusOneError').first().show();
		validGuest = false;
	}
	else{
		//document.getElementById("titleError").innerHTML = "";
		$(val).siblings('.plusOneError').first().hide();
		validGuest = true;
	}		
}

// Validate MEAL

function validateMeal(val){
	//var listTitle = document.getElementsByClassName("titleList")[0].value;
	var meal = val.value;
	if (meal == ""){
		//document.getElementById("titleError").innerHTML = "<i class='fas fa-times'></i>  Please enter a list title";
		$(val).siblings('.mealError').first().show();
		validMeal = false;
	}
	else{
		//document.getElementById("titleError").innerHTML = "";
		$(val).siblings('.mealError').first().hide();
		validMeal = true;
	}		
}