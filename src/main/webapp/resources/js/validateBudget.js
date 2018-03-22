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

/*function validateBudget(){
	console.log("VALIDATE SIGN UP FORM")
	console.log("category: " + validCat);
	console.log("vendor: " + validVen);
	console.log("item: " + validItem);
	console.log("price:" + validPrice);
	/*if (validCat && validVen && validItem && validPrice){
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
}*/

/***Validate item (small)***/
function validateItemSM(val){
	var item = val.value;
	if (item == "" || item == null){
		document.getElementById("itemError-sm").innerHTML = "<span style='font-size: 10px; text-align:left;'><i class='fas fa-times'></i>  Please enter an item";
		$('#itemError-sm').show();
		validItem = false;
	}
	else{
		document.getElementById("itemError-sm").innerHTML = "";
		validItem = true;
	}
}

/***Validate price (small)***/
function validatePriceSM(val){
	var price = val.value;
		if(isNaN(price)){
			document.getElementById("priceError-sm").innerHTML = "<span style='font-size: 10px; text-align:left;'><i class='fas fa-times'></i> Please enter numbers only.";
			$('#priceError-sm').show();
			validPrice = false;
		}
		else if(price == "" || price == null){
			document.getElementById("priceError-sm").innerHTML = "<span style='font-size: 10px; text-align:left;'><i class='fas fa-times'></i> Please enter price";
			$('#priceError-sm').show();
			validPrice = false;
		}
		else{
			document.getElementById("priceError-sm").innerHTML = "";
			validPrice = true;
		}
}

/***Validate item (big)***/
function validateItem(val){
	var item = val.value;
	if (item == "" || item == null){
		document.getElementById("itemError").innerHTML = "<span style='font-size: 10px; text-align:left;'><i class='fas fa-times'></i>  Please enter an item";
		$('#itemError').show();
		validItem = false;
	}
	else{
		document.getElementById("itemError").innerHTML = "";
		validItem = true;
	}
}

/***Validate price (big)***/
function validatePrice(val){
	var price = val.value;
		if(isNaN(price)){
			document.getElementById("priceError").innerHTML = "<span style='font-size: 10px; text-align:left;'><i class='fas fa-times'></i> Please enter numbers only.";
			$('#priceError').show();
			validPrice = false;
		}
		else if(price == "" || price == null){
			document.getElementById("priceError").innerHTML = "<span style='font-size: 10px; text-align:left;'><i class='fas fa-times'></i> Please enter price";
			$('#priceError').show();
			validPrice = false;
		}
		else{
			document.getElementById("priceError").innerHTML = "";
			validPrice = true;
		}
}

/*** Sticky form (big)***/
$(document).ready(function(){
	//show selected value
	var valueFromSS = sessionStorage.getItem("selectedCategory");
	$("#category-big option[value='" + valueFromSS + "']").prop("selected",true);
});

/***get selected category and store in SessionStorage (big)***/
$(document).ready(function(){
	$('#category-big').change(function(){
		//document.getElementById("categoryError").innerHTML = "";
		var selectedCategory = $('#category-big').val();
		sessionStorage.setItem("selectedCategory",selectedCategory);
	});
});

/*** Sticky form (small)***/
$(document).ready(function(){
	//show selected value
	var valueFromSS = sessionStorage.getItem("selectedCategory");
	$("#category-sm option[value='" + valueFromSS + "']").prop("selected",true);
});

/***get selected category and store in SessionStorage (small)***/
$(document).ready(function(){
	$('#category-sm').change(function(){
		//document.getElementById("categoryError").innerHTML = "";
		var selectedCategory = $('#category-sm').val();
		sessionStorage.setItem("selectedCategory",selectedCategory);
	});
});

/***If true, select vendor. If false, select first option (big)***/
$(document).ready(function(){
	var flag = sessionStorage.getItem("flag");
	if(!flag){
		$("#vendor-big option").prop("selected", false);
		$("#vendor-big option[value='']").prop("selected",true);
	}
});

/***If true, select vendor. If false, select first option (small)***/
$(document).ready(function(){
	var flag = sessionStorage.getItem("flag");
	if(!flag){
		$("#vendor-sm option").prop("selected", false);
		$("#vendor-sm option[value='']").prop("selected",true);
	}
});

