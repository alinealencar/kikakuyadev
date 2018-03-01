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
		document.getElementById("replyDueError").innerHTML = "<span style='color:green'><i class='fas fa-check'></i></span>";
		validReplyDue = true;
	}
}

/**Validate Meal Choice -- Check atleast one checbox || NOT SURE YET**/
function validateMealChoice(){
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
}
