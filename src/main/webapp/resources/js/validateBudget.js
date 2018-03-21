/** VALIDATION **/

/*var validCategory = false;
var validVendor = false;
var validItem = false;
var validPrice = false;
*/

/** Validation for adding budget on big screen **/
var validCat = false;
var validVen = false;
var validItem = false;
var validPrice = false;

function validateBudget(){
	console.log("VALIDATE SIGN UP FORM")
	console.log("category: " + validCat);
	console.log("vendor: " + validVen);
	console.log("item: " + validItem);
	console.log("price:" + validPrice);
	if (validCat && validVen && validItem && validPrice){
		form.submit();
		form.reset();
	}
	else{
		if (validCat == "--- Select Category ---"){
			document.getElementById("categoryError").innerHTML = "<i class='fas fa-times'></i>  Please select category";
			validCat = false;
		}
		if (validVen == ""){
			document.getElementById("vendorError").innerHTML = "<i class='fas fa-times'></i>  Please select vendor";
			validVen = false;
		}
		if (validItem == ""){
			document.getElementById("itemError").innerHTML = "<span style='font-size: 10px; text-align:left;'><i class='fas fa-times'></i>  Please enter an item";
			validItem = false;
		}
		if(validPrice == ""){
			document.getElementById("priceError").innerHTML = "<span style='font-size: 10px; text-align:left;'><i class='fas fa-times'></i> Please enter price";
			validPrice = false;
		}
		return false;
	}
	return true;
}

function validateCategory(){	
	var chooseCat = document.getElementsByClassName("chooseCat")[0].value;
	
	if (chooseCat == "--- Select Category ---"){
		document.getElementById("categoryError").innerHTML = "<i class='fas fa-times'></i>  Please select category";
		validCat = false;
	}
	else{
		document.getElementById("categoryError").innerHTML = "";
		validCat = true;
	}
}

function validateVendor(){
	var chooseVen = document.getElementsByClassName("chooseVen")[0].value;
	
	if (chooseVen == ""){
		document.getElementById("vendorError").innerHTML = "<i class='fas fa-times'></i>  Please select vendor";
		validVen = false;
	}
	else{
		document.getElementById("vendorError").innerHTML = "";
		validVen = true;
	}
}

function validateItem(){
	var enterItem = document.getElementsByClassName("enterItem")[0].value;
	
	if (enterItem == ""){
		document.getElementById("itemError").innerHTML = "<span style='font-size: 10px; text-align:left;'><i class='fas fa-times'></i>  Please enter an item";
		validItem = false;
	}
	else{
		document.getElementById("itemError").innerHTML = "";
		validItem = true;
	}
}
function validatePrice(){
	var price = document.getElementsByClassName("price")[0].value;
	
	if(isNaN(price)){
		document.getElementById("priceError").innerHTML = "<span style='font-size: 10px; text-align:left;'><i class='fas fa-times'></i> Please enter numbers only.";
		validPrice = false;
	}
	else if(price == ""){
		document.getElementById("priceError").innerHTML = "<span style='font-size: 10px; text-align:left;'><i class='fas fa-times'></i> Please enter price";
		validPrice = false;
	}
	else{
		document.getElementById("priceError").innerHTML = "";
		validPrice = true;
	}
}

/** VALIDATION FOR ADD VENDOR ON SMALL SCREEN **/
function validateAddVendor(){
	console.log(validName);
	console.log(validAddress);
	console.log(validPhoneNo);
	if (validName && validAddress && validPhoneNo){
		form.submit();
		form.reset();
	}
	else{
		return false;
	}
	return true;
}

function validateName(){
	var addName = document.getElementsByClassName("addName")[0].value;
	
	if(addName == ""){
		document.getElementById("nameError").innerHTML = "<span style='font-size: 10px; text-align:left;'><i class='fas fa-times'></i> Please enter name</span>";
		validName = false;
	}
	else if(!isNaN(addName)){
		document.getElementById("nameError").innerHTML = "<span style='font-size: 10px;'><i class='fas fa-times'></i> Please enter name</span>";
		validName = false;
	}
	else{
		document.getElementById("nameError").innerHTML = "";
		validName = true;
	}
}

function validateAddress(){
	var addAddress = document.getElementsByClassName("addAddress")[0].value;
	if (addAddress == ""){
		document.getElementById("addressError").innerHTML = "<span style='font-size: 10px;'><i class='fas fa-times'></i> Please enter address</span>";
		validAddress = false;
	}
	else{
		document.getElementById("addressError").innerHTML = "";
		validAddress = true;
	}
}

function validatePhoneNo(){
	var addPhoneNo = document.getElementsByClassName("addPhoneNo")[0].value;
	if(isNaN(addPhoneNo)){
		document.getElementById("phoneNoError").innerHTML = "<span style='font-size: 10px;'><i class='fas fa-times'></i> Please enter valid phone number!</span>";
		validPhoneNo = false;
	}
	else{
		document.getElementById("phoneNoError").innerHTML = "";
		validPhoneNo = true;
	}
}


/** VALIDATION FOR ADD VENDOR ON SMALL SCREEN **/
function validateAddVendorB(){
	console.log(validNameB);
	console.log(validAddressB);
	console.log(validPhoneNoB);
	if (validNameB && validAddressB && validPhoneNoB){
		form.submit();
		form.reset();
	}
	else{
		return false;
	}
	return true;
}

function validateNameB(){
	var addNameB = document.getElementsByClassName("addNameB")[0].value;
	
	if(addNameB == ""){
		document.getElementById("nameErrorB").innerHTML = "<span style='font-size: 10px; text-align:left;'><i class='fas fa-times'></i> Please enter name</span>";
		validNameB = false;
	}
	else if(!isNaN(addNameB)){
		document.getElementById("nameErrorB").innerHTML = "<span style='font-size: 10px;'><i class='fas fa-times'></i> Please enter name</span>";
		validNameB = false;
	}
	else{
		document.getElementById("nameErrorB").innerHTML = "";
		validNameB = true;
	}
}

function validateAddressB(){
	var addAddressB = document.getElementsByClassName("addAddressB")[0].value;
	if (addAddressB == ""){
		document.getElementById("addressErrorB").innerHTML = "<span style='font-size: 10px;'><i class='fas fa-times'></i> Please enter address</span>";
		validAddressB = false;
	}
	else{
		document.getElementById("addressErrorB").innerHTML = "";
		validAddressB = true;
	}
}

function validatePhoneNoB(){
	var addPhoneNoB = document.getElementsByClassName("addPhoneNoB")[0].value;
	if(isNaN(addPhoneNoB)){
		document.getElementById("phoneNoErrorB").innerHTML = "<span style='font-size: 10px;'><i class='fas fa-times'></i> Please enter valid phone number!</span>";
		validPhoneNoB = false;
	}
	else{
		document.getElementById("phoneNoErrorB").innerHTML = "";
		validPhoneNoB = true;
	}
}