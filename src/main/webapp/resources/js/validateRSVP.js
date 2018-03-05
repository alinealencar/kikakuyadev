/** VALIDATION **/

var validReplyDue = false;
var validMealChoice = false;

function validateRSVPForm(){
	if (validReplyDue && validMealChoice){
		form.submit();
		form.reset();
	}
	else{
		return false;
	}
	return true;
}

/**Validate Reply Due**/
function validateReplyDue(){
	var today = new Date();
	var replyDue = new Date(document.getElementsByClassName("replyDue")[0].value);
	
	if (replyDue.value == ""){
		document.getElementById("replyDueError").innerHTML = "<i class='fas fa-times'></i>  Please enter valid date";
		validReplyDue = false;
	}
	else if(replyDue < today){
		document.getElementById("replyDueError").innerHTML = "<i class='fas fa-times'></i>  Please enter valid date";
		validReplyDue = false;
	}
	else{
		document.getElementById("replyDueError").innerHTML = "";
		validReplyDue = true;
	}
}

/**Validate Meal Choice -- Check atleast one checbox || NOT SURE YET**/
/*function validateMealChoice(){
	var mealChoice = document.getElementsByClassName("mealChoice")[0].value;
	
	if((mealChoice[0].checked == false) && (mealChoice[1].checked == false) && (mealChoice[2].checked == false) &&
			(mealChoice[3].checked == false) && (mealChoice[4].checked == false) && (mealChoice[5].checked == false)){
		document.getElementById("mealChoiceError").innerHTML = "<i class='fas fa-times'></i>  Please check atleast one";
		validMealChoice = false;
	}
	else{
		document.getElementById("mealChoiceError").innerHTML = "<span style='color:green'><i class='fas fa-check'></i></span>";
		validMealChoice = true;
	}
}*/

/*function validateMealChoice(){
	var mealChoiceBeef = document.getElementsByClassName("mealChoiceBeef")[0].value;
	var mealChoicePork = document.getElementsByClassName("mealChoicePork")[0].value;
	var mealChoiceChicken = document.getElementsByClassName("mealChoiceChicken")[0].value;
	var mealChoiceVeg = document.getElementsByClassName("mealChoiceVeg")[0].value;
	var mealChoiceFish = document.getElementsByClassName("mealChoiceFish")[0].value;
	var mealChoiceKids = document.getElementsByClassName("mealChoiceKids")[0].value;
	
	if ((mealChoiceBeef.checked==false) || (mealChoicePork == false) 
			|| (mealChoiceChicken) == false || (mealChoiceVeg == false) 
			|| (mealChoiceFish) == false || (mealChoiceKids == false))
	{
		document.getElementById("mealChoiceError").innerHTML = "<i class='fas fa-times'></i>  Please check atleast one";
		validMealChoice = false;
	}
	else{
		document.getElementById("mealChoiceError").innerHTML = "<span style='color:green'><i class='fas fa-check'></i></span>";
		validMealChoice = true;
	}
}*/