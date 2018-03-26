/** Validation **/

var aTitle = false;
var aDate = false;
var aTime = false;
var aAddress = false;
var aColor = false;

//Validate title
function validateTitle(val){
	var title = val.value;
	if (title == "" || title == null){
		document.getElementById("titleError").innerHTML = "<span style='font-size: 10px; text-align:left;'><i class='fas fa-times'></i>  Please enter an appointment title";
		//$('#titleError').show();
		aTitle = false;
	}
	else{
		document.getElementById("titleError").innerHTML = "";
		aTitle = true;
	}
}

//Validate address
function validateAdd(val){
	var address = val.value;
	if (address == "" || address == null){
		document.getElementById("addressError").innerHTML = "<span style='font-size: 10px; text-align:left;'><i class='fas fa-times'></i>  Please enter the address";
		//$('#addressError').show();
		aAddress = false;
	}
	else{
		document.getElementById("addressError").innerHTML = "";
		aAddress = true;
	}
}

//Validate date
function validateDate(val){
	var date = val.value;
	var month = val.value;
	var year = val.value;
	
	if (date == "" || month == "" || year == "" || date == null || month == null || year == null){
		document.getElementById("dateError").innerHTML = "<span style='font-size: 10px; text-align:left;'><i class='fas fa-times'></i>  Please select date";
		//$('#dateError').show();
		aDate = false;
	}
	else{
		document.getElementById("dateError").innerHTML = "";
		aDate = true;
	}
}

//Validate time
function validateTime(val){
	var hour = val.value;
	var minute = val.value;
	var ampm = val.value;
	
	if (hour == "" || minute == "" || ampm == "" || hour == null || minute == null || ampm == null){
		document.getElementById("timeError").innerHTML = "<span style='font-size: 10px; text-align:left;'><i class='fas fa-times'></i>  Please select time";
		//$('#timeError').show();
		aTime = false;
	}
	else{
		document.getElementById("timeError").innerHTML = "";
		aTime = true;
	}
}

//Validate color

function validateColor(val){
	var color = val.value;
	
	if (!$("input:radio[name='color']:checked").val()){
		 document.getElementById("colorError").innerHTML = "<span style='font-size: 10px; text-align:left;'><i class='fas fa-times'></i>  Please select a color";
	}
	
	else{
		document.getElementById("colorError").innerHTML = "";
		aColor = true;
	}
}

