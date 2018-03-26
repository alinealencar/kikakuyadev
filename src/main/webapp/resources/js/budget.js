// Show edit budget form
function openEditBudget() {
	$('#editBudget').show();
	$('#showBudget').hide();
}

function openShowBudget() {
	$('#editBudget').hide();
	$('#showBudget').show();
}

function openAddVendor() {
	$('#addVendor').show();
	$('#vendorsInfo').hide();
}

// Delete operations
function deleteGood(vendorId, goodId) {
	$('#vendorId').val(vendorId);
	$('#goodId').val(goodId);
	
	$("#budgetForm").attr("action", "deleteGood");
}

function deleteVendor(vendorId) {
	$('#vendorId').val(vendorId);
	
	$("#budgetForm").attr("action", "deleteVendor");
}

function deleteCategory(category) {
	$('#category').val(category);
	
	$("#budgetForm").attr("action", "deleteCategory");
}
//for small screen************************************
//open add budget form slide
function openAddBudgetForm() {
  document.getElementById("smBudgetAddForm").style.width = "360px";
}
//open vendors detail slide
function openVendorsInfo(id) {
  document.getElementById("smBudget").style.width = "360px";
  //ajax request
  $.post({
      url: "showVendor",
      data: {vendorId: id},
      success: function(response) {
     	 $("#selectedVendorName").html(response.name);
     	 $("#selectedVendorPhone").html(response.phoneNo);
     	 $("#selectedVendorAddress").html(response.address);
     	 $("#selectedVendorWebsite").attr("href", response.website)
     	 $("#vendorsInfoSm").show();
      }
  });
  
  
}
//close add budget form slide
function closeAddBudgetForm() {
  document.getElementById("smBudgetAddForm").style.width = "0px";
}
//close vendors detail slide
function closeVendorsInfo() {
  document.getElementById("smBudget").style.width = "0px";
}

// Calculate totals and subtotals
// global variable
var globalTotal = +0;

function calculateSubtotal(category){
	var subtotal = +0;
	$("." + category).each(function() {
	    subtotal += +$(this)[0].innerHTML;
	});
	
	//update total
	globalTotal += +subtotal;
	
	return subtotal;
}

function calculateSubtotalLive(budget, catEdit){
	var subtotal = +0;

	$(".catEdit" + catEdit).each(function() {
	    subtotal += +$(this)[0].value;
	});

	$("#subtotal" + catEdit).html(subtotal);
	
	//update total
	calculateTotalEdit(budget);
	
	return subtotal;
}

function calculateTotal(){
	return globalTotal;
}

function calculateTotalEdit(budget){
	var total = +0;
	var $items = $(".subtotalEdit");
	
	if ($items.length > 1){
		for(var i = 0; i < $items.length - 1; i++){
			$(".subtotalEdit").each(function() {
				  total += +$(this)[i].innerHTML;
			});
		}
	}

	else {
		$(".subtotalEdit").each(function() {
			  total += +$(this)[0].innerHTML;
		});
	}
	
	$('#totalBudgetEdit').html(total);
	
	calculateAmountRemainingLive(budget, total);
}

function calculateAmountRemaining(budget, total) {
	return budget - total;
}

function calculateAmountRemainingLive(budget, total) {
	var amountRemaining = budget - total;

	$('#amountRemainingEdit').html(amountRemaining);
}


/***Hide add budget and show enter vendor form (big)***/
$(document).ready(function(){
	$('#btnAddVendor-big').click(function(){
		$('#formAddToBudget').hide();
		$('#enterVendorBig').show();
	});
});
/***Hide add budget and show enter vendor form (small)***/
$(document).ready(function(){
	$('#btnAddVendor-sm').click(function(){
		$('#formAddToBudget-sm').hide();
		$('#enterVendor-sm').show();
	});
});
/***Show add budget and hide enter vendor form (big)***/
$(document).ready(function(){
	$('#btnCancelAddVendor').click(function(){
		$('#formAddToBudget').show();
		$('#nameError').hide();
		$('#enterVendor').hide();
	});
});
/***Show add budget and hide enter vendor form (small)***/
$(document).ready(function(){
	$('#btnCancelAddVendor-sm').click(function(){
		$('#formAddToBudget-sm').show();
		$('#nameError-sm').hide();
		$('#enterVendor-sm').hide();
	});
});
/***Amount Remaining color decoration ***/
$(document).ready(function(){
	if((calculateAmountRemaining('${event.totalBudget}', calculateTotal())) < 0){
		$('#amountRemaining').css("color", "#D90368");
		$('#amountRemainingEdit').css("color", "#D90368");
	}
});
/***Show item and price textboxes(big)***/
$(document).ready(function(){
	var counter = 1;
	$("#btnAddItemPrice").click(function () {
		$('#txtItem').append('<input type="text" class="form-control item-big" id="item' + counter + '" placeholder="Item" oninput="validateItem(this)" style="margin-bottom: 5px;" name="goodsList['+ counter + '].goodName">');
		$('#txtPrice').append('<input type="text" class="form-control price-big" id="price' + counter + '" placeholder="Price" oninput="validatePrice(this)" style="margin-bottom: 5px;" name="goodsList['+ counter + '].goodPrice">');
		counter++;
	});
});
/***Remove item and price textboxes(big)***/
$(document).ready(function(){
	$('#btnRemoveItemPrice').click(function(){
		if($('#txtItem').children().length > 1){
			$('#txtItem :last-child').remove();
			$('#itemError').hide();
		}
		if($('#txtPrice').children().length > 1){
			$('#txtPrice :last-child').remove();
			$('#priceError').hide();
		}	
	});
});
/***Show item and price textboxes(small)***/
$(document).ready(function(){
	var counter = 1;
	$("#btnAddItemPrice-sm").click(function () {
		$('#txtItem-sm').append('<input type="text" class="form-control item-sm" id="item' + counter + '" placeholder="Item" oninput="validateItemSM(this)" style="margin-bottom: 5px;" name="goodsList['+ counter + '].goodName">');
		$('#txtPrice-sm').append('<input type="text" class="form-control price-sm" id="price' + counter + '" placeholder="Price" oninput="validatePriceSM(this)" style="margin-bottom: 5px;" name="goodsList['+ counter + '].goodPrice">');
		counter++;
	});
});
/***Remove item and price textboxes(small)***/
$(document).ready(function(){
	$('#btnRemoveItemPrice-sm').click(function(){
		if($('#txtItem-sm').children().length > 1){
			$('#txtItem-sm :last-child').remove();
			$('#itemError-sm').hide();
		}
		if($('#txtPrice-sm').children().length > 1){
			$('#txtPrice-sm :last-child').remove();
			$('#priceError-sm').hide();
		}
	});
});

/***Clear SessionStorage***/

$('#btnCalendar').click(function(){
	sessionStorage.clear();
});

$('#btnGuest').click(function(){
	sessionStorage.clear();
});

$('#btnList').click(function(){
	sessionStorage.clear();
});

$('#btnSearch').click(function(){
	sessionStorage.clear();
});

$('a').click(function(){
	sessionStorage.clear();
});

$('#logout').click(function(){
	sessionStorage.clear();
});


