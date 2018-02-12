<nav class="container-fluid mt-3" >
	<div class="row">
		<div class="col-md-3"><h2 id="feature" class="mt-2">${feature}</h2></div>

		<div id="navi-icon" class="col-md-9">
			<ul>
				
				<li id="btnBudget"><form action="budget" method="get"><input class="img-fluid" type="image" src="resources/images/header/budget_circle_line.png" alt="Budget" width="55"></form></li>
				<li id="btnBudgetFill" style="display:none;"><input class="img-fluid" type="image" src="resources/images/header/budget_circle_fill.png" alt="Budget" width="55"></li>
				
				<li id="btnCalendar"><form action="calendar" method="get"><input type="image" class="img-fluid" src="resources/images/header/calendar_circle_line.png" alt="Calendar" width="55" ></form></li>
				<li id="btnCalendarFill" style="display:none;"><input id="btnCalendar"class="img-fluid" type="image" src="resources/images/header/calendar_circle_fill.png" alt="Calendar" width="55"></li>
				
				<li id="btnGuest"><form action="guestsDash" method="get"><input id="btnGuest"class="img-fluid" type="image" src="resources/images/header/guest_circle_line.png" alt="Guest" width="55"></form></li>
				<li id="btnGuestFill" style="display:none;"><input id="btnGuest"class="img-fluid" type="image" src="resources/images/header/guest_circle_fill.png" alt="Guest" width="55"></li>
				
				<li id="btnList"><form action="lists" method="get"><input id="btnList"class="img-fluid" type="image" src="resources/images/header/list_circle_line.png" alt="List" width="55"></form></li>
				<li id="btnListFill" style="display:none;"><input id="btnList"class="img-fluid" type="image" src="resources/images/header/list_circle_fill.png" alt="List" width="55"></li>
				
				<li id="btnSearch"><form action="search" method="get"><input id="btnSearch"class="img-fluid" type="image" src="resources/images/header/search_circle_line.png" alt="Search" width="55"></form></li>
				<li id="btnSearchFill" style="display:none;"><input id="btnSearch"class="img-fluid" type="image" src="resources/images/header/search_circle_fill.png" alt="Search" width="55"></li>
				
			</ul>
		</div>
		
	</div>
</nav>

<script>
//change button appearance depend on feature
	if($("#feature").text() == "Budget"){
		$("#btnBudgetFill").show();
		$("#btnBudget").hide();
	}else if($("#feature").text() == "Calendar"){
		$("#btnCalendarFill").show();
		$("#btnCalendar").hide();
	}else if($("#feature").text() == "Guests"){
		$("#btnGuestFill").show();
		$("#btnGuest").hide();
	}else if($("#feature").text() == "Lists"){
		$("#btnListFill").show();
		$("#btnList").hide();
	}else if($("#feature").text() == "Search"){
		$("#btnSearchFill").show();
		$("#btnSearch").hide();
	}

//hide filled button icon
	function hideAll(){
		 $("#btnBudgetFill").hide();
	     $("#btnBudget").show();
	     $("#btnCalendarFill").hide();
	     $("#btnCalendar").show();
	     $("#btnGuestFill").hide();
	     $("#btnGuest").show();
	     $("#btnListFill").hide();
	     $("#btnList").show();
	     $("#btnSearchFill").hide();
	     $("#btnSearch").show();
	}

//onclick change button icon to filled button
	$(document).ready(function(){			
	    $("#btnBudget, #btnBudgetFill").click(function(){
	    	hideAll();
	        $("#btnBudgetFill").show();
	        $("#btnBudget").hide();
	    });		   
	    $("#btnCalendar, #btnCalendarFill").click(function(){
	    	hideAll();
	        $("#btnCalendarFill").show();
	        $("#btnCalendar").hide();
	    });
	    $("#btnGuest, #btnGuestFill").click(function(){
	    	hideAll();
	        $("#btnGuestFill").show();
	        $("#btnGuest").hide();
	    });
	    $("#btnList, #btnListFill").click(function(){
	    	hideAll();
	        $("#btnListFill").show();
	        $("#btnList").hide();
	    });
	    $("#btnSearch, #btnSearchFill").click(function(){
	    	hideAll();
	        $("#btnSearchFill").show();
	        $("#btnSearch").hide();
	    });
	});

</script>