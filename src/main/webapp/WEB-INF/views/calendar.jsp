
<!-- Change feature variable -->
<%! String feature = "Calendar" ;%>

<% session.setAttribute("feature", feature); %>
<% session.setAttribute("title", "KIKAKUYA - " + feature); %>
<jsp:include page="/WEB-INF/includes/head.jsp" />
<jsp:include page="/WEB-INF/includes/header.jsp"/>
<jsp:include page="/WEB-INF/includes/menu.jsp"/>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="container">
	<!-- body contents start -->
	<div class="row">
		<!-- Calendar -->
		<div class="col-sm-9">
			
			<button class="calNav" onclick="calendarNav('prevYear')"><i class="fas fa-chevron-left"></i></button>
			<span id="curYear">2018</span>
			<button class="calNav" onclick="calendarNav('nextYear')"><i class="fas fa-chevron-right"></i></button>
			<br>
			<button class="calNav" onclick="calendarNav('prevMonth')"><i class="fas fa-chevron-left"></i></button>
			<span id="curMonth">November</span>
			<button  class="calNav" onclick="calendarNav('nextMonth')"><i class="fas fa-chevron-right"></i></button>
			
			<table id="calendar" class="table table-bordered">
				<thead>
					<tr>
						<th scope="col">Sun</th>
						<th scope="col">Mon</th>
						<th scope="col">Tue</th>
						<th scope="col">Wed</th>
						<th scope="col">Thu</th>
						<th scope="col">Fri</th>
						<th scope="col">Sat</th>
					</tr>
				</thead>
				<tbody>
				
				</tbody>
			</table>
		</div>
		
		<!-- Right side -->
		<div class="col-sm-3">
			<!-- Add appointment -->
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
	        			<option value="12">December</option>
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
					
					<label>Color*: </label><br>
					<label class="selectColor">
						<form:radiobutton path="color" value="rgb(255,153,255)"/>
						<div class="circle" style="background-color:rgb(255,153,255)"></div>
					</label>
					<label class="selectColor">
						<form:radiobutton path="color" value="rgb(255,255,153)"/>
						<div class="circle" style="background-color:rgb(255,255,153)"></div>
					</label>
					<label class="selectColor">
						<form:radiobutton path="color" value="rgb(102,255,255)"/>
						<div class="circle" style="background-color:rgb(102,255,255)"></div>
					</label>
					<label class="selectColor">
						<form:radiobutton path="color" value="rgb(153,255,153)"/>
						<div class="circle" style="background-color:rgb(153,255,153)"></div>
					</label>
					<label class="selectColor">
						<form:radiobutton path="color" value="rgb(204,153,255)"/>
						<div class="circle" style="background-color:rgb(204,153,255)"></div>
					</label>

					
					<br>
					<label>Notes:</label>
					<textarea id="notes" name="notes" cols="40" rows="5" class="item form-control"></textarea>
					
					<input type="submit" value="Add"/>
				</form:form>
			</div>
			
			<!-- Show appointment -->
			<div id="showAppt">
				<div id="bannerColor"></div>
				<div id="apptDetails">
					<span id="apptTitle"></span>
					<span id="apptDate"></span>
					<span>@</span>
					<span id="apptTime"></span>
					<span id="apptLocation"></span>
					<span>Notes:</span>
					<span id="apptNotes"></span>
				</div>
			</div>
			
			<!-- Edit appointment -->
			<div id="editAppt">
			</div>
		</div>
	</div>
</div>
<script src="resources/js/calendar.js"></script>
<jsp:include page="/WEB-INF/includes/footer.jsp"/>
