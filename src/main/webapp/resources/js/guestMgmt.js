///Make rows in the guest list clickable
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