/***Validate if a vendor is selected (big)***/
 $(document).ready(function(){
	$('#vendor-big').change(function(){
		var vendor = $('#vendor-big').val();
		if(vendor != ""){
			document.getElementById("vendorError").innerHTML = "";
		}
		else{
			document.getElementById("vendorError").innerHTML = "<i class='fas fa-times'></i>  Please select vendor";
		}
	});
 });
 
 /***Validate if a category is selected (big)***/
 $(document).ready(function(){
	$('#category-big').change(function(){
		var category = $('#category-big').val();
		if(category != ""){
			document.getElementById("categoryError").innerHTML = "";
		}
		else{
			document.getElementById("categoryError").innerHTML = "<i class='fas fa-times'></i>  Please select vendor";
		}
	});
 });
 
 /***Validate if a vendor is selected (small)***/
 $(document).ready(function(){
	$('#vendor-sm').change(function(){
		var vendor = $('#vendor-sm').val();
		if(vendor != ""){
			document.getElementById("vendorError-sm").innerHTML = "";
		}
		else{
			document.getElementById("vendorError-sm").innerHTML = "<i class='fas fa-times'></i>  Please select vendor";
		}
	});
 });
 
 /***Validate if a category is selected (big)***/
 $(document).ready(function(){
	$('#category-sm').change(function(){
		var category = $('#category-sm').val();
		if(category != ""){
			document.getElementById("categoryError-sm").innerHTML = "";
		}
		else{
			document.getElementById("categoryError-sm").innerHTML = "<i class='fas fa-times'></i>  Please select vendor";
		}
	});
 });
 
/***Clear SessionStorage on submit (big form)***/
$(document).ready(function(){
	$("#addBudget").click(function () {
		var valueFromSS = sessionStorage.getItem("selectedCategory");
		var vendor = document.getElementById("vendor-big").value;
		var category = document.getElementById("category-big").value;
		var items = document.getElementsByClassName("item-big");
		var prices = document.getElementsByClassName("price-big");
		for(i=0;i<items.length;i++){
			var item = items[i].value;
			if(!item){
				document.getElementById("itemError").innerHTML = "<span style='font-size: 10px; text-align:left;'><i class='fas fa-times'></i>  Please enter an item";
				$('#itemError').show();
				validItem = false;
			}
			else
				validItem = true;
		}
		for(i=0;i<prices.length;i++){
			var price = prices[i].value;
			if(!price){
				document.getElementById("priceError").innerHTML = "<span style='font-size: 10px; text-align:left;'><i class='fas fa-times'></i>  Please enter an item";
				$('#priceError').show();
				validPrice = false;
			}
			else
				validPrice = true;
		}
		if(valueFromSS && vendor && validItem && validPrice){
			$( "#formAddToBudget" ).submit();
			sessionStorage.clear();
			$(".vendor option").prop("selected", false);
			$(".vendor option[value='']").prop("selected",true);
		}
		if(!category){
			document.getElementById("categoryError").innerHTML = "<i class='fas fa-times'></i>  Please select category";
		}
		if(!vendor){
			document.getElementById("vendorError").innerHTML = "<i class='fas fa-times'></i>  Please select vendor";
		}
		if(!validItem){
			document.getElementById("itemError").innerHTML = "<span style='font-size: 10px; text-align:left;'><i class='fas fa-times'></i>  Please enter an item";
		}
		if(!validPrice){
			document.getElementById("priceError").innerHTML = "<span style='font-size: 10px; text-align:left;'><i class='fas fa-times'></i> Please enter price";
		}
	});
});
/***Clear SessionStorage on submit (small form)***/
$(document).ready(function(){
	$("#addBudget-sm").click(function () {
		var valueFromSS = sessionStorage.getItem("selectedCategory");
		var vendor = document.getElementById("vendor-sm").value;
		var category = document.getElementById("category-sm").value;
		var items = document.getElementsByClassName("item-sm");
		var prices = document.getElementsByClassName("price-sm");
		for(i=0;i<items.length;i++){
			var item = items[i].value;
			if(!item){
				document.getElementById("itemError-sm").innerHTML = "<span style='font-size: 10px; text-align:left;'><i class='fas fa-times'></i>  Please enter an item";
				$('#itemError-sm').show();
				validItem = false;
			}
			else
				validItem = true;
		}
		for(i=0;i<prices.length;i++){
			var price = prices[i].value;
			if(!price){
				document.getElementById("priceError").innerHTML = "<span style='font-size: 10px; text-align:left;'><i class='fas fa-times'></i>  Please enter an item";
				$('#priceError').show();
				validPrice = false;
			}
			else
				validPrice = true;
		}
		if(valueFromSS && vendor && validItem && validPrice){
			$( "#formAddToBudget-sm" ).submit();
			sessionStorage.clear();
			$(".vendor option").prop("selected", false);
			$(".vendor option[value='']").prop("selected",true);
		}
		if(!valueFromSS){
			document.getElementById("categoryError-sm").innerHTML = "<i class='fas fa-times'></i>  Please select category";
		}
		if(!vendor){
			document.getElementById("vendorError-sm").innerHTML = "<i class='fas fa-times'></i>  Please select vendor";
		}
		if(!validItem){
			document.getElementById("itemError-sm").innerHTML = "<span style='font-size: 10px; text-align:left;'><i class='fas fa-times'></i>  Please enter an item";
		}
		if(!validPrice){
			document.getElementById("priceError-sm").innerHTML = "<span style='font-size: 10px; text-align:left;'><i class='fas fa-times'></i> Please enter price";
		}
	});
});

