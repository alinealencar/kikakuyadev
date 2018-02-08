<nav class="container-fluid">
	<div class="row">
		<div class="col-md-3"><h2>${feature}</h2></div>

		<% if((String)session.getAttribute("feature")==("Budget Manager")){%>
		<div id="navi-icon" class="col-md-9">
			<ul>
				<li><a href="#"><input class="img-fluid" type="image" src="images/budget_circle_fill.png" alt="Budget" width="65"></a></li>
				<li><a href="#"><input class="img-fluid" type="image" src="images/calendar_circle_line.png" alt="Calendar" width="65"></a></li>
				<li><a href="#"><input class="img-fluid" type="image" src="images/guest_circle_line.png" alt="Guest" width="65"></a></li>
				<li><a href="#"><input class="img-fluid" type="image" src="images/list_circle_line.png" alt="List" width="65"></a></li>
				<li><a href="#"><input class="img-fluid" type="image" src="images/search_circle_line.png" alt="Search" width="65"></a></li>
			</ul>
		</div>
		<%}else if((String)session.getAttribute("feature")==("Calendar")){%>
		<div id="navi-icon" class="col-md-9">
			<ul>
				<li><a href="#"><input class="img-fluid" type="image" src="images/budget_circle_line.png" alt="Budget" width="65"></a></li>
				<li><a href="#"><input class="img-fluid" type="image" src="images/calendar_circle_fill.png" alt="Calendar" width="65"></a></li>
				<li><a href="#"><input class="img-fluid" type="image" src="images/guest_circle_line.png" alt="Guest" width="65"></a></li>
				<li><a href="#"><input class="img-fluid" type="image" src="images/list_circle_line.png" alt="List" width="65"></a></li>
				<li><a href="#"><input class="img-fluid" type="image" src="images/search_circle_line.png" alt="Search" width="65"></a></li>
			</ul>
		</div>
		<%}else if((String)session.getAttribute("feature")==("Guests")){%>
		<div id="navi-icon" class="col-md-9">
			<ul>
				<li><a href="#"><input class="img-fluid" type="image" src="images/budget_circle_line.png" alt="Budget" width="60"></a></li>
				<li><a href="#"><input class="img-fluid" type="image" src="images/calendar_circle_line.png" alt="Calendar" width="60"></a></li>
				<li><a href="#"><input class="img-fluid" type="image" src="images/guest_circle_fill.png" alt="Guest" width="60"></a></li>
				<li><a href="#"><input class="img-fluid" type="image" src="images/list_circle_line.png" alt="List" width="60"></a></li>
				<li><a href="#"><input class="img-fluid" type="image" src="images/search_circle_line.png" alt="Search" width="60"></a></li>
			</ul>
		</div>
		<%}else if((String)session.getAttribute("feature")==("Lists")){%>
		<div id="navi-icon" class="col-md-9">
			<ul>
				<li><a href="#"><input class="img-fluid" type="image" src="images/budget_circle_line.png" alt="Budget" width="65"></a></li>
				<li><a href="#"><input class="img-fluid" type="image" src="images/calendar_circle_line.png" alt="Calendar" width="65"></a></li>
				<li><a href="#"><input class="img-fluid" type="image" src="images/guest_circle_line.png" alt="Guest" width="65"></a></li>
				<li><a href="#"><input class="img-fluid" type="image" src="images/list_circle_fill.png" alt="List" width="65"></a></li>
				<li><a href="#"><input class="img-fluid" type="image" src="images/search_circle_line.png" alt="Search" width="65"></a></li>
			</ul>
		</div>
		<%}else if((String)session.getAttribute("feature")==("Search")){%>
		<div id="navi-icon" class="col-md-9">
			<ul>
				<li><a href="#"><input class="img-fluid" type="image" src="images/budget_circle_line.png" alt="Budget" width="65"></a></li>
				<li><a href="#"><input class="img-fluid" type="image" src="images/calendar_circle_line.png" alt="Calendar" width="65"></a></li>
				<li><a href="#"><input class="img-fluid" type="image" src="images/guest_circle_line.png" alt="Guest" width="65"></a></li>
				<li><a href="#"><input class="img-fluid" type="image" src="images/list_circle_line.png" alt="List" width="65"></a></li>
				<li><a href="#"><input class="img-fluid" type="image" src="images/search_circle_fill.png" alt="Search" width="65"></a></li>
			</ul>
		</div>
		<%}else{ %>
		<div id="navi-icon" class="col-md-9">
			<ul>
				<li><a href="#"><input class="img-fluid" type="image" src="images/budget_circle_line.png" alt="Budget" width="65"></a></li>
				<li><a href="#"><input class="img-fluid" type="image" src="images/calendar_circle_line.png" alt="Calendar" width="65"></a></li>
				<li><a href="#"><input class="img-fluid" type="image" src="images/guest_circle_line.png" alt="Guest" width="65"></a></li>
				<li><a href="#"><input class="img-fluid" type="image" src="images/list_circle_line.png" alt="List" width="65"></a></li>
				<li><a href="#"><input class="img-fluid" type="image" src="images/search_circle_line.png" alt="Search" width="65"></a></li>
			</ul>
		</div>
		<%} %>
	</div>
</nav>