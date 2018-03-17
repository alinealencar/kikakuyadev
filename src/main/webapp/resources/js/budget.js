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
function openVendorsInfo() {
  document.getElementById("smBudget").style.width = "360px";
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

