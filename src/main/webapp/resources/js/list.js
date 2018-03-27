/*******************************
 * all lists
 *******************************/


/***** show/hide edit all lists *****/
//when click edit button in all lists, hide show and show edit
function openEditAllLists(){
	$('#editAllLists').show();
	$('#showAllLists').hide();
	$('#itemsDiv').foggy({blurRadius: 3,          // In pixels.
						opacity: 0.8,           // Falls back to a filter for IE.
						cssFilterSupport: true  // Use "-webkit-filter" where available.
						});
	$("#itemsDiv :input").attr("disabled", true);
	$("ul#itemList li").hover(function(){
        $(this).css("background-color", "#F1E9DA");
        });

}

//when click x button in all lists, hide edit and show show
function closeEditAllLists(){
	$('#editAllLists').hide();
	$('#showAllLists').show();
	$('#itemsDiv').foggy(false);
	$("#itemsDiv :input").attr("disabled", false);
}

/***** delete button *****/
//delete list (big)
function deleteList(listId){
	var result = confirm("Are you sure you want to delete this list?");
	if (result){
		$('#listIdHidden').val(listId);
		
		$("#formEditList").attr("action", "deleteList");
	}
}

//delete list (small)
function deleteListSM(listId){
	var result = confirm("Are you sure you want to delete this list?");
	if (result){
		$('#listIdHidden-sm').val(listId);
		
		$("#formEditList-sm").attr("action", "deleteList");
	}
}

//delete item
function deleteItem(itemId){
	$('#itemIdHidden').val(itemId);
		
	$("#formEditItem").attr("action", "deleteItem");
}

//submit edit all lists form (small)
$(document).ready(function(){
	$( "#btnSaveEditList-sm" ).click(function() {
		$('#formEditList-sm').submit();
	});
});

//submit edit items form 
$(document).ready(function(){
	$( "#btnSaveEditItem" ).click(function() {
		$('#formEditItem').submit();
	});
});

/***** all lists list small screen *****/
//open side list
function openAllLists() {
  document.getElementById("showAllLists-sm").style.width = "360px";
}
function openEditAllListSm() {
	  document.getElementById("editAllLists-sm").style.width = "360px";
	  document.getElementById("editAllLists-sm").style.display = "block";
	}
//close side list
function closeAllLists() {
	  document.getElementById("showAllLists-sm").style.width = "0";
	}
function closeEditAllListsSm() {
	  document.getElementById("editAllLists-sm").style.display = "none";
	}
/***** all lists list decoration *****/
/*
//Create a "close" button and append it to each list item
var list = document.getElementsByTagName("UL")[1];
var myNodelist = list.getElementsByTagName("LI");
var i;
for (i = 0; i < myNodelist.length; i++) {
var span = document.createElement("SPAN");
var txt = document.createTextNode("\u00D7");
span.className = "close";
span.appendChild(txt);
myNodelist[i].appendChild(span);
}

//Click on a close button to hide the current list item
var close = document.getElementsByClassName("close");
var i;
for (i = 0; i < close.length; i++) {
close[i].onclick = function() {
 var div = this.parentElement;
 div.style.display = "none";
}
}

/*
//Add a "checked" symbol when clicking on a list item
var list = document.querySelector('UL#showAllListBody');
list.addEventListener('click', function(ev) {
if (ev.target.tagName === 'LI') {
 ev.target.classList.toggle('checked');
 //document.getElementById("formUpdateItemStatus").submit();
}
}, false);

/*
//Create a new list item when clicking on the "Add" button
function newElement() {
document.getElementById("formAddItem").submit();
var li = document.createElement("li");
var inputValue = document.getElementById("itemInput").value;
var t = document.createTextNode(inputValue);
li.appendChild(t);
if (inputValue === '') {
 //alert("You must write something!");
} else {
 document.getElementById("itemList").appendChild(li);
}
document.getElementById("itemInput").value = "";

var span = document.createElement("SPAN");
var txt = document.createTextNode("\u00D7");
span.className = "close";
span.appendChild(txt);
li.appendChild(span);

for (i = 0; i < close.length; i++) {
 close[i].onclick = function() {
   var div = this.parentElement;
   div.style.display = "none";
 }
}
}
*/


/*******************************
 * item lists
 *******************************/
/***** show/hide edit item list *****/
//when click edit button in item list, hide show and show edit
function openEditItemList(){
	$('#editItemList').show();
	$('#itemsDiv').hide();
	$('#allListsDiv').foggy({blurRadius: 3,          // In pixels.
		opacity: 0.8,           // Falls back to a filter for IE.
		cssFilterSupport: true  // Use "-webkit-filter" where available.
		});
	$("#allListsDiv :input").attr("disabled", true);
	$('button#btnSelectList').prop('disabled', true);
	$('button#btnSelectList').css('color', '#2E294E');
	$("ul#showAllListBody li").hover(function(){
	$(this).css("background-color", "#F1E9DA");
	});
}

//when click edit button in item list, hide edit and show show
function closeEditItemList(){
	$('#editItemList').hide();
	$('#itemsDiv').show();
	$('#allListsDiv').foggy(false);
	$("#allListsDiv :input").attr("disabled", false);
	$('#allListsDiv :input[type="submit"]').prop('disabled', false);
}
/***** item list list decoration *****/
/*
// Create a "close" button and append it to each list item
var list = document.getElementsByTagName("UL")[3];
var myNodelist = list.getElementsByTagName("LI");
var i;
for (i = 0; i < myNodelist.length; i++) {
  var span = document.createElement("SPAN");
  var txt = document.createTextNode("\u00D7");
  span.className = "close";
  span.appendChild(txt);
  myNodelist[i].appendChild(span);
}

// Click on a close button to hide the current list item
var close = document.getElementsByClassName("close");
var i;
for (i = 0; i < close.length; i++) {
  close[i].onclick = function() {
    var div = this.parentElement;
    div.style.display = "none";
  }
}
/*
// Add a "checked" symbol when clicking on a list item
var list = document.querySelector('UL#itemList');
list.addEventListener('click', function(ev) {
  if (ev.target.tagName === 'LI') {
    ev.target.classList.toggle('checked');
    //document.getElementById("formUpdateItemStatus").submit();
  }
}, false);

// Create a new list item when clicking on the "Add" button
function newElement() {
  document.getElementById("formAddItem").submit();
  var li = document.createElement("li");
  var inputValue = document.getElementById("itemInput").value;
  var t = document.createTextNode(inputValue);
  li.appendChild(t);
  if (inputValue === '') {
    //alert("You must write something!");
  } else {
    document.getElementById("itemList").appendChild(li);
  }
  document.getElementById("itemInput").value = "";

  var span = document.createElement("SPAN");
  var txt = document.createTextNode("\u00D7");
  span.className = "close";
  span.appendChild(txt);
  li.appendChild(span);

  for (i = 0; i < close.length; i++) {
    close[i].onclick = function() {
      var div = this.parentElement;
      div.style.display = "none";
    }
  }
}*/

/*$("#itemStatusChk").click(function (event){
	$.ajax({
		type: "POST",
	     url: "updateItemStatus",
	     data: { itemId: $('#itemId').html()} // parameters
	})
	.done(function(response) {
	
	});
});*/


