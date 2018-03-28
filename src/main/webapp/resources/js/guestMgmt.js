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
			$("#plusOnesAdults").empty();
			$("#plusOnesKids").empty();
			
			var numberOfPlusOnesMax = response.guest.adultsMax + response.guest.kidsMax;
			var txtBxCountAdults = 0;
			var txtBxCountKids = 0;
			
			for(var i = 0; i < response.plusOnes.length; i++){
				if(response.plusOnes[i].category === "Adult") {
					txtBxCountAdults++;
					var formItem = "<label>Name: &nbsp;&nbsp;&nbsp;" +
							"<button onclick='deletePlusOne(" + response.plusOnes[i].guestPlusOneId + ", " + id + ");' class='fabutton absent'><i class='far fa-trash-alt'></i></button></label>" +
					"<input type='hidden' class='editPlusOneId' value='" + response.plusOnes[i].guestPlusOneId +"'/>"+
					"<input name='" + response.plusOnes[i].fullName + "' value='" +
					response.plusOnes[i].fullName + "' class='form-control editPlusOneName' style='margin-bottom:10px;'/>" +
					"<label>Meal Choice: </label>" +
					"<select name='" + response.plusOnes[i].mealChoice + "' class='form-control editPlusOneMeal' style='margin-bottom:10px;'>";
					
					for(var m = 0; m < response.meals.length; m++){
						if(response.meals[m] === response.plusOnes[i].mealChoice)
							formItem += "<option selected>" + response.meals[m] + "</option>";
						else
							formItem += "<option>" + response.meals[m] + "</option>";
					}
					
					formItem += "</select>";
					
					$("#plusOnesAdults").append(formItem);
				}
				else {
					txtBxCountKids++;
					var formItem = "<label>Name: &nbsp;&nbsp;&nbsp;" +
					"<button onclick='deletePlusOne(" + response.plusOnes[i].guestPlusOneId + ", " + id + ");' class='fabutton absent'><i class='far fa-trash-alt'></i></button></label>" +
					"<input name='" + response.plusOnes[i].fullName + "' value='" +
					response.plusOnes[i].fullName + "' class='form-control editPlusOneName' style='margin-bottom:10px;'/>" +
					"<label>Meal Choice: </label>" +
					"<select name='" + response.plusOnes[i].mealChoice + "' class='form-control editPlusOneMeal' style='margin-bottom:10px;'>";
					
					for(var m = 0; m < response.meals.length; m++){
						if(response.meals[m] === response.plusOnes[i].mealChoice)
							formItem += "<option selected>" + response.meals[m] + "</option>";
						else
							formItem += "<option>" + response.meals[m] + "</option>";
					}
					
					formItem += "</select>";
					
					$("#plusOnesKids").append(formItem);
				}
				
			}
			
			var adultsLeft = response.guest.adultsMax - txtBxCountAdults;
			var kidsLeft = response.guest.kidsMax - txtBxCountKids;
			if(adultsLeft > 0){

				for(var k = 0; k < adultsLeft; k++){
					var formItem = "<label>Name: </label>" +
					"<input name='plusOneName' class='form-control addPlusOneNameAdult' style='margin-bottom:10px;'/>" +
					"<label>Meal Choice: </label>" +
					"<select name='mealChoice' class='form-control addPlusOneMealAdult' style='margin-bottom:10px;'>" +
					"<option value='' disabled='disabled' selected='true'>-- Meal Choice --</option>"
						
					for(var m = 0; m < response.meals.length; m++){
						formItem += "<option>" + response.meals[m] + "</option>";
					}
					
					formItem += "</select>";
					
					$("#plusOnesAdults").append(formItem);
				}
			}
			
			if (kidsLeft > 0){
				for(var k = 0; k < kidsLeft; k++){
					var formItem = "<label>Name: </label>" +
					"<input name='plusOneName' class='form-control addPlusOneNameKid' style='margin-bottom:10px;'/>" +
					"<label>Meal Choice: </label>" +
					"<select name='mealChoice' class='form-control addPlusOneMealKid' style='margin-bottom:10px;'>" +
					"<option value='' disabled='disabled' selected='true'>-- Meal Choice --</option>"
						
					for(var m = 0; m < response.meals.length; m++){
						formItem += "<option>" + response.meals[m] + "</option>";
					}
					
					formItem += "</select>";
					
					$("#plusOnesKids").append(formItem);
				}
			}
		}
	});
}

/** EDIT PLUS ONES **/
function editPlusOnes(id){
	//Push data into the arrays
	var editNameNode = $(".editPlusOneName");
	var editNameArr = [""];
	for(var i = 0; i < editNameNode.length; i++)
		if($(editNameNode[i]).val() != false)
			editNameArr.push($(editNameNode[i]).val());
	
	var editMealNode = $(".editPlusOneMeal");
	var editMealArr = [""];
	for(var i = 0; i < editMealNode.length; i++)
		if($(editMealNode[i]).val() != false)
		editMealArr.push($(editMealNode[i]).val());
	
	var editIdNode = $(".editPlusOneId");
	var editIdArr = [""];
	for(var i = 0; i < editIdNode.length; i++)
		editIdArr.push($(editIdNode[i]).val());
	
	var addNameAdultNode = $(".addPlusOneNameAdult");
	var addNameAdultArr = [""];
	for(var i = 0; i < addNameAdultNode.length; i++)
		if($(addNameAdultNode[i]).val() != false)
			addNameAdultArr.push($(addNameAdultNode[i]).val());
	
	var addMealAdultNode = $(".addPlusOneMealAdult");
	var addMealAdultArr = [""];
	for(var i = 0; i < addMealAdultNode.length; i++)
		if($(addMealAdultNode[i]).val() != false)
		addMealAdultArr.push($(addMealAdultNode[i]).val());
	
	var addNameKidNode = $(".addPlusOneNameKid");
	var addNameKidArr = [""];
	for(var i = 0; i < addNameKidNode.length; i++)
		if($(addNameKidNode[i]).val() != false)
		addNameKidArr.push($(addNameKidNode[i]).val());
	
	var addMealKidNode = $(".addPlusOneMealKid");
	var addMealKidArr = [""];
	for(var i = 0; i < addMealKidNode.length; i++)
		if($(addMealKidNode[i]).val() != false)
		addMealKidArr.push($(addMealKidNode[i]).val());
	
	$.post({
		url:"editPlusOnes",
		data: {editName: editNameArr, editId: editIdArr, editMeal: editMealArr, addAdultName: addNameAdultArr, addAdultMeal: addMealAdultArr, addKidName: addNameKidArr, addKidMeal: addMealKidArr, guestId: id},
		success: function(response){
			console.log(response);
		}
	
	});

}

/** DELETE PLUS ONES **/
function deletePlusOne(plusOneId, guestId){
	$.post({
		url: "deletePlusOne",
		data: {plusOneId: plusOneId},
		success: function(response){
			openEditGuest(guestId)
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
