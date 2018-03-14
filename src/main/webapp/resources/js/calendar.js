/** Day dropdown **/
function daysInMonth(month, year) {
  return new Date(year, month, 0).getDate();
}

$('#year, #month').change(function() {

	console.log("function was called");
	
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

/** CALENDAR **/ 

$(document).ready(function(){
	//load calendar when page is opened for the first time
	calendarNav("loadMonth");
});


function calendarNav(actionName){
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
	    				console.log("there's stuff for this day: " + monthDay+response.name+$('#curYear').html());
	    				console.log("keys: "+Object.keys(apptDict));
	    				var apptsInTheMonth = apptDict[monthDay+response.name+$('#curYear').html()];
	    				console.log("num of appts: " + apptsInTheMonth.length);
	    				for(var k = 0; k < apptsInTheMonth.length; k++){
	    					$('#' + monthDay + response.name + apptsInTheMonth[k].year).append("<br>" + apptsInTheMonth[k].title);
	    					console.log('#' + monthDay + response.name + apptsInTheMonth[k].year);
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
	return months.indexOf(monthStr);
}