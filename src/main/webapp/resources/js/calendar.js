/** Day dropdown **/
function daysInMonth(month, year) {
  return new Date(year, month, 0).getDate();
}

$('#year, #month').change(function() {
  if ($('#year').val().length > 0 && $('#month').val().length > 0) {
    var daysInSelectedMonth = daysInMonth($('#month').val(), $('#year').val());

    for (var i = 1; i <= 31; i++) {
    	if(i > daysInSelectedMonth)
    		$("#day option[value='" + i + "']").remove();
    	else if($("#day option:contains('" + i + "')").length == 0)
    		$('#day').append($("<option></option>").attr("value", i).text(i));
    }

  } else {
    $('#day').prop('disabled', true);
  }

});

/** ADD AND EDIT APPOINTMENT **/

function addEditAppt(action){
        $.post({
             url: action,
             data:$("#appt").serialize(),
             success: function(response) {
            	 
            	 validateForm()
            	 $("#todaysAppts").show();
            	 
            	 //Show appt after update
                 if(action === "editAppt") {
                	 var apptId = $("#apptId").val();
                	 showAppt(apptId);
                	 $("#todaysAppts").hide();
                 }
                 
                 //Feedback messages
         		showFeedbackMessages(response);	
            	 
            	 //Change the month and year to show the calendar with the appointment recently added
            	 $("#curYear").html($("#year").val());
            	 $("#curMonth").html(getMonthName($("#month").val() - 1));
            	 
            	//Reload calendar
            	 calendarNav("loadMonth");
            	 
            	 //Reload today's appts
            	 getTodaysAppts();
            	 
            	 
            	 //closeAppt();

             }
         });
}

/** SHOW APPOINTMENT **/

function showAppt(id){
	$("#addAppt").hide();
	$("#showDay").hide();
	
	//Send AJAX request with the id of the selected appointment
	$.ajax({
		type: "POST",
		url: "showAppt",
		data: {apptId: id}
	}).done(function(response){
		$("#apptColor").css('background-color', response.color);
		$("#apptTitle").html(response.title);

		
		//console.log("month is: " + getMonthInt(response.month));
		
		//Format date with the 0 for days and months with one digit only
		var date = "";
		
		if((response.day).length < 2)
			date += "0";
		
		date += response.day + "/"; 
		
		if(getMonthInt(response.month) < 10)
			date += "0";
		
		date += getMonthInt((response.month).substring(0,3)) + "/" + response.year;
		
		$("#apptDate").html(date);
		
		//Format hour if it doesn't have 2 digits
		var time = "";
		if(response.hour < 10)
			time += "0";
		
		time += response.hour + ":";
		
		if(response.minute < 10)
			time += "0";
		
		time += response.minute + " " + response.ampm.toUpperCase();
		
		$("#apptTime").html(time);
		$("#apptLocation").html(response.location);
		if(response.notes === "") {
			$("#notesLabel").hide();
			$("#apptNotes").hide();
		}
		else{
			$("#apptNotes").show();
			$("#apptNotes").html(response.notes);
			$("#notesLabel").show();
		}
	});
	
	//Set the apptId as the id of the element that shows the appt
	$(".editAppt").attr("id", id);
	
	//Show appt 
	$("#showAppt").show();
	
	$("#todaysAppts").hide();
}

/** EDIT APPOINTMENT FORM **/

function openEditAppt(id){
	$("#showAppt").hide();
	$("#btnAddAppt").hide();
	$(".successAlert").hide();
	$(".errorAlert").hide();
	$("#todaysAppts").hide();
	$("#titleError").hide();
	$("#addressError").hide();
	$("#dateError").hide();
	$("#timeError").hide();
	$("#colorError").hide();
	$("#showDay").hide();
	
	//Send AJAX request with the id of the selected appointment
	$.ajax({
		type: "POST",
		url: "showAppt",
		data: {apptId: id}
	}).done(function(response){
		 validateForm()
		$("#apptId").val(response.apptId);
		$("#title").val(response.title);
		$("#day").val(response.day);
		$("#month").val(getMonthInt((response.month).substring(0,3)));
		$("#year").val(response.year);
		$("#hour").val(response.hour);
		$("#minute").val(response.minute);
		$("#ampm").val((response.ampm).toUpperCase());
		$("#location").val(response.location);
		$("input[name='color']").removeAttr('checked');
		$("input[name='color'][value='" + response.color + "']").prop('checked', true);
		$("#color").val(response.color);
		$("#notes").val(response.notes);
		if(validateForm()){
			$("#titleError").show();
			$("#addressError").show();
			$("#dateError").show();
			$("#timeError").show();
			$("#colorError").show();
			$("#showDay").show();
		}
		else{
			$("#titleError").hide();
			$("#addressError").hide();
			$("#dateError").hide();
			$("#timeError").hide();
			$("#colorError").hide();
			$("#showDay").hide();
		}
	});
	
	
	$("#addAppt").show();
	$("#btnSaveAppt").show();
	
}

