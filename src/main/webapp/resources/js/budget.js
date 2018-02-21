//for editable dropdown list
$('select').editableSelect({
	  warpClass: 'ui-select-wrap',
	  editable: true
});


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
// });
