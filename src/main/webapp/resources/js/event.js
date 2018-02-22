//flags to check if each value is valid
	var validEventName = false;
	var validLocation = false; 
	


	
function showList(){
	document.getElementById("showEventList").style.display = 'inline-block';
	document.getElementById("showAddForm").style.display = 'none';
	document.getElementById("editEvent").style.display = 'none';
}

function showForm(){
	document.getElementById("showEventList").style.display = 'none';
	document.getElementById("showAddForm").style.display = 'inline-block';
	document.getElementById("editEvent").style.display = 'none';
}

function editEvent(){
	document.getElementById("showEventList").style.display = 'none';
	document.getElementById("showAddForm").style.display = 'none';
	document.getElementById("editEvent").style.display = 'inline-block';
}
	