/** DELETE APPOINTMENT **/

function deleteAppt(id){
	var result = confirm("Are you sure you want to delete this appointment?");
	if (result){
	$.post({
		url: "deleteAppt",
		data: {apptId: id}
	}).done(function(response){
		showFeedbackMessages(response);
	});
	//Reload calendar
	calendarNav("loadMonth");
	$("#todaysAppts").show();
	$("#showDay").hide();
	}
	
	$("#showAppt").hide();
	
	//Reload calendar
	calendarNav("loadMonth");
	getTodaysAppts();
	$("#todaysAppts").show();
	$("#showDay").hide();
}

/** DOCUMENT.READY **/

$(document).ready(function(){
	//Show today's month and year in the calendar
	$("#curYear").html(new Date().getFullYear());
	$("#curMonth").html(getMonthName(new Date().getMonth()));
	
	calendarNav("loadMonth");
	
	//Load date selection dropdown
	for(var i = 1; i <= 31; i++)
		$('<option>').val(i).text(i).appendTo('#day');
	
	//Show today's appointments on the right side
	$("#todaysDate").html(getTodaysDate());
	getTodaysAppts();
	
	//Show help bubbles
	$('[data-toggle="tooltip"]').tooltip();  
	
	//populate year dropdown
	var curYear = new Date().getFullYear();
	for(var i = 0; i < 5; i++){
		$("#year").append($("<option></option>").attr("value", curYear).text(curYear));
		curYear++;
	}
});

/** GET TODAYS APPTS **/
function getTodaysAppts(){
	$("#todaysApptList").empty();
	$.post({
		url: "todaysAppts",
		success: function(response) {
			for(var i = 0; i < response.length; i++){
				console.log(response.title);
				$("#todaysApptList").append("<div class='appt' style='background-color: " + response[i].color + "' " +
						"onclick='showAppt(" + response[i].apptId + ")'>" + response[i].title + "</div>")
			}
        }
	});
}

/** CALENDAR NAVIGATION**/ 

