/** VALIDATION **/

var validCategory = false;
var validVendor = false;
var validItem = false;
var validPrice = false;

var validName = false;
var validAddress = false;
var phoneNo = false;

function validateBudget(){
	if (validCategory && validVendor && validItem && validPrice){
		form.submit();
		form.reset();
	}
	else{
		return false;
	}
	return true;
}

function validateAddVendor(){
	if (validName && validAddress && phoneNo && website){
		form.submit();
		form.reset();
	}
	else{
		return false;
	}
	return true;
}

function validateCategory(){	
	var category = document.getElementsByClassName("category")[0].value;
	
	if (category == "--- Select Category ---"){
		document.getElementById("categoryError").innerHTML = "<i class='fas fa-times'></i>  Please select category";
		validCategory = false;
	}
	else{
		document.getElementById("categoryError").innerHTML = "";
		validCategory = true;
	}
}

function validateVendor(){
	var vendor = document.getElementsByClassName("vendor")[0].value;
	
	if (vendor === ""){
		document.getElementById("vendorError").innerHTML = "<i class='fas fa-times'></i>  Please select vendor";
		validVendor = false;
	}
	else{
		document.getElementById("vendorError").innerHTML = "";
		validVendor = true;
	}
}

function validateItem(){
	var item = document.getElementsByClassName("item")[0].value;
	
	if (item == ""){
		document.getElementById("itemError").style.borderColor = "red";
		//.innerHTML = "<span style='font-size: 10px; text-align:left;'><i class='fas fa-times'></i>  Please enter an item";
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

function validateName(){
	var name = document.getElementsByClassName("name")[0].value;
	
	if(name == ""){
		document.getElementById("nameError").innerHTML = "<span style='font-size: 10px; text-align:left;'><i class='fas fa-times'></i> Please enter name</span>";
		validName = false;
	}
	else if(!isNaN(name)){
		document.getElementById("nameError").innerHTML = "<span style='font-size: 10px;'><i class='fas fa-times'></i> Please enter name</span>";
		validName = false;
	}
	else{
		document.getElementById("nameError").innerHTML = "";
		validName = true;
	}
}

function validateAddress(){
	var address = document.getElementsByClassName("address")[0].value;
	if (address == ""){
		document.getElementById("addressError").innerHTML = "<span style='font-size: 10px;'><i class='fas fa-times'></i> Please enter address</span>";
		validAddress = false;
	}
	else{
		document.getElementById("addressError").innerHTML = "";
		validAddress = true;
	}
}

function validatePhoneNo(){
	var phoneNo = document.getElementsByClassName("phoneNo")[0].value;
	if(isNaN(phoneNo)){
		document.getElementById("phoneNoError").innerHTML = "<span style='font-size: 10px;'><i class='fas fa-times'></i> Please enter valid phone number!</span>";
		validPhoneNo = false;
	}
	else{
		document.getElementById("phoneNoError").innerHTML = "";
		validPhoneNo = true;
	}
}