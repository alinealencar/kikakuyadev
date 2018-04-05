/** VALIDATION **/

var validReplyDue = false;

function validateRSVPForm(){
	if (validReplyDue){
		form.submit();
		form.reset();
	}
	else{
		document.getElementById("replyDueError").innerHTML = "<i class='fas fa-times'></i>  Please select valid date";
		return false;
	}
	return true;
}

/**Validate Reply Due**/
function validateReplyDue(){
	var today = new Date();
	var replyDue = new Date(document.getElementsByClassName("replyDue")[0].value);
	
	if (replyDue.value == ""){
		document.getElementById("replyDueError").innerHTML = "<i class='fas fa-times'></i>  Please select valid date";
		validReplyDue = false;
	}
	else if(replyDue < today){
		document.getElementById("replyDueError").innerHTML = "<i class='fas fa-times'></i>  Please select valid date";
		validReplyDue = false;
	}
	else{
		document.getElementById("replyDueError").innerHTML = "";
		validReplyDue = true;
	}
}

setTimeout(function() {
    $('.successAlert').fadeOut('fast');
    }, 3000);

setTimeout(function() {
    $('.errorAlert').fadeOut('fast');
    }, 3000);