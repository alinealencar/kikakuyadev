/** VALIDATION **/

var validListTitle = false;
var validItemName = false;
var validListTitleSM = false;
var validListTitleE = false;
/** BIG SCREEN **/
// Validate list's title
function validateListTitle(){
	console.log(validListTitle);
	if (validListTitle){
		form.submit();
		form.reset();
	}
	else{
		var titleList = document.getElementsByClassName("titleList")[0].value;
		
		if (titleList == ""){
			document.getElementById("titleError").innerHTML = "<i class='fas fa-times'></i>  Please enter a list title";
			validListTitle = false;
		}
		else{
			document.getElementById("titleError").innerHTML = "";
			validListTitle = true;
		}
		return false;
	}
	return true;
}

function validateName(){
	var listTitle = document.getElementsByClassName("titleList")[0].value;
	
	if (listTitle == ""){
		document.getElementById("titleError").innerHTML = "<i class='fas fa-times'></i>  Please enter a list title";
		validListTitle = false;
	}
	else{
		document.getElementById("titleError").innerHTML = "";
		validListTitle = true;
	}		
}
/** SMALL SCREEN **/

function validateListTitleSM(){
	console.log(validListTitleSM);
	if (validListTitleSM){
		form.submit();
		form.reset();
	}
	else{
		var titleListSM = document.getElementsByClassName("titleListSM")[0].value;
		
		if (titleListSM == ""){
			document.getElementById("titleErrorSM").innerHTML = "<i class='fas fa-times'></i>  Please enter a list title";
			validListTitleSM = false;
		}
		else{
			document.getElementById("titleErrorSM").innerHTML = "";
			validListTitleSM = true;
		}
		return false;
	}
	return true;
}

function validateNameSM(){
	var listTitleSM = document.getElementsByClassName("titleListSM")[0].value;
	
	if (listTitleSM == ""){
		document.getElementById("titleErrorSM").innerHTML = "<i class='fas fa-times'></i>  Please enter a list title";
		validListTitleSM = false;
	}
	else{
		document.getElementById("titleErrorSM").innerHTML = "";
		validListTitleSM = true;
	}		
}
/** EDIT ON BIGSCREEN**/
function validateListTitleE(){
	console.log(validListTitleE);
	if (validListTitleE){
		form.submit();
		form.reset();
	}
	else{
		var titleListE = document.getElementsByClassName("titleListE")[0].value;
		
		if (titleListE == ""){
			document.getElementById("titleErrorE").innerHTML = "<i class='fas fa-times'></i>  Please enter a list title";
			validListTitleE = false;
		}
		else{
			document.getElementById("titleErrorE").innerHTML = "";
			validListTitleE = true;
		}
		return false;
	}
	return true;
}

function validateNameE(){
	var listTitleE = document.getElementsByClassName("titleListE")[0].value;
	
	if (listTitleE == ""){
		document.getElementById("titleErrorE").innerHTML = "<i class='fas fa-times'></i>  Please enter a list title";
		validListTitleE = false;
	}
	else{
		document.getElementById("titleErrorE").innerHTML = "";
		validListTitleE = true;
	}		
}

// Validate item name
function validateItemName(){
	console.log(validItemName);
	if (validItemName){
		form.submit();
		form.reset();
	}
	else{
		var itemName = document.getElementsByClassName("validItemName")[0].value;
		
		if (itemName == ""){
			document.getElementById("itemNameError").innerHTML = "<i class='fas fa-times'></i> Please enter item name";
			validItemName = false;
		}
		else{
			document.getElementById("itemNameError").innerHTML = "";
			validItemName = true;
		}
		return false;
	}
	return true;
}

function validateItem(){
	var itemName = document.getElementsByClassName("validItemName")[0].value;
	
	if (itemName == ""){
		document.getElementById("itemNameError").innerHTML = "<i class='fas fa-times'></i> Please enter item name";
		validItemName = false;
	}
	else{
		document.getElementById("itemNameError").innerHTML = "";
		validItemName = true;
	}
}