function calendarNav(actionName){
	//Send AJAX request to navigate the calendar and show the appointments
		$.ajax({
			type: "POST",
		     url: "calendarNav",
		     data: { month: $('#curMonth').html(), year: $('#curYear').html(), action: actionName} // parameters
		})
		.done(function(response) {
	    	 $("#curMonth").html(response.name);
	    	 $("#curYear").html(response.year);
	    	 
	    	 var apptDict = {};
	    	 var curKey = "";
	    	 
	    	 //construct associative array (dictionary) with appointments for the month
		     for (var j=0; j < response.appointments.length; j++) {
		    	 curKey = response.appointments[j].day + response.appointments[j].month + response.appointments[j].year;
		    	 if(apptDict[curKey] === undefined)
		    		 apptDict[curKey] = [];
		    	 apptDict[curKey].push(response.appointments[j]);
		     } 
	    	 
	    	 //clear current table body
	    	 $("#calendar").find('tbody').empty();
	    	 
	    	 var curDate = response.firstDay; //Weekday the month starts
	    	 var numOfDays = response.numOfDays;
	    	 var curWeekDay = 1; //Weekday. Start printing cells on sunday
	    	 var weekNum = 1;
	    	 var startPrintingDays = false;
	    	 var monthDay = 1;
	    	 
	    	 //Add row for the first week
	    	 $("#calendar").find('tbody')
	    	    .append($('<tr id=week'+weekNum+'>'));
	    	 
	    	while(monthDay <= numOfDays){
	    		
	    		if(curDate === curWeekDay)
	    			startPrintingDays = true;
	    		
	    		if(!startPrintingDays) //Print empty days
	    			$("#calendar").find('#week' + weekNum).append($('<td><div class="calendarDay">')
	    	            .append(""));
	    		else {
	    			$("#calendar").find('#week' + weekNum).append($('<td>')
	    					.append("<div class='calendarDay'><span id=" + monthDay + response.name + response.year +">" + monthDay + "</span>"));
	    				    			if(apptDict[monthDay+response.name+response.year] != undefined){

	    				var apptsInTheMonth = apptDict[monthDay+response.name+$('#curYear').html()];

	    				for(var k = 0; k < apptsInTheMonth.length; k++){
	    					if($("#"+ monthDay + response.name + apptsInTheMonth[k].year).children().length <= 2){
	    						if((apptsInTheMonth[k].title).length > 10){
	    							$('#' + monthDay + response.name + apptsInTheMonth[k].year).append("<a href='#sectionAddAppt' class='sm-scrollable'><div id="
	    									+ apptsInTheMonth[k].apptId + " class='appt' "
	    									+ "style='background-color: " + apptsInTheMonth[k].color + "' " 
	    									+ "onclick='showAppt(" + apptsInTheMonth[k].apptId + ")'>" 
	    									+ (apptsInTheMonth[k].title).substring(0,11) + "...</div></a>");
		    						$('#' + monthDay + response.name + apptsInTheMonth[k].year).append("<a href='#container' class='bg-scrollable'><div id="
	    									+ apptsInTheMonth[k].apptId + " class='appt' "
	    									+ "style='background-color: " + apptsInTheMonth[k].color + "' " 
	    									+ "onclick='showAppt(" + apptsInTheMonth[k].apptId + ")'>" 
	    									+ (apptsInTheMonth[k].title).substring(0,11) + "...</div></a>");
	    						}
	    						else {
	    							$('#' + monthDay + response.name + apptsInTheMonth[k].year).append("<a href='#sectionAddAppt' class='sm-scrollable'><div id="
	    									+ apptsInTheMonth[k].apptId + " class='appt' "
	    									+ "style='background-color: " + apptsInTheMonth[k].color + "' " 
	    									+ "onclick='showAppt(" + apptsInTheMonth[k].apptId + ")'>" 
	    									+ apptsInTheMonth[k].title + "</div></a>");
	    							$('#' + monthDay + response.name + apptsInTheMonth[k].year).append("<a href='#container' class='bg-scrollable'><div id="
	    									+ apptsInTheMonth[k].apptId + " class='appt' "
	    									+ "style='background-color: " + apptsInTheMonth[k].color + "' " 
	    									+ "onclick='showAppt(" + apptsInTheMonth[k].apptId + ")'>" 
	    									+ apptsInTheMonth[k].title + "</div></a>");
	    						}
	    					}
	    					else{
	    						$('#' + monthDay + response.name + apptsInTheMonth[k].year).append(
	    								"<a href='#sectionShowAppt' class='sm-scrollable'><span id='moreAppts' onclick='showThisDaysAppts(" + monthDay + "," + getMonthInt((response.name).substring(0,3)) + "," + apptsInTheMonth[k].year + ")'><u>more...</u></span></a>");
	    						$('#' + monthDay + response.name + apptsInTheMonth[k].year).append(
	    								"<a href='#container' class='bg-scrollable'><span id='moreAppts' onclick='showThisDaysAppts(" + monthDay + "," + getMonthInt((response.name).substring(0,3)) + "," + apptsInTheMonth[k].year + ")'><u>more...</u></span></a>");
	    						break;
	    					}
	    				}
	    				
	    			}
	    			monthDay++;
	    			
	    		}
	    		
		    	if(curWeekDay === 7){
		    		curWeekDay = 1;
		    		weekNum++;
		    		$("#calendar").find('tbody')
		    	    .append($('<tr id=week'+weekNum+'>'));
		    	}
		    	else
		    		curWeekDay++;
		    }
	    	
	    	//Add events happening this month
	    	if(response.events.length > 0){
	    		for(var i = 0; i < response.events.length; i++){
	    			//STYLE EVENT IN THE SPAN BELOW
	    			$("#" + convertFromDateToIdFormat(response.events[i].eventDate)).append("<br><span>" + response.events[i].eventName + "</span>");
	    		}
	    	}
	    	
	    	$("#loading").hide();
	    	$("#showCalendar").show();
	    	
		});
}

/** SHOW APPTS FOR DAYS WITH MORE THAN 3 APPTS **/
function showThisDaysAppts(dayInput, monthInput, yearInput) {
	$("#selectedDate").empty();
	$("#selectedDateApptList").empty();
	$.post({
		url: "showApptsByDay",
		data: {day: dayInput, month: monthInput, year: yearInput}
	}).done(function(response){
		var date = "";
		if(dayInput < 10)
			date += "0";
		date += dayInput + "/";
		if(monthInput < 10)
			date += "0";
		date += monthInput + "/";
		date += yearInput;
		
		$("#selectedDate").html(date);
		
		for(var i = 0; i < response.length; i++){
			$("#selectedDateApptList").append("<div class='appt' style='background-color: " + response[i].color + "' " +
					"onclick='showAppt(" + response[i].apptId + ")'>" + response[i].title + "</div>")
		}
		
		//hide todays appts
		closeAppt();
		$("#todaysAppts").hide();
		$("#showDay").show();
	});
}

