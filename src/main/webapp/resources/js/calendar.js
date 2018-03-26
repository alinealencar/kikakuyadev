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
            	 
            	 //Show appt after update
                 if(action === "editAppt") {
                	 var apptId = $("#apptId").val();
                	 showAppt(apptId);
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
            	 
            	 closeAppt();

             }
         });
}

/** SHOW APPOINTMENT **/

function showAppt(id){
	$("#addAppt").hide();
	
	//Send AJAX request with the id of the selected appointment
	$.ajax({
		type: "POST",
		url: "showAppt",
		data: {apptId: id}
	}).done(function(response){
		$("#apptColor").css('background-color', response.color);
		$("#apptTitle").html(response.title);
		
		//Format date with the 0 for days and months with one digit only
		var date = "";
		
		if((response.day).length < 2)
			date += "0";
		
		date += response.day + "/"; 
		
		if(getMonthInt(response.month) < 10)
			date += "0";
		
		date += getMonthInt(response.month) + "/" + response.year;
		
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
		$("#apptNotes").html(response.notes);
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
	
	//Send AJAX request with the id of the selected appointment
	$.ajax({
		type: "POST",
		url: "showAppt",
		data: {apptId: id}
	}).done(function(response){
		$("#apptId").val(response.apptId);
		$("#title").val(response.title);
		$("#day").val(response.day);
		$("#month").val(getMonthInt(response.month));
		$("#year").val(response.year);
		$("#hour").val(response.hour);
		$("#minute").val(response.minute);
		$("#ampm").val((response.ampm).toUpperCase());
		$("#location").val(response.location);
		$("input[name='color']").removeAttr('checked');
		$("input[name='color'][value='" + response.color + "']").prop('checked', true);
		$("#color").val(response.color);
		$("#notes").val(response.notes);
	});

	$("#addAppt").show();
	$("#btnSaveAppt").show();
}

/** DELETE APPOINTMENT **/

function deleteAppt(id){
	$.post({
		url: "deleteAppt",
		data: {apptId: id}
	}).done(function(response){
		showFeedbackMessages(response);
	});
	
	$("#showAppt").hide();
	
	//Reload calendar
	calendarNav("loadMonth");
	$("#todaysAppts").show();
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
	
	
	
});

/** GET TODAYS APPTS **/
function getTodaysAppts(){
	$("#todaysApptList").empty();
	$.post({
		url: "todaysAppts",
		success: function(response) {
			console.log("inside get todays appts");
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
	    					if($("#"+ monthDay + response.name + apptsInTheMonth[k].year).children().length <= 3)
	    						if((apptsInTheMonth[k].title).length > 10)
	    							$('#' + monthDay + response.name + apptsInTheMonth[k].year).append("<div id="
	    									+ apptsInTheMonth[k].apptId + " class='appt' "
	    									+ "style='background-color: " + apptsInTheMonth[k].color + "' " 
	    									+ "onclick='showAppt(" + apptsInTheMonth[k].apptId + ")'>" 
	    									+ (apptsInTheMonth[k].title).substring(0,11) + "...</div>");
	    						else {
	    							$('#' + monthDay + response.name + apptsInTheMonth[k].year).append("<div id="
	    									+ apptsInTheMonth[k].apptId + " class='appt' "
	    									+ "style='background-color: " + apptsInTheMonth[k].color + "' " 
	    									+ "onclick='showAppt(" + apptsInTheMonth[k].apptId + ")'>" 
	    									+ apptsInTheMonth[k].title + "</div>");
	    						}
	    					else{
	    						$('#' + monthDay + response.name + apptsInTheMonth[k].year).append("more");
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
}

function openAddAppt(){
	$("#appt")[0].reset();
	$("#addAppt").show();
	$("#btnSaveAppt").hide();
	$("#todaysAppts").hide();
	$("#showAppt").hide();
	$("#btnAddAppt").show();
}

function showFeedbackMessages(response){
	//Feedback messages
	 if(response.indexOf("Error") == -1){
		 $(".successAlert").html(response);
		 $(".successAlert").show();
		 $(".errorAlert").hide();
		 
		 //show alert for 5 seconds and fade out
		 setTimeout(function() {
			 $(".successAlert").fadeOut();
		 }, 5000);
	 }
	 else {
		 $(".errorAlert").html(response);
		 $(".errorAlert").show();
		 $(".successAlert").hide();
		 
		 //show alert for 5 seconds and fade out
		 setTimeout(function() {
			 $(".errorAlert").fadeOut();
		 }, 5000);
	 }	
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

