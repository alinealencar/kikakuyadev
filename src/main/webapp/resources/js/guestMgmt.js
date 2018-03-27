/** DOCUMENT.READY **/
$(document).ready(function() {
	
});

/** Make rows in the guest list clickable **/
function addRowHandlers() {
	var table = document.getElementById("guests");
	var rows = table.getElementsByTagName("tr");
	for (i = 0; i < rows.length; i++) {
		var currentRow = table.rows[i];
		var createClickHandler = 
			function(row){
				return function() {
					var formNode = row.getElementsByClassName("showGuestForm");
					formNode[0].submit();
					//document.getElementById('showGuestSection').style.display = 'inline';
				}; 
			};
					
		currentRow.onclick = createClickHandler(currentRow);
		
	}
}
window.onload = addRowHandlers();

function addGuest(){
	document.getElementById('addGuestSection').style.display = 'inline-block';
	document.getElementById('showGuestSection').style.display = 'none';
	document.getElementById('editGuestSection').style.display = 'none';
}

function editGuest(){
	document.getElementById('addGuestSection').style.display = 'none';
	document.getElementById('showGuestSection').style.display = 'none';
	document.getElementById('editGuestSection').style.display = 'inline-block';
}

function closeAll(){
	document.getElementById('addGuestSection').style.display = 'none';
	document.getElementById('showGuestSection').style.display = 'none';
	document.getElementById('editGuestSection').style.display = 'none';
}


/******************************************
 * Sorting functions
 ******************************************/
function ascFirstName() {
	var table, rows, switching, i, x, y, shouldSwitch;
  	table = document.getElementById("guests");
  	switching = true;
  	/*Make a loop that will continue until no switching has been done:*/
  	while (switching) {
    	//start by saying: no switching is done:
    	switching = false;
   		rows = table.getElementsByTagName("TR");
    	/*Loop through all table rows (except the first, which contains table headers):*/
    	for (i = 1; i < (rows.length - 1); i++) {
      		//start by saying there should be no switching:
      		shouldSwitch = false;
      		/*Get the two elements you want to compare, one from current row and one from the next:*/
      		x = rows[i].getElementsByTagName("TD")[0];
      		y = rows[i + 1].getElementsByTagName("TD")[0];
      		//check if the two rows should switch place:
      		if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
        		//if so, mark as a switch and break the loop:
        		shouldSwitch= true;
        		break;
      		}
    	}
    	if (shouldSwitch) {
     		 /*If a switch has been marked, make the switch and mark that a switch has been done:*/
      		rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      		switching = true;
    	}
  	}
}


function descFirstName() {
	var table, rows, switching, i, x, y, shouldSwitch;
  	table = document.getElementById("guests");
  	switching = true;
  	/*Make a loop that will continue until no switching has been done:*/
  	while (switching) {
    	//start by saying: no switching is done:
    	switching = false;
   		rows = table.getElementsByTagName("TR");
    	/*Loop through all table rows (except the first, which contains table headers):*/
    	for (i = 1; i < (rows.length - 1); i++) {
      		//start by saying there should be no switching:
      		shouldSwitch = false;
      		/*Get the two elements you want to compare, one from current row and one from the next:*/
      		x = rows[i].getElementsByTagName("TD")[0];
      		y = rows[i + 1].getElementsByTagName("TD")[0];
      		//check if the two rows should switch place:
      		if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
        		//if so, mark as a switch and break the loop:
        		shouldSwitch= true;
        		break;
      		}
    	}
    	if (shouldSwitch) {
     		 /*If a switch has been marked, make the switch and mark that a switch has been done:*/
      		rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      		switching = true;
    	}
  	}
}


function ascLastName() {
	var table, rows, switching, i, x, y, shouldSwitch;
  	table = document.getElementById("guests");
  	switching = true;
  	/*Make a loop that will continue until no switching has been done:*/
  	while (switching) {
    	//start by saying: no switching is done:
    	switching = false;
   		rows = table.getElementsByTagName("TR");
    	/*Loop through all table rows (except the first, which contains table headers):*/
    	for (i = 1; i < (rows.length - 1); i++) {
      		//start by saying there should be no switching:
      		shouldSwitch = false;
      		/*Get the two elements you want to compare, one from current row and one from the next:*/
      		x = rows[i].getElementsByTagName("TD")[1];
      		y = rows[i + 1].getElementsByTagName("TD")[1];
      		//check if the two rows should switch place:
      		if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
        		//if so, mark as a switch and break the loop:
        		shouldSwitch= true;
        		break;
      		}
    	}
    	if (shouldSwitch) {
     		 /*If a switch has been marked, make the switch and mark that a switch has been done:*/
      		rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      		switching = true;
    	}
  	}
}

function descLastName() {
	var table, rows, switching, i, x, y, shouldSwitch;
  	table = document.getElementById("guests");
  	switching = true;
  	/*Make a loop that will continue until no switching has been done:*/
  	while (switching) {
    	//start by saying: no switching is done:
    	switching = false;
   		rows = table.getElementsByTagName("TR");
    	/*Loop through all table rows (except the first, which contains table headers):*/
    	for (i = 1; i < (rows.length - 1); i++) {
      		//start by saying there should be no switching:
      		shouldSwitch = false;
      		/*Get the two elements you want to compare, one from current row and one from the next:*/
      		x = rows[i].getElementsByTagName("TD")[1];
      		y = rows[i + 1].getElementsByTagName("TD")[1];
      		//check if the two rows should switch place:
      		if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
        		//if so, mark as a switch and break the loop:
        		shouldSwitch= true;
        		break;
      		}
    	}
    	if (shouldSwitch) {
     		 /*If a switch has been marked, make the switch and mark that a switch has been done:*/
      		rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      		switching = true;
    	}
  	}
}

