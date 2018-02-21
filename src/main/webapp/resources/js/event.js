function showList() {
	var list = document.getElementById("showEventList");
	var addFrom = document.getElementById("showAddForm");
	var editForm = document.getElementById("editEvents");
	if (list.style.display === "none") {
		list.style.display = "block";
	    addFrom.style.display = "none";
	    editFrom.style.display = "none";
	}
}

function showForm(){
	var list = document.getElementById("showEventList");
	var addFrom = document.getElementById("showAddForm");
	if (addFrom.style.display === "none"){
		addFrom.style.display = "block";
		list.style.display = "none";
	}
}

function editEvent(){
	var list = document.getElementById("showEventList");
	var editForm = document.getElementById("editEvents");
	if (editForm.style.display === "none"){
		editForm.style.display = "block";
		list.style.display = "none";
	}
}