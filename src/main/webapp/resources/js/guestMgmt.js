/** DOCUMENT.READY **/
$(document).ready(function() {
	$("#plusOnesSuccess").hide();
	$("#guestSuccess").hide();
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
	$("#plusOnesSuccess").hide();
	$("#guestSuccess").hide();
	
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
					response.plusOnes[i].fullName + "' class='form-control editPlusOneName' oninput='validateName()'/>" +
					"<div><span id='plusOneError' class='formError'></span></div>"+
					"<label>Meal Choice: </label>&nbsp;<a class='rsvpMealChoiceMsg' href='#' data-toggle='tooltip' data-placement='top' title='Keep in mind that you must send the RSVPs for this event before selecting a meal choice.'><span class='info'><i class='fas fa-question-circle'></i></span></a>" +
					"<select name='" + response.plusOnes[i].mealChoice + "' class='form-control editPlusOneMeal' style='margin-bottom:10px;'>" ;
					
					if (response.meals.length > 0){
						for(var m = 0; m < response.meals.length; m++){
							if(response.meals[m] === response.plusOnes[i].mealChoice)
								formItem += "<option selected>" + response.meals[m] + "</option>";
							else
								formItem += "<option>" + response.meals[m] + "</option>";
						}
					}
					else {
						$(".editPlusOneMeal").attr("disabled", true);
					}
					formItem += "</select><hr>";
					$("#plusOnesAdults").append(formItem);
					
				}
				else {
					txtBxCountKids++;
					var formItem = "<label>Name: &nbsp;&nbsp;&nbsp;" +
					"<button onclick='deletePlusOne(" + response.plusOnes[i].guestPlusOneId + ", " + id + ");' class='fabutton absent'><i class='far fa-trash-alt'></i></button></label>" +
					"<input type='hidden' class='editPlusOneId' value='" + response.plusOnes[i].guestPlusOneId +"'/>"+
					"<input name='" + response.plusOnes[i].fullName + "' value='" +
					response.plusOnes[i].fullName + "' class='form-control editPlusOneName' style='margin-bottom:10px;' oninput='validateName()'/>" +
					"<div><span id='plusOneError' class='formError'></span></div>"+
					"<label>Meal Choice: </label>&nbsp;<a class='rsvpMealChoiceMsg' href='#' data-toggle='tooltip' data-placement='top' title='Keep in mind that you must send the RSVPs for this event before selecting a meal choice.'><span class='info'><i class='fas fa-question-circle'></i></span></a>" +
					"<select name='" + response.plusOnes[i].mealChoice + "' class='form-control editPlusOneMeal' style='margin-bottom:10px;'>";
					
					if (response.meals.length > 0){
						for(var m = 0; m < response.meals.length; m++){
							if(response.meals[m] === response.plusOnes[i].mealChoice)
								formItem += "<option selected>" + response.meals[m] + "</option>";
							else
								formItem += "<option>" + response.meals[m] + "</option>";
						}
					}

					formItem += "</select><hr>";
					$("#plusOnesKids").append(formItem);
					
					if(response.meals.length <= 0)
						$(".editPlusOneMeal").attr("disabled", true);
				}
				
			}
			
			var adultsLeft = response.guest.adultsMax - txtBxCountAdults;
			var kidsLeft = response.guest.kidsMax - txtBxCountKids;
			if(adultsLeft > 0){

				for(var k = 0; k < adultsLeft; k++){
					var formItem = "<label>Name: </label>" +
					"<input name='plusOneName' class='form-control addPlusOneNameAdult' style='margin-bottom:10px;' oninput='validateName()'/>" +
					"<div><span id='plusOneError' class='formError'></span></div>"+
					"<label>Meal Choice: </label>&nbsp;<a class='rsvpMealChoiceMsg' href='#' data-toggle='tooltip' data-placement='top' title='Keep in mind that you must send the RSVPs for this event before selecting a meal choice.'><span class='info'><i class='fas fa-question-circle'></i></span></a>" +
					"<select name='mealChoice' class='form-control addPlusOneMealAdult' style='margin-bottom:10px;'>" +
					"<option value='' disabled='disabled' selected='true'>-- Meal Choice --</option>"
					
					if (response.meals.length > 0){
						for(var m = 0; m < response.meals.length; m++){
							formItem += "<option>" + response.meals[m] + "</option>";
						}
					}
					
					formItem += "</select><hr>";
					
					$("#plusOnesAdults").append(formItem);
					
					if(response.meals.length <= 0)
						$(".addPlusOneMealAdult").attr("disabled", true);
					
				}
			}
			
			if (kidsLeft > 0){
				for(var k = 0; k < kidsLeft; k++){
					var formItem = "<label>Name: </label>" +
					"<input name='plusOneName' class='form-control addPlusOneNameKid' style='margin-bottom:10px; oninput='validateName()'/>" +
					"<div><span id='plusOneError' class='formError'></span></div>"+
					"<label>Meal Choice: &nbsp;<a class='rsvpMealChoiceMsg' href='#' data-toggle='tooltip' data-placement='top' title='Keep in mind that you must send the RSVPs for this event before selecting a meal choice.'><span class='info'><i class='fas fa-question-circle'></i></span></a></label>" +
					"<select name='mealChoice' class='form-control addPlusOneMealKid' style='margin-bottom:10px;'>" +
					"<option value='' disabled='disabled' selected='true'>-- Meal Choice --</option>"
					
					if (response.meals.length > 0){
						for(var m = 0; m < response.meals.length; m++){
							formItem += "<option>" + response.meals[m] + "</option>";
						}
					}
					
					formItem += "</select><hr>";
					
					$("#plusOnesKids").append(formItem);
					
					if(response.meals.length <= 0)
						$(".addPlusOneMealKid").attr("disabled", true);
				}
			}
			
			//Populate adultsMax and kidsMax dynamically
			var adultsNow = $("#plusOnesAdults .editPlusOneName").length;
			var kidsNow = $("#plusOnesKids .editPlusOneName").length;
			$("#editKidsMax").empty();
			$("#editAdultsMax").empty();
			
			for(var i = kidsNow; i <= 4; i++){
				if(i === response.guest.kidsMax)
					$("#editKidsMax").append("<option value=" + i + " selected>"+i+"</option>");
				else
					$("#editKidsMax").append("<option value=" + i + ">"+i+"</option>");
			}
			
			for(var i = adultsNow; i <= 4; i++){
				if( i === response.guest.adultsMax)
					$("#editAdultsMax").append("<option value=" + i + " selected>"+i+"</option>");
				else
					$("#editAdultsMax").append("<option value=" + i + ">"+i+"</option>");
			}
		
			//Populate main guest's meal choice
			var formItem = "<option value='' disabled='disabled' selected='true'>-- Meal Choice --</option>"
			
				console.log(response.guest.mealChoice);
			if (response.meals.length > 0){
				for(var m = 0; m < response.meals.length; m++){
					//auto populate with the guests choice from the rsvp
					if(response.meals[m] === response.guest.mealChoice)
						formItem += "<option selected>" + response.meals[m] + "</option>";
					else
						formItem += "<option>" + response.meals[m] + "</option>";
				}
				
				//show help bubble for meal choice
				$(".rsvpMealChoiceMsg").hide();
			}
			
			$("#guestMealChoice").append(formItem);
			console.log("formItem");
			console.log("#guestMealChoice");
			
			if(response.meals.length <= 0)
				$("#guestMealChoice").attr("disabled", true);
			
		
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
	
	//show error - validation
	
	$('#plusOneError').show();
	$('#mealError').show();
	$.post({
		url:"editPlusOnes",
		data: {editName: editNameArr, editId: editIdArr, editMeal: editMealArr, addAdultName: addNameAdultArr, addAdultMeal: addMealAdultArr, addKidName: addNameKidArr, addKidMeal: addMealKidArr, guestId: id},
		success: function(response){
			openEditGuest(id);
			$("#plusOnesSuccess").html("Done!");
			$("#plusOnesSuccess").show();
			//validate
			//validatePlusOne()
			$( "#guestId"+response.guestId + " td:nth-child(3)" ).html("Adults: " + response.adultsWith + "&nbsp;&nbsp;&nbsp;Kids: " + response.kidsWith);

		}
	
	});

}

