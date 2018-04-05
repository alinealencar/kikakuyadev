/** VALIDATION **/

var validGuest = false;
var validMeal = false;


$(document).ready(function(){
	$("#btnSendResponse").click(function () {
	console.log(validGuest);
	console.log(validMeal);
	var valid = true;
//	var guestOne = document.getElementById("guestName").value;
//	var adultName1 = document.getElementById("adultName1").value;
//	var adultName2 = document.getElementById("adultName2").value;
//	var adultName3 = document.getElementById("adultName3").value;
//	var adultName4 = document.getElementById("adultName4").value;
//	var kidName1 = document.getElementById("kidName1").value;
//	var kidName2 = document.getElementById("kidName2").value;
//	var kidName3 = document.getElementById("kidName3").value;
//	var kidName4 = document.getElementById("kidName4").value;
//	
	
	var guestOne = $('#guestName').val();
	var adultName1 = $('#adultName1').val();
	var adultName2 = $('#adultName2').val();
	var adultName3 = $('#adultName3').val();
	var adultName4 = $('#adultName4').val();
	var kidName1 = $('#kidName1').val();
	var kidName2 = $('#kidName2').val();
	var kidName3 = $('#kidName3').val();
	var kidName4 = $('#kidName4').val();
	var guestMeal = $('#guestMeal').val();
	var adultMeal1 = $('#adultMeal1').val();
	var adultMeal2 = $('#adultMeal2').val();
	var adultMeal3 = $('#adultMeal3').val();
	var adultMeal4 = $('#adultMeal4').val();
	var kidMeal1 = $('#kidMeal1').val();
	var kidMeal2 = $('#kidMeal2').val();
	var kidMeal3 = $('#kidMeal3').val();
	var kidMeal4 = $('#kidMeal4').val();
	
		if(guestOne == "" ){
			$('#mainGuestError').show();
			valid = false;
		}
		else
			valid = true;
		
		if($("#adultName1").is(":visible")){
			if(adultName1 == "") {
				$('#adult1Error').show();
				valid = false;
			}
			else
				valid = true;
		}
		
		
		if($("#adultName2").is(":visible")){
			if(adultName2 == "") {
				$('#adult2Error').show();
				valid = false;
			}
			else
				valid = true;
		}
		
		
		if($("#adultName3").is(":visible")){
			if(adultName3 == "") {
				$('#adult3Error').show();
				valid = false;
			}
			else
				valid = true;
		}
		
		
		if($("#adultName4").is(":visible")){
			if(adultName4 == "") {
				$('#adult4Error').show();
				valid = false;
			}
			else
				valid = true;
		}
		
		
		if($("#kidName1").is(":visible")){
			if(kidName1 == "") {
				$('#kid1Error').show();
				valid = false;
			}
			else
				valid = true;
		}
		
		
		if($("#kidName2").is(":visible")){
			if(kidName2 == "") {
				$('#kid2Error').show();
				valid = false;
			}
			else
				valid = true;
		}
		
		
		if($("#kidName3").is(":visible")){
			if(kidName3 == "") {
				$('#kid3Error').show();
				valid = false;
			}
			else
				valid = true;
		}
		
		
		if($("#kidName4").is(":visible")){
			if(kidName4 == "") {
				$('#kid4Error').show();
				valid = false;
			}
			else
				valid = true;
		}
		
		if ($("#guestMeal").length){
			if(guestMeal == "" || guestMeal == null){
				$('#guestMealError').show();
				valid = false;
			}
			else
				valid = true;
		}
		else
			valid = true;
		
		if ($("#adultMeal1").length){
			if($("#adultMeal1").is(":visible")){
				if(adultMeal1 == "" || adultMeal1 == null){
					$('#adult1MealError').show();
					valid = false;
				}
			else
				valid = true;
			}
		}
		else
			valid = true;
		
		if ($("#adultMeal2").length){
			if($("#adultMeal2").is(":visible")){
				if(adultMeal2 == "" || adultMeal2 == null){
					$('#adult2MealError').show();
					valid = false;
				}
				else
					valid = true;
			}
		}
		else
			valid = true;
		
		if ($("#adultMeal3").length){
			if($("#adultMeal3").is(":visible")){
				if(adultMeal3 == "" || adultMeal3 == null){
					$('#adult3MealError').show();
					valid = false;
				}
				else
					valid = true;
			}
		}
		else
			valid = true;
		
		if ($("#adultMeal4").length){
			if($("#adultMeal4").is(":visible")){
				if(adultMeal4 == "" || adultMeal4 == null){
					$('#adult4MealError').show();
					valid = false;
				}
				else
					valid = true;
			}
		}
		else
			valid = true;
		
		if ($("#kidMeal1").length){
			if($("#kidMeal1").is(":visible")){
				if(kidMeal1 == "" || kidMeal1 == null){
					$('#kid1MealError').show();
					valid = false;
				}
				else
					valid = true;
			}
		}
		else
			valid = true;
		
		if ($("#kidMeal2").length){
			if($("#kidMeal2").is(":visible")){
				if(kidMeal2 == "" || kidMeal2 == null){
					$('#kid2MealError').show();
					valid = false;
				}
				else
					valid = true;
			}
		}
		else
			valid = true;
		
		if ($("#kidMeal3").length){
			if($("#kidMeal3").is(":visible")){
				if(kidMeal3 == "" || kidMeal3 == null){
					$('#kid3MealError').show();
					valid = false;
				}
				else
					valid = true;
			}
		}
		else
			valid = true;
		
		if ($("#kidMeal4").length){
			if($("#kidMeal4").is(":visible")){
				if(kidMeal4 == "" || kidMeal4 == null){
					$('#kid4MealError').show();
					valid = false;
				}
				else
					valid = true;
			}
		}
		else
			valid = true;
		
		if(valid){
			$('#responseForm').submit();
		}
		else
			$('#errorResponse').show();
	});
});

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

setTimeout(function() {
    $('.errorAlert').fadeOut('fast');
    }, 3000);