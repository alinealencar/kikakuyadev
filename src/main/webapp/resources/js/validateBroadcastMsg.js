/** VALIDATION **/

var validTitle = false;
var validMessage = false;

function validateBroadcastMsg(){
	if (validTitle && validMessage){
		form.submit();
		form.reset();
	}
	else{
		var title = document.getElementsByClassName("title")[0].value;
		if (title == ""){
			document.getElementById("titleError").innerHTML = "<i class='fas fa-times'></i> Please enter a subject of the message";
			validTitle = false;
		}
		else{
			document.getElementById("titleError").innerHTML = "";
			validTitle = true;
		}
		var message = document.getElementsByClassName("message")[0].value;
		if (message == ""){
			document.getElementById("messageError").innerHTML = "<i class='fas fa-times'></i> Please enter a message";
			validMessage = false;
		}
		else{
			document.getElementById("messageError").innerHTML = "";
			validMessage = true;
		}
		
		return false;
	}
	return true;
}

/**Validate subject of the message**/

function validateSubject(){
	var title = document.getElementsByClassName("title")[0].value;
	if (title == ""){
		document.getElementById("titleError").innerHTML = "<i class='fas fa-times'></i> Please enter a subject of the message";
		validTitle = false;
	}
	else{
		document.getElementById("titleError").innerHTML = "";
		validTitle = true;
	}
}

/**Validate message**/

function validateMessage(){
	var message = document.getElementsByClassName("message")[0].value;
	if (message == ""){
		document.getElementById("messageError").innerHTML = "<i class='fas fa-times'></i> Please enter a message";
		validMessage = false;
	}
	else{
		document.getElementById("messageError").innerHTML = "";
		validMessage = true;
	}
}