//Validate plus ones
$("#btnEditPlusOne").click(function () {
//function validatePlusOne(){
	/*var guest = $("#fullName").val();
	var meal = $("#mealChoice").val();
	
	if (guest == ""){
		document.getElementById("plusOneError").innerHTML = "<span style='font-size: 10px; text-align:left;'><i class='fas fa-times'></i>  Please enter name";
		 return false;
	}
	if (meal == ""){
		document.getElementById("mealError").innerHTML = "<span style='font-size: 10px; text-align:left;'><i class='fas fa-times'></i>  Please select a meal";
		 return false;
	}
	return true;*/
	var adults = document.getElementsByClassName("addPlusOneNameAdult");
	var kids = document.getElementsByClassName("addPlusOneNameKid");
	for(i=0;i<adults.length;i++){
		var adult = adults[i].value;
		if(!adult){
			//document.getElementById("itemError-sm").innerHTML = "<span style='font-size: 10px; text-align:left;'><i class='fas fa-times'></i>  Please enter an item";
			$('#plusOneError').show();
			return false;
		}
		else
			return true;
	}
	for(i=0;i<kids.length;i++){
		var kid = prices[i].value;
		if(!kid){
			//document.getElementById("priceError").innerHTML = "<span style='font-size: 10px; text-align:left;'><i class='fas fa-times'></i>  Please enter price";
			$('#plusOneError').show();
			return false;
		}
		else
			return true;
	}
});


/** DELETE PLUS ONES **/
function deletePlusOne(plusOneId, guestId){
	var deletePlusOne = confirm ("Are you sure you want to delete this guest?");
	
	if (deletePlusOne){
		$.post({
			url: "deletePlusOne",
			data: {plusOneId: plusOneId},
			success: function(response){
				//response is object of Guest type
				
				openEditGuest(guestId)
				
				//update the adultswith and kidswith in the table
				$( "#guestId"+response.guestId + " td:nth-child(3)" ).html("Adults: " + response.adultsWith + "&nbsp;&nbsp;&nbsp;Kids: " + response.kidsWith);
				}
		});
	}
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
  closeShowGuest();
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
