/*******************************
 * all lists
 *******************************/


/***** show/hide edit all lists *****/
//when click edit button in all lists, hide show and show edit
function openEditAllLists(){
	$('#editAllLists').show();
	$('#showAllLists').hide();
}

//when click x button in all lists, hide edit and show show
function closeEditAllLists(){
	$('#editAllLists').hide();
	$('#showAllLists').show();
}


/***** all lists list decoration *****/

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
}

//when click edit button in item list, hide edit and show show
function closeEditItemList(){
	$('#editItemList').hide();
	$('#itemsDiv').show();
}
/***** item list list decoration *****/

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