/***Save flag to session storage***/
$(document).ready(function(){
	$('#btnEnterVendor').click(function(){
		sessionStorage.setItem("flag","true");
	});
});


/*function validateAddVendor(){
	console.log(validName);
	console.log(validAddress);
	console.log(validPhoneNo);
	if (validName){
		this.form.submit();
		this.form.reset();
	}
	else{
		document.getElementById("nameError").innerHTML = "<span style='font-size: 10px; text-align:left;'><i class='fas fa-times'></i> Please enter a valid name</span>";
	}
}*/

/***Validate enter vendor form (big)***/
$(document).ready(function(){
	$("#btnEnterVendor").click(function () {
		var name = $('#vendorName').val();
		if(!name){
			document.getElementById("nameError").innerHTML = "<span style='font-size: 10px; text-align:left;'><i class='fas fa-times'></i> Please enter name</span>";
		}
		else{
			$('#addBudgetVenForm').submit();
		}
	});
});

/***Validate vendor name (big)***/
function validateName(val){
	//var addName = document.getElementsByClassName("addName")[0].value;
	var name = val.value;
	if(name == ""){
		document.getElementById("nameError").innerHTML = "<span style='font-size: 10px; text-align:left;'><i class='fas fa-times'></i> Please enter name</span>";
		validName = false;
	}
	else if(!isNaN(name)){
		document.getElementById("nameError").innerHTML = "<span style='font-size: 10px;'><i class='fas fa-times'></i> Please enter a valid name</span>";
		validName = false;
	}
	else{
		document.getElementById("nameError").innerHTML = "";
		validName = true;
	}
}

/*function validateAddress(){
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
*/

/*function validateAddVendorSM(){
	//console.log(validNameB);
	//console.log(validAddressB);
	//console.log(validPhoneNoB);
	if (validNameSM){
		form.submit();
		form.reset();
	}
	else{
		return false;
	}
	return true;
}*/
/***Validate enter vendor form (small)***/
$(document).ready(function(){
	$("#btnEnterVendor-sm").click(function () {
		var name = $('#vendorName-sm').val();
		if(!name){
			document.getElementById("nameError-sm").innerHTML = "<span style='font-size: 10px; text-align:left;'><i class='fas fa-times'></i> Please enter name</span>";
		}
		else{
			$('#addBudgetVenForm-sm').submit();
		}
	});
});

/***Validate vendor name (small)***/
function validateNameSM(val){
	var name = val.value;
	
	if(name == ""){
		document.getElementById("nameError-sm").innerHTML = "<span style='font-size: 10px; text-align:left;'><i class='fas fa-times'></i> Please enter name</span>";
		validNameB = false;
	}
	else if(!isNaN(name)){
		document.getElementById("nameError-sm").innerHTML = "<span style='font-size: 10px;'><i class='fas fa-times'></i> Please enter name</span>";
		validNameB = false;
	}
	else{
		document.getElementById("nameError-sm").innerHTML = "";
		validNameB = true;
	}
}

/*
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
}*/