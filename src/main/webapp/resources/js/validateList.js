/** VALIDATION **/

var validListTitle = false;
var validItemName = false;
var validListTitleSM = false;

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

var validTitle = false;
function validateNameE(val){
	//var listTitle = document.getElementsByClassName("titleList")[0].value;
	var listTitle = val.value;
	if (listTitle == ""){
		//document.getElementById("titleError").innerHTML = "<i class='fas fa-times'></i>  Please enter a list title";
		$(val).siblings('.titleErrorE').first().show();
		validTitle = false;
	}
	else{
		//document.getElementById("titleError").innerHTML = "";
		$(val).siblings('.titleErrorE').first().hide();
		validTitle = true;
	}		
}

/***** save after edit *****/
//submit edit all lists form (big)
$(document).ready(function(){
	$( "#btnSaveEditList" ).click(function() {
		if(validTitle){
			$('#formEditList').submit();
		}
	});
});

/** EDIT ON SMALL SCREEN**/

var validTitleSM = false;
function validateNameEditSM(val){
	//var listTitle = document.getElementsByClassName("titleList")[0].value;
	var listTitleSM = val.value;
	if (listTitleSM == ""){
		//document.getElementById("titleError").innerHTML = "<i class='fas fa-times'></i>  Please enter a list title";
		$(val).siblings('.titleErrorESM').first().show();
		validTitleSM = false;
	}
	else{
		//document.getElementById("titleError").innerHTML = "";
		$(val).siblings('.titleErrorESM').first().hide();
		validTitleSM = true;
	}		
}

/***** save after edit *****/
//submit edit all lists form (small)
$(document).ready(function(){
	$( "#btnSaveEditList-sm" ).click(function() {
		if(validTitleSM){
			$('#formEditList-sm').submit();
		}
	});
});


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

/** EDIT ITEM NAME**/

var validEditItem = false;
function validateEditItem(val){
	//var listTitle = document.getElementsByClassName("titleList")[0].value;
	var itemEdit = val.value;
	if (itemEdit == ""){
		//document.getElementById("titleError").innerHTML = "<i class='fas fa-times'></i>  Please enter a list title";
		$(val).siblings('.itemError-edit').first().show();
		validEditItem = false;
	}
	else{
		//document.getElementById("titleError").innerHTML = "";
		$(val).siblings('.itemError-edit').first().hide();
		validEditItem = true;
	}		
}

//submit edit items form 
$(document).ready(function(){
	$( "#btnSaveEditItem" ).click(function() {
		if (validEditItem){
			$('#formEditItem').submit();
		}
	});
});