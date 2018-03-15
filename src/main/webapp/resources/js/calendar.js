/** Day dropdown **/
function daysInMonth(month, year) {
  return new Date(year, month, 0).getDate();
}

$('#year, #month').change(function() {	
  if ($('#year').val().length > 0 && $('#month').val().length > 0) {
    $('#day').prop('disabled', false);
    $('#day').find('option').remove();

    var daysInSelectedMonth = daysInMonth($('#month').val(), $('#year').val());

    for (var i = 1; i <= daysInSelectedMonth; i++) {
      $('#day').append($("<option></option>").attr("value", i).text(i));
    }

  } else {
    $('#day').prop('disabled', true);
  }

});

/** ADD APPOINTMENT **/

function addAppt(){
	console.log("clicked in add appt");
	console.log($("#appt").serialize());
		console.log("inside ajax");
        $.post({
             url: 'addAppt',
             data:$("#appt").serialize(),
             success: function(response) {
            	 if(response.indexOf("Error") != -1)
            		 $("#addSuccess").html(response);
            	 else
            		 $("#addError").html(response);
             }
         });
}

/** SHOW APPOINTMENT **/

function showAppt(id){
	$("#addAppt").hide();
	$("#editAppt").hide();
	
	//Send AJAX request with the id of the selected appointment
	$.ajax({
		type: "POST",
		url: "showAppt",
		data: {apptId: id}
	}).done(function(response){
		$("#apptTitle").html(response.title);
		$("#apptDate").html(response.day + "/" + getMonthInt(response.month) + "/" + response.year);
		$("#apptTime").html(response.hour + ":" + response.minute + " " + response.ampm.toUpperCase());
		$("#apptLocation").html(response.location);
		$("#apptNotes").html(response.notes);
	});
	
	//Set the apptId as the id of the element that shows the appt
	$(".editAppt").attr("id", id);
	
	//Show appt 
	$("#showAppt").show();
}

/** EDIT APPOINTMENT **/
function openEditAppt(id){
	$("#showAppt").hide();
	
	//Send AJAX request with the id of the selected appointment
	$.ajax({
		type: "POST",
		url: "showAppt",
		data: {apptId: id}
	}).done(function(response){
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
		console.log(response.color);
	});
	
	
	$("#addAppt").show();
}

/** CALENDAR NAVIGATION**/ 

$(document).ready(function(){
	$("#curYear").html(new Date().getFullYear());
	$("#curMonth").html(getMonthName(new Date().getMonth()));
	//load calendar when page is opened for the first time
	calendarNav("loadMonth");
	
	for(var i = 1; i <= 31; i++)
		$('<option>').val(i).text(i).appendTo('#day');
});

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
	    			$("#calendar").find('#week' + weekNum).append($('<td>')
	    	            .append(""));
	    		else {
	    			$("#calendar").find('#week' + weekNum).append($('<td>')
	    					.append("<span id=" + monthDay + response.name + response.year +">" + monthDay + "<span>"));
	    			//console.log(Object.keys(apptDict));
	    			if(apptDict[monthDay+response.name+response.year] != undefined){
	    				//console.log("there's stuff for this day: " + monthDay+response.name+$('#curYear').html());
	    				//console.log("keys: "+Object.keys(apptDict));
	    				var apptsInTheMonth = apptDict[monthDay+response.name+$('#curYear').html()];
	    				//console.log("num of appts: " + apptsInTheMonth.length);
	    				for(var k = 0; k < apptsInTheMonth.length; k++){
	    					$('#' + monthDay + response.name + apptsInTheMonth[k].year).append("<br><div id="
	    							+ apptsInTheMonth[k].apptId + " class='appt' "
	    							+ "style='background-color: " + apptsInTheMonth[k].color + "' " 
	    							+ "onclick='showAppt(" + apptsInTheMonth[k].apptId + ")'>" 
	    							+ apptsInTheMonth[k].title + "</div>");
	    					//console.log('#' + monthDay + response.name + apptsInTheMonth[k].year);
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
	    });
}

function getMonthInt(monthStr){
	var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
	return months.indexOf(monthStr) + 1;
}

function getMonthName(monthInt){
	var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
	return months[monthInt];
}

function showAddAppt(){
	$("#showAppt").hide();
	$("#editAppt").hide();
	$("#addAppt").show();
}

function showEditAppt(){
	$("#showAppt").hide();
	$("#editAppt").show();
	
}