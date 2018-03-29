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
		var guestOne = document.getElementById("guestName")[0].value;
		var adultName1 = document.getElementById("adultName1")[0].value;
		var adultName2 = document.getElementById("adultName2")[0].value;
		var adultName3 = document.getElementById("adultName3")[0].value;
		var adultName4 = document.getElementById("adultName4")[0].value;
		var kidName1 = document.getElementById("kidName1")[0].value;
		var kidName2 = document.getElementById("kidName2")[0].value;
		var kidName3 = document.getElementById("kidName3")[0].value;
		var kidName4 = document.getElementById("kidName4")[0].value;
		
		if (guestOne == "" || guestOne == null || adultName1 == "" || adultName1 == null || adultName2 == "" || adultName2 == null ||
				adultName3 == "" || adultName3 == null || adultName4 == "" || adultName4 == null || kidName1 == "" || kidName1 == null ||
				kidName2 == "" || kidName2 == null || kidName3 == "" || kidName3 == null || kidName4 == "" || kidName4 == null)
			{
				document.getElementById("plusOneError").innerHTML = "<span style='font-size: 10px; text-align:left;'><i class='fas fa-times'></i>  Please enter name";
				validGuest = false;
			}
		
		else{
			document.getElementById("plusOneError").innerHTML = "";
			validGuest = true;
		}
		return false;
	}
	return true;
}

function validateGuest(val){
	var guest = val.value;
	if (guest == ""){
		$(val).siblings('.plusOneError').first().show();
		validGuest = false;
	}
	else{
		$(val).siblings('.plusOneError').first().hide();
		validGuest = true;
	}		
}

// Validate MEAL

function validateMeal(val){
	var meal = val.value;
	if (meal == ""){
		$(val).siblings('.mealError').first().show();
		validMeal = false;
	}
	else{
		$(val).siblings('.mealError').first().hide();
		validMeal = true;
	}		
}