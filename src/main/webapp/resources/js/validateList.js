/** VALIDATION **/

var validListTitle = false;
var validItemName = false;

function validateListTitle(){
	console.log(validListTitle);
	if (validListTitle){
		form.submit();
		form.reset();
	}
	else{
		return false;
	}
	return true;
}


function validateName(){
	var listTitle = document.getElementsByClassName("listTitle")[0].value;
	
	if (listTitle == ""){
		document.getElementById("listError").innerHTML = "<i class='fas fa-times'></i>  Please enter a list title";
		validListTitle = false;
	}
	else{
		document.getElementById("listError").innerHTML = "";
		validListTitle = true;
	}
}
