<nav class="container-fluid mt-3" >
	<div class="row">
		<div class="col-md-3"><h2 id="feature" class="mt-2">${feature}</h2></div>

		<div id="navi-icon" class="col-md-9">
			<ul>
				<li id="btnBudget"><a href="#"><input class="img-fluid" type="image" src="resources/images/header/budget_circle_line.png" alt="Budget" width="55"></a></li>
				<li id="btnBudgetFill" style="display:none;"><a href="#"><input class="img-fluid" type="image" src="resources/images/header/budget_circle_fill.png" alt="Budget" width="55"></a></li>
				<li id="btnCalendar"><input type="image" class="img-fluid" src="resources/images/header/calendar_circle_line.png" alt="Calendar" width="55" onclick="openPage('/WEB-INF/views/calendar.jsp')"></li>
				<li id="btnCalendarFill" style="display:none;"><a href="/WEB-INF/views/calendar.jsp"><input id="btnCalendar"class="img-fluid" type="image" src="resources/images/header/calendar_circle_fill.png" alt="Calendar" width="55"></a></li>
				<li><a href="#"><input id="btnGuest"class="img-fluid" type="image" src="resources/images/header/guest_circle_line.png" alt="Guest" width="55"></a></li>
				<li><a href="#"><input id="btnList"class="img-fluid" type="image" src="resources/images/header/list_circle_line.png" alt="List" width="55"></a></li>
				<li><a href="#"><input id="btnSearch"class="img-fluid" type="image" src="resources/images/header/search_circle_line.png" alt="Search" width="55"></a></li>
			</ul>
		</div>
		


