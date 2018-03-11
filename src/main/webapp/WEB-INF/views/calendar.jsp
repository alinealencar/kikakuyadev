
<!-- Change feature variable -->
<%! String feature = "Calendar" ;%>

<% session.setAttribute("feature", feature); %>
<% session.setAttribute("title", "KIKAKUYA - " + feature); %>
<jsp:include page="/WEB-INF/includes/head.jsp" />
<jsp:include page="/WEB-INF/includes/header.jsp"/>
<jsp:include page="/WEB-INF/includes/menu.jsp"/>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<script src="resources/js/calendar.js"></script>
<div class="container">
	<!-- body contents start -->
	<div class="row">
		<!-- Calendar -->
		<div class="col-sm-9">
			
			<button id="prevYear"><i class="fas fa-chevron-left"></i></button>
			<span id="curYear">2018</span>
			<button id="nextYear"><i class="fas fa-chevron-right"></i></button>
			<br>
			<button id="prevMonth"><i class="fas fa-chevron-left"></i></button>
			<span id="curMonth">March</span>
			<button id="nextMonth"><i class="fas fa-chevron-right"></i></button>
			<table id="calendar">
				<thead>
					<tr>
						<th>Sun</th>
						<th>Mon</th>
						<th>Tue</th>
						<th>Wed</th>
						<th>Thu</th>
						<th>Fri</th>
						<th>Sat</th>
					</tr>
				</thead>
				<tbody>
				
				</tbody>
			</table>
		</div>
		
		<!-- Forms -->
		<div class="col-sm-3">
			<div id="addAppt">
				<c:if test="${not empty addApptSuccess}">
					<div class="successAlert">${addApptSuccess}</div>
				</c:if>
				<form:form action="addAppt" method="post" modelAttribute="appt">
					<label>Title*: </label>
					<form:input path="title" type="text" class="item form-control"/>
					
					<label>Date*: </label>
					<form:select id="day" class="form-control" path="day" disabled="disabled">
	        			<option value="" disabled="disabled" selected="true">Day</option>
      				</form:select>
					<form:select id="month" class="form-control" path="month">
	        			<option value="" disabled="disabled" selected="true">Month</option>
	        			<option value="1">January</option>
	        			<option value="2">February</option>
	        			<option value="3">March</option>
	        			<option value="4">April</option>
	        			<option value="5">May</option>
	        			<option value="6">June</option>
	        			<option value="7">July</option>
	        			<option value="8">August</option>
	        			<option value="9">September</option>
	        			<option value="10">October</option>
	        			<option value="11">November</option>
	        			<option value="12">October</option>
      				</form:select>
      				<form:select id="year" class="form-control" path="year">
	        			<option value="" disabled="disabled" selected="true">Year</option>
	        			<option value="2018">2018</option>
  						<option value="2019">2019</option>
  						<option value="2020">2020</option>
  						<option value="2021">2021</option>
      				</form:select>
					<label>Time*: </label>
					<form:select id="hour" class="form-control" path="hour">
						<option value="" disabled="disabled" selected="true">hh</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</form:select>
					<span>:</span>
					<form:select id="minute" class="form-control" path="minute">
						<option value="" disabled="disabled" selected="true">mm</option>
						<option value="00">00</option>
						<option value="05">05</option>
						<option value="10">10</option>
						<option value="15">15</option>
						<option value="20">20</option>
						<option value="25">25</option>
						<option value="30">30</option>
						<option value="35">35</option>
						<option value="40">40</option>
						<option value="45">45</option>
						<option value="50">50</option>
						<option value="55">55</option>
					</form:select>
					<form:select id="ampm" class="form-control" path="ampm">
						<option value="AM" selected="true">AM</option>
						<option value="PM">PM</option>
					</form:select>
					
					<label>Location*: </label>
					<form:input path="location" type="text" class="item form-control"/>
					
					<label>Color*: </label>
					<form:input path="color" type="text" class="item form-control"/>
					
					<label>Notes:</label>
					<textarea id="notes" name="notes" cols="40" rows="5" class="item form-control"></textarea>
					
					<input type="submit" value="Add"/>
				</form:form>
			</div>
			<div id="showAppt">
			</div>
			<div id="editAppt">
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/includes/footer.jsp"/>
