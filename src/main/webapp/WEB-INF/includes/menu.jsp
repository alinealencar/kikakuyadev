<nav class="container-fluid mt-3" >
	<div class="row">
		<div class="col-md-3"><h2 id="feature" class="mt-2">${feature}</h2></div>

		<div id="navi-icon" class="col-md-9">
			<ul>
				<li id="btnBudget"><a href="#"><input class="img-fluid" type="image" src="resources/images/header/budget_circle_line.png" alt="Budget" width="55"></a></li>
				<li id="btnBudgetFill" style="display:none;"><a href="#"><input class="img-fluid" type="image" src="resources/images/header/budget_circle_fill.png" alt="Budget" width="55"></a></li>
				<li id="btnCalendar"><a href="#"><input type="image" class="img-fluid" src="resources/images/header/calendar_circle_line.png" alt="Calendar" width="55" onclick="openPage('/WEB-INF/views/calendar.jsp')"></li>
				<li id="btnCalendarFill" style="display:none;"><a href="#"><input id="btnCalendar"class="img-fluid" type="image" src="resources/images/header/calendar_circle_fill.png" alt="Calendar" width="55"></a></li>
				<li id="btnGuest"><a href="#"><input id="btnGuest"class="img-fluid" type="image" src="resources/images/header/guest_circle_line.png" alt="Guest" width="55"></a></li>
				<li id="btnGuestFill" style="display:none;"><a href="#"><input id="btnGuest"class="img-fluid" type="image" src="resources/images/header/guest_circle_fill.png" alt="Guest" width="55"></a></li>
				<li id="btnList"><a href="#"><input id="btnList"class="img-fluid" type="image" src="resources/images/header/list_circle_line.png" alt="List" width="55"></a></li>
				<li id="btnListFill" style="display:none;"><a href="#"><input id="btnList"class="img-fluid" type="image" src="resources/images/header/list_circle_fill.png" alt="List" width="55"></a></li>
				<li id="btnSearch"><a href="#"><input id="btnSearch"class="img-fluid" type="image" src="resources/images/header/search_circle_line.png" alt="Search" width="55"></a></li>
				<li id="btnSearchFill" style="display:none;"><a href="#"><input id="btnSearch"class="img-fluid" type="image" src="resources/images/header/search_circle_fill.png" alt="Search" width="55"></a></li>
			</ul>
		</div>
		
	</div>
</nav>

<script>
//change button appearance depend on feature
	if($("#feature").text() == "Budget Management"){
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