function ascStatus() {
	var table, rows, switching, i, x, y, shouldSwitch;
  	table = document.getElementById("guests");
  	switching = true;
  	/*Make a loop that will continue until no switching has been done:*/
  	while (switching) {
    	//start by saying: no switching is done:
    	switching = false;
   		rows = table.getElementsByTagName("TR");
    	/*Loop through all table rows (except the first, which contains table headers):*/
    	for (i = 1; i < (rows.length - 1); i++) {
      		//start by saying there should be no switching:
      		shouldSwitch = false;
      		/*Get the two elements you want to compare, one from current row and one from the next:*/
      		x = rows[i].getElementsByTagName("TD")[3];
      		y = rows[i + 1].getElementsByTagName("TD")[3];
      		//check if the two rows should switch place:
      		if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
        		//if so, mark as a switch and break the loop:
        		shouldSwitch= true;
        		break;
      		}
    	}
    	if (shouldSwitch) {
     		 /*If a switch has been marked, make the switch and mark that a switch has been done:*/
      		rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      		switching = true;
    	}
  	}
}

function descStatus() {
	var table, rows, switching, i, x, y, shouldSwitch;
  	table = document.getElementById("guests");
  	switching = true;
  	/*Make a loop that will continue until no switching has been done:*/
  	while (switching) {
    	//start by saying: no switching is done:
    	switching = false;
   		rows = table.getElementsByTagName("TR");
    	/*Loop through all table rows (except the first, which contains table headers):*/
    	for (i = 1; i < (rows.length - 1); i++) {
      		//start by saying there should be no switching:
      		shouldSwitch = false;
      		/*Get the two elements you want to compare, one from current row and one from the next:*/
      		x = rows[i].getElementsByTagName("TD")[3];
      		y = rows[i + 1].getElementsByTagName("TD")[3];
      		//check if the two rows should switch place:
      		if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
        		//if so, mark as a switch and break the loop:
        		shouldSwitch= true;
        		break;
      		}
    	}
    	if (shouldSwitch) {
     		 /*If a switch has been marked, make the switch and mark that a switch has been done:*/
      		rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      		switching = true;
    	}
  	}
}

/******************************************
 * slide in form
 ******************************************/
//open side form
function openAddGuest() {
  document.getElementById("addGuestSection").style.width = "360px";
}

function openShowGuest() {
  document.getElementById("showGuestSection").style.width = "360px";
}

function openEditGuest(id) {
  document.getElementById("editGuestSection").style.width = "360px";
  document.getElementById("editGuestSection").style.display = "block";
  
	//Populate edit plus ones form
	$.post({
		url: "getPlusOnes",
		data: {guestId: id},
		success: function(response){
			var numberOfPlusOnesMax = response.guest.adultsMax + response.guest.kidsMax;
			var txtBxCount = 0;
			for(var i = 0; i < response.plusOnes.length; i++){
				txtBxCount++;
				var formItem = "<label>Name: </label>" +
				"<input name='" + response.plusOnes[i].fullName + "' value='" +
				response.plusOnes[i].fullName + "' class='form-control' style='margin-bottom:10px;'/>" +
				"<label>Meal Choice: </label>" +
				"<select name='" + response.plusOnes[i].mealChoice + "' class='form-control' style='margin-bottom:10px;'>";
				
				for(var m = 0; m < response.meals.length; m++){
					if(response.meals[m] === response.plusOnes[i].mealChoice)
						formItem += "<option selected>" + response.meals[m] + "</option>";
					else
						formItem += "<option>" + response.meals[m] + "</option>";
				}
				
				formItem += "</select>";
				
				$("#plusOnesDiv").append(formItem);
			}
			
			if(txtBxCount < numberOfPlusOnesMax){
				var txtBxLeft = numberOfPlusOnesMax - txtBxCount;
				for(var k = 0; k < txtBxLeft; k++){
					var formItem = "<label>Name: </label>" +
					"<input name='plusOneName' class='form-control' style='margin-bottom:10px;'/>" +
					"<label>Meal Choice: </label>" +
					"<select name='mealChoice' class='form-control' style='margin-bottom:10px;'>" +
					"<option value='' disabled='disabled' selected='true'>Meal Choice</option>"
						
					for(var m = 0; m < response.meals.length; m++){
						formItem += "<option>" + response.meals[m] + "</option>";
					}
					
					formItem += "</select>";
					
					$("#plusOnesDiv").append(formItem);
				}
			}
		}
	});
}

//close side form
function closeAddGuest() {
  document.getElementById("addGuestSection").style.width = "0";
}

function closeShowGuest() {
  document.getElementById("showGuestSection").style.width = "0";
}

function closeEditGuest() {
  document.getElementById("editGuestSection").style.display = "none";
}

/******************************************
 * bubbles
 ******************************************/
//show help bubbles
$(document).ready(function(){
	$('[data-toggle="tooltip"]').tooltip();   
});

/******************************************
 *clear form
 ******************************************/
//add guest clear form when it is submited
$(".showAddGuest").click(function() {
	$("input[type=text], textarea").val("");
	$("select").val("0");
});
