/** VALIDATION **/

/** Validation for adding budget on big screen **/
var validCat = false;
var validVen = false;
var validItem = false;
var validPrice = false;

/***Validate item (small)***/
function validateItemSM(val){
	var item = val.value;
	if (item == "" || item == null){
		document.getElementById("itemError-sm").innerHTML = "<span style='font-size: 10px; text-align:left;'><i class='fas fa-times'></i>  Please enter item";
		$('#itemError-sm').show();
		validItem = false;
	}
	else if(!isNaN(item)){
		document.getElementById("itemError-sm").innerHTML = "<span style='font-size: 10px;'><i class='fas fa-times'></i> Please enter the right item</span>";
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
		else if(price == "" || price == null || price <= 0){
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
	else if(!isNaN(item)){
		document.getElementById("itemError").innerHTML = "<span style='font-size: 10px;'><i class='fas fa-times'></i> Please enter an item</span>";
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
		else if(price == "" || price == null || price <= 0){
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
			if(!price || price <= 0){
				document.getElementById("priceError").innerHTML = "<span style='font-size: 10px; text-align:left;'><i class='fas fa-times'></i>  Please enter price";
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
/***Validate and clear SessionStorage on submit (small form)***/
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
			if(!price || price <= 0){
				document.getElementById("priceError").innerHTML = "<span style='font-size: 10px; text-align:left;'><i class='fas fa-times'></i>  Please enter price";
				$('#priceError').show();
				validPrice = false;
			}
			else
				validPrice = true;
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
		if(valueFromSS && vendor && validItem && validPrice){
			$( "#formAddToBudget-sm" ).submit();
			sessionStorage.clear();
			$(".vendor option").prop("selected", false);
			$(".vendor option[value='']").prop("selected",true);
		}
	});
});

/***Save flag to session storage***/
$(document).ready(function(){
	$('#btnEnterVendor').click(function(){
		sessionStorage.setItem("flag","true");
	});
});

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

var validEditGood = true;
var validEditPrice = true;
var validEditTotalBudget = true;
var validEnterTotalBudget = true;

$(document).ready(function(){
	$("#btnSaveEditBudget").click(function () {
		if (validEditGood && validEditPrice && validEditTotalBudget){
			$("#budgetForm").submit();
		}
		else{
			$('#editBudgetError').show();
		}
	});
});

/***Validate good in edit form***/
function validateEditGood(val){
	var good = val.value;
	if (good == "" || good == null){
		$(val).siblings('.goodError').first().show();
		validEditGood = false;
	}
	else if(!isNaN(good)){
		$(val).siblings('.goodError').first().show();
		validEditGood = false;
	}
	else{
		$(val).siblings('.goodError').first().hide();
		$('#editBudgetError').hide();
		validEditGood = true;
	}
}

/***Validate price in edit form***/
function validateEditPrice(val){
	var price = val.value;
	if (price == "" || price <= 0){
		$(val).siblings('.priceError').first().show();
		validEditPrice = false;
	}
	else{
		$(val).siblings('.priceError').first().hide();
		$('#editBudgetError').hide();
		validEditPrice = true;
	}
}

/***Validate total budget in edit form***/
function validateEditTotalBudget(val){
	var budget = val.value;
	if (budget == "" || budget <= 0 || budget > 1000000000){
		$('#totalBudgetError').show();
		validEditTotalBudget = false;
	}
	else{
		$('#totalBudgetError').hide();
		validEditTotalBudget = true;
	}
}

/***Validate total budget***/
function validateEnterTotalBudget(val){
	var budget = val.value;
	if (budget == "" || budget <= 0 || budget > 1000000000){
		$('#enterTotalBudgetError').show();
		validEnterTotalBudget = false;
	}
	else{
		$('#enterTotalBudgetError').hide();
		validEnterTotalBudget = true;
	}
}

$(document).ready(function(){
	$("#btnEnterTotalBudget").click(function () {
		if (validEnterTotalBudget){
			$("#eventForm").submit();
		}
		else{
			$('#enterTotalBudgetError').show();
		}
	})
});