function getMonthInt(monthStr){
	var months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
	return months.indexOf(monthStr) + 1;
}

function getMonthName(monthInt){
	var months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
	return months[monthInt];
}

function convertFromDateToIdFormat(date){
	var dateSplit = date.split("-");
	var day = dateSplit[2].split(" ")[0];
	var month = getMonthName(dateSplit[1] - 1);
	var year = dateSplit[0];
	
	return day+month+year;
}

/** HIDE AND SHOW **/

function closeAppt(){
	$("#showAppt").hide();
	$("#addAppt").hide();
	$("#todaysAppts").show();
	$("#titleError").hide();
	$("#addressError").hide();
	$("#dateError").hide();
	$("#timeError").hide();
	$("#colorError").hide();
	$("#showDay").hide();
}

function openAddAppt(){
	$("#appt")[0].reset();
	$("#addAppt").show();
	$("#btnSaveAppt").hide();
	$("#todaysAppts").hide();
	$("#showAppt").hide();
	$("#btnAddAppt").show();
	$("#showDay").hide();
}

function showFeedbackMessages(response){
	//Feedback messages
	 if(response.indexOf("Error") == -1){
		 $(".successAlert").html(response);
		 $(".successAlert").show();
		 $(".errorAlert").hide();
		 $("#addAppt").hide();
		 
		 //show alert for 5 seconds and fade out
		 setTimeout(function() {
			 $(".successAlert").fadeOut();
		 }, 5000);
	 }
	 /*else {
		 $(".errorAlert").html(response);
		 $(".errorAlert").show();
		 $(".successAlert").hide();
		 $("#addAppt").show();
		 
		 //show alert for 5 seconds and fade out
		 setTimeout(function() {
			 $(".errorAlert").fadeOut();
		 }, 5000);
	 }	*/
}

function getTodaysDate() {
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!

	var yyyy = today.getFullYear();
	if(dd<10){
	    dd='0'+dd;
	} 
	if(mm<10){
	    mm='0'+mm;
	} 
	var todayStr = dd+'/'+mm+'/'+yyyy;
	
	return todayStr;
}


//scroll down to form 
$(document).ready(function(){
	  // Add smooth scrolling to all links
	  $('a.scrollable, div.calendarDay a.scrollable').on('click', function(event) {

	    // Make sure this.hash has a value before overriding default behavior
	    if (this.hash !== "") {
	      // Prevent default anchor click behavior
	      event.preventDefault();

	      // Store hash
	      var hash = this.hash;

	      // Using jQuery's animate() method to add smooth page scroll
	      // The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
	      $('html, body').animate({
	        scrollTop: $(hash).offset().top
	      }, 1000, function(){
	   
	        // Add hash (#) to URL when done scrolling (default click behavior)
	        window.location.hash = hash;
	      });
	    } // End if
	  });
	});	


$(document).ready(function(){
	$("#btnSaveAppt").click(function () {
		if(validateForm()){
			addEditAppt('editAppt')
		}
		else{
			$(".errorAlert").html('Please fill in the missing field/s');
			$(".errorAlert").show();
		}
	});
});
function validateForm(){
	var title = $("#title").val();
	var address = $("#location").val();
	var day = $("#day").val();
	var month = $("#month").val();
	var year = $("#year").val();
	var hour = $("#hour").val();
	var minute = $("#minute").val();
	var ampm = $("#ampm").val();
	
	if(title == ""){
		 document.getElementById("titleError").innerHTML = "<span style='font-size: 10px; text-align:left;'><i class='fas fa-times'></i>  Please enter an appointment title";
		 return false;
	}
	
	if (address == ""){
		 document.getElementById("addressError").innerHTML = "<span style='font-size: 10px; text-align:left;'><i class='fas fa-times'></i>  Please enter the address";
		 return false;
	}
	
	if (!$("input:radio[name='color']:checked").val()){
		 document.getElementById("colorError").innerHTML = "<span style='font-size: 10px; text-align:left;'><i class='fas fa-times'></i>  Please select a color";
		 return false;
	}
	
	if (day == "" || month == "" || year == "" || day == null || month == null || year == null){
			document.getElementById("dateError").innerHTML = "<span style='font-size: 10px; text-align:left;'><i class='fas fa-times'></i>  Please select date";
			return false;
	}
	
	if (hour == "" || minute == "" || ampm == "" || hour == null || minute == null || ampm == null){
			document.getElementById("timeError").innerHTML = "<span style='font-size: 10px; text-align:left;'><i class='fas fa-times'></i>  Please select time";
	}
	return true;
}