<!--
		<% if((String)session.getAttribute("feature")==("Budget Manager")){%>
		<div id="navi-icon" class="col-md-9">
			<ul>
				<li><a href="#"><input class="img-fluid" type="image" src="resources/images/header/budget_circle_fill.png" alt="Budget" width="55"></a></li>
				<li><a href="#"><input class="img-fluid" type="image" src="resources/images/header/calendar_circle_line.png" alt="Calendar" width="55"></a></li>
				<li><a href="#"><input class="img-fluid" type="image" src="resources/images/header/guest_circle_line.png" alt="Guest" width="55"></a></li>
				<li><a href="#"><input class="img-fluid" type="image" src="resources/images/header/list_circle_line.png" alt="List" width="55"></a></li>
				<li><a href="#"><input class="img-fluid" type="image" src="resources/images/header/search_circle_line.png" alt="Search" width="55"></a></li>
			</ul>
		</div>
		<%}else if((String)session.getAttribute("feature")==("Calendar")){%>
		<div id="navi-icon" class="col-md-9">
			<ul>
				<li><a href="#"><input class="img-fluid" type="image" src="resources/images/header/budget_circle_line.png" alt="Budget" width="55"></a></li>
				<li><a href="#"><input class="img-fluid" type="image" src="resources/images/header/calendar_circle_fill.png" alt="Calendar" width="55"></a></li>
				<li><a href="#"><input class="img-fluid" type="image" src="resources/images/header/guest_circle_line.png" alt="Guest" width="55"></a></li>
				<li><a href="#"><input class="img-fluid" type="image" src="resources/images/header/list_circle_line.png" alt="List" width="55"></a></li>
				<li><a href="#"><input class="img-fluid" type="image" src="resources/images/header/search_circle_line.png" alt="Search" width="55"></a></li>
			</ul>
		</div>
		<%}else if((String)session.getAttribute("feature")==("Guests")){%>
		<div id="navi-icon" class="col-md-9">
			<ul>
				<li><a href="#"><input class="img-fluid" type="image" src="resources/images/header/budget_circle_line.png" alt="Budget" width="55"></a></li>
				<li><a href="#"><input class="img-fluid" type="image" src="resources/images/header/calendar_circle_line.png" alt="Calendar" width="55"></a></li>
				<li><a href="#"><input class="img-fluid" type="image" src="resources/images/header/guest_circle_fill.png" alt="Guest" width="55"></a></li>
				<li><a href="#"><input class="img-fluid" type="image" src="resources/images/header/list_circle_line.png" alt="List" width="55"></a></li>
				<li><a href="#"><input class="img-fluid" type="image" src="resources/images/header/search_circle_line.png" alt="Search" width="55"></a></li>
			</ul>
		</div>
		<%}else if((String)session.getAttribute("feature")==("Lists")){%>
		<div id="navi-icon" class="col-md-9">
			<ul>
				<li><a href="#"><input class="img-fluid" type="image" src="resources/images/header/budget_circle_line.png" alt="Budget" width="55"></a></li>
				<li><a href="#"><input class="img-fluid" type="image" src="resources/images/header/calendar_circle_line.png" alt="Calendar" width="55"></a></li>
				<li><a href="#"><input class="img-fluid" type="image" src="resources/images/header/guest_circle_line.png" alt="Guest" width="55"></a></li>
				<li><a href="#"><input class="img-fluid" type="image" src="resources/images/header/list_circle_fill.png" alt="List" width="55"></a></li>
				<li><a href="#"><input class="img-fluid" type="image" src="resources/images/header/search_circle_line.png" alt="Search" width="55"></a></li>
			</ul>
		</div>
		<%}else if((String)session.getAttribute("feature")==("Search")){%>
		<div id="navi-icon" class="col-md-9">
			<ul>
				<li><a href="#"><input class="img-fluid" type="image" src="resources/images/header/budget_circle_line.png" alt="Budget" width="55"></a></li>
				<li><a href="#"><input class="img-fluid" type="image" src="resources/images/header/calendar_circle_line.png" alt="Calendar" width="55"></a></li>
				<li><a href="#"><input class="img-fluid" type="image" src="resources/images/header/guest_circle_line.png" alt="Guest" width="55"></a></li>
				<li><a href="#"><input class="img-fluid" type="image" src="resources/images/header/list_circle_line.png" alt="List" width="55"></a></li>
				<li><a href="#"><input class="img-fluid" type="image" src="resources/images/header/search_circle_fill.png" alt="Search" width="55"></a></li>
			</ul>
		</div>
		<%}else{ %>
		<div id="navi-icon" class="col-md-9">
			<ul>
				<li><a href="#"><input class="img-fluid" type="image" src="resources/images/header/budget_circle_line.png" alt="Budget" width="55"></a></li>
				<li><a href="#"><input class="img-fluid" type="image" src="resources/images/header/calendar_circle_line.png" alt="Calendar" width="55"></a></li>
				<li><a href="#"><input class="img-fluid" type="image" src="resources/images/header/guest_circle_line.png" alt="Guest" width="55"></a></li>
				<li><a href="#"><input class="img-fluid" type="image" src="resources/images/header/list_circle_line.png" alt="List" width="55"></a></li>
				<li><a href="#"><input class="img-fluid" type="image" src="resources/images/header/search_circle_line.png" alt="Search" width="55"></a></li>
			</ul>
		</div>
		<%} %>
  -->		
	</div>
</nav>
<script>
	if($("#feature").text() == "Budget Management"){
		$("#btnBudgetFill").show();
		$("#btnBudget").hide();
	}else if($("#feature").text() == "Calendar"){
		$("#btnCalendarFill").show();
		$("#btnCalendar").hide();
	}
	
	
		$(document).ready(function(){
		    $("#btnBudget").click(function(){
		        $("#btnBudgetFill").show();
		        $("#btnBudget").hide();
		    });
		    $("#btnBudgetFill").click(function(){
		    	$("#btnBudgetFill").show();
		        $("#btnBudget").hide();
		    });
		    $("#btnCalendar").click(function(){
		        $("#btnCalendarFill").show();
		        $("#btnCalendar").hide();
		    });
		    $("#btnCalendarFill").click(function(){
		    	$("#btnCalendarFill").show();
		        $("#btnCalendar").hide();
		    });
		});

</script>