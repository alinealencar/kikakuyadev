/** VALIDATION **/

var validGuest = false;
var validKid = false;


function validateResponseForm(){
	console.log(validGuest);
	console.log(validGuest);
	if (validGuest || validKid){
		form.submit();
		form.reset();
	}
	else{
		return false;
	}
	return true;
}

function validatePlusOne(val){
	var g1, g2, g3, g4, k1, k2, k3, k4 = val.value;
	
	if (g1 == "" || g2 == "" || g3 == "" || g4 == "" || k1 == "" || k2 == "" || k3 == "" || k4 == ""){
		document.getElementById("plusOneError").innerHTML = "<i class='fas fa-times'></i>  Please enter name";
		validGuest = false;
	}
	else{
		document.getElementById("plusOneError").innerHTML = "";
		validGuest = true;
	}
}