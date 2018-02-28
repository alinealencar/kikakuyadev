// Show edit budget form
function openEditBudget() {
	$('#editBudget').show();
	$('#showBudget').hide();
}

function openShowBudget() {
	$('#editBudget').hide();
	$('#showBudget').show();
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


///for editable dropdown list
//$('select').editableSelect({
//	  warpClass: 'ui-select-wrap',
//	  editable: true
//});
//
//

//add new item and price
/*$(document).ready(function(){

    var counter = 2;
    $("#btnAddItemPrice").click(function () {

	var newItemTextBoxDiv = $(document.createElement('div'))
		.attr("id", 'itemTextBoxDiv' + counter).attr("class", 'col-6');	 
	var newPriceTextBoxDiv = $(document.createElement('div'))
		.attr("id", 'priceTextBoxDiv' + counter).attr("class", 'col-6');

	newItemTextBoxDiv.after().html('<input type="text" class="form-control" name="goodsList[' + counter + '].goodName" id="item' + counter + '" placeholder="Item" style="margin-bottom: 5px;">');
	newPriceTextBoxDiv.after().html('<input type="text" class="form-control" name="goodsList[' + counter + '].goodPrice" id="price' + counter + '" placeholder="Price" style="margin-bottom: 5px;">');

	newItemTextBoxDiv.appendTo("#itemTextBoxGroup");
	newPriceTextBoxDiv.appendTo("#itemTextBoxGroup");


	counter++;
     });
/*
     $("#removeButton").click(function () {
	if(counter==1){
          alert("No more textbox to remove");
          return false;
       }

	counter--;

        $("#TextBoxDiv" + counter).remove();

     });

     $("#getButtonValue").click(function () {

	var msg = '';
	for(i=1; i<counter; i++){
   	  msg += "\n Textbox #" + i + " : " + $('#textbox' + i).val();
	}
    	  alert(msg);
     });
 */
//});
