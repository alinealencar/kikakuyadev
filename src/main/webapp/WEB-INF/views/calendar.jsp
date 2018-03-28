
<!-- Change feature variable -->
<%! String feature = "Calendar" ;%>

<% session.setAttribute("feature", feature); %>
<% session.setAttribute("title", "KIKAKUYA - " + feature); %>
<jsp:include page="/WEB-INF/includes/head.jsp" />
<jsp:include page="/WEB-INF/includes/header.jsp"/>
<jsp:include page="/WEB-INF/includes/menu.jsp"/>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<script src="resources/js/validateAppointment.js"></script>
<div class="container">
	<!-- body contents start -->
	<div class="row">
		<!-- Left -->
		<div class="col-lg-9">
			
			<div class="row">
				<div class="col-9">
					<div class="row">
						<div class="col-12 text-center">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="#" data-toggle="tooltip" data-placement="left" title="previous year">
								<button class="calNav" onclick="calendarNav('prevYear')"><i class="fas fa-chevron-left"></i></button>
							</a>
							<span id="curYear"></span>
							<a href="#" data-toggle="tooltip" data-placement="right" title="next year">
								<button class="calNav" onclick="calendarNav('nextYear')"><i class="fas fa-chevron-right"></i></button>
							</a>
						</div>
					</div>
					<div class="row">
						<div class="col-12 text-center">	
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			
							<a href="#" data-toggle="tooltip" data-placement="left" title="previous month">
								<button class="calNav" onclick="calendarNav('prevMonth')"><i class="fas fa-chevron-left"></i></button>
							</a>
							<span id="curMonth"></span>
							<a href="#" data-toggle="tooltip" data-placement="right" title="next month">
								<button  class="calNav" onclick="calendarNav('nextMonth')"><i class="fas fa-chevron-right"></i></button>
							</a>
						</div>
					</div>
				</div>
				<div class="col-3 text-right">
					<!-- Add new appointment circle button-->
					<a href="#" class="d-none d-lg-block">
					<button type="button" class="btn btn-link img-fluid" onclick="openAddAppt()">
      					<span class="material-icons" style="background-color: #F1E9DA; color: #D90368; font-size: 300%;">add_circle</span>
   					</button>
   					</a>
					<a href="#sectionAddAppt" class="d-block d-lg-none scrollable">
					<button type="button" class="btn btn-link img-fluid" onclick="openAddAppt()">
      					<span class="material-icons" style="background-color: #F1E9DA; color: #D90368; font-size: 300%;">add_circle</span>
   					</button>
   					</a>  		
				</div>
			</div>
			<!-- Calendar -->
			<div id="showCalendar" class="table-responsive" style="display:none;">
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
		</div>
		
		<!-- Right -->
		<div class="col-lg-3">
			<div class="successAlert" style="display:none;"></div>
			<div class="errorAlert" style="display:none;"></div>
			<!-- Add and Edit appointment (Same form) -->
			<div id="sectionAddAppt">
			<div id="addAppt" style="display:none;">
				<div class="text-right">
				<span onclick="closeAppt()" class="closebtn"><i class="fas fa-times"></i></span>
				</div>
				<form:form action="addAppt" method="post" modelAttribute="appt">
					<form:hidden path="apptId"/>
					<label>Title<span style="font-size:22px;color:red">*</span>: </label>
					<form:input path="title" type="text" class="item form-control" maxlength="30" oninput="validateTitle(this)"/>
					<div><span id="titleError" class="formError"></span></div>
					<label>Date<span style="font-size:22px;color:red">*</span>: </label>
					<div class="row" style="padding:0 15px 0 15px;">

						<form:select id="day" class="form-control-sm col-4" path="day" disabled="disabled" onchange="validateDate(this)">
			        		<option value="" disabled="disabled" selected="true">dd</option>
			        	</form:select>	

   						<form:select id="month" class="form-control-sm col-4" path="month" onchange="validateDate(this)">
			       			<option value="" disabled="disabled" selected="true">mm</option>
			      			<option value="1">Jan</option>
			       			<option value="2">Feb</option>
			       			<option value="3">Mar</option>
			       			<option value="4">Apr</option>
			       			<option value="5">May</option>
			       			<option value="6">Jun</option>
			       			<option value="7">Jul</option>
			       			<option value="8">Aug</option>
			       			<option value="9">Sep</option>
			       			<option value="10">Oct</option>
			       			<option value="11">Nov</option>
			       			<option value="12">Dec</option>
		      			</form:select>


	      				<form:select id="year" class="form-control-sm col-4" path="year" onchange="validateDate(this)">
		        			<option value="" disabled="disabled" selected="true">yyyy</option>
		   				</form:select>
      				</div>
      				<div><span id="dateError" class="formError"></span></div>
      				
					<label>Time<span style="font-size:22px;color:red">*</span>: </label>
					<div class="row" style="padding:0 15px 0 15px;">
						<form:select id="hour" class="form-control-sm col-4" path="hour" onchange="validateTime(this)">
							<option value="" disabled="disabled" selected="true">hh</option>
							<option value="1">01</option>
							<option value="2">02</option>
							<option value="3">03</option>
							<option value="4">04</option>
							<option value="5">05</option>
							<option value="6">06</option>
							<option value="7">07</option>
							<option value="8">08</option>
							<option value="9">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</form:select>
						<form:select id="minute" class="form-control-sm col-4" path="minute" onchange="validateTime(this)">
							<option value="" disabled="disabled" selected="true">mm</option>
							<option value="0">00</option>
							<option value="5">05</option>
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
						<form:select id="ampm" class="form-control-sm col-4" path="ampm" onchange="validateTime(this)">
							<option value="AM" selected="true">AM</option>
							<option value="PM">PM</option>
						</form:select>
					</div>
					<div><span id="timeError" class="formError"></span></div>
					
					<label>Address<span style="font-size:22px;color:red">*</span>: </label>
					<form:input path="location" type="text" class="item form-control" maxlength="100" oninput="validateAdd(this)"/>
					<div><span id="addressError" class="formError"></span></div>
					
					<label>Color<span style="font-size:22px;color:red">*</span>: </label><br>
					<label class="selectColor">
						<form:radiobutton path="color" value="rgb(255,153,255)" onclick="validateColor(this)"/>
						<div class="circle" style="background-color:rgb(255,153,255)"></div>
					</label>
					<label class="selectColor">
						<form:radiobutton path="color" value="rgb(255,255,153)" onclick="validateColor(this)"/>
						<div class="circle" style="background-color:rgb(255,255,153)"></div>
					</label>
					<label class="selectColor">
						<form:radiobutton path="color" value="rgb(102,255,255)" onclick="validateColor(this)"/>
						<div class="circle" style="background-color:rgb(102,255,255)"></div>
					</label>
					<label class="selectColor">
						<form:radiobutton path="color" value="rgb(153,255,153)" onclick="validateColor(this)"/>
						<div class="circle" style="background-color:rgb(153,255,153)"></div>
					</label>
					<label class="selectColor">
						<form:radiobutton path="color" value="rgb(204,153,255)" onclick="validateColor(this)"/>
						<div class="circle" style="background-color:rgb(204,153,255)"></div>
					</label>
					<div><span id="colorError" class="formError"></span></div>
					
					<br>
					<label>Notes:</label>
					<textarea id="notes" name="notes" cols="40" rows="5" class="item form-control"></textarea>
					<div class="row" style="margin-top:20px;">
						<div class= "col-12 text-center">
					<input id="btnAddAppt" class="btn" type="button" value="Add" onclick="addEditAppt('addAppt');" style="background-color:#D90368; color:#F1E9DA;"/>
					<input id="btnSaveAppt" class="btn btn-info" type="button" value="Save" onclick="addEditAppt('editAppt');" />
						</div>
					</div>
				</form:form>
			</div>
			</div>
			<!-- Today's appointments -->
			<div id="todaysAppts">
				<h4>Today</h4>
				<h3><span id="todaysDate"></span></h3>
				<h4><div id="todaysApptList"></div></h4>
			</div>
			
			<!-- Show appointment -->
			<div id="sectionShowAppt">
			<div id="showAppt" style="display:none;">
				<div id="bannerColor"></div>
				<div class="row">
					<div class="col-6 text-left">
					<span class="editAppt" onclick="deleteAppt(this.id)"><i class="far fa-trash-alt"></i></span>
					<span class="editAppt" onclick="openEditAppt(this.id)"><i class="fas fa-edit"></i></span>
					</div>
					<div class="col-6 text-right">
					<span onclick="closeAppt()" class="closebtn"><i class="fas fa-times"></i></span>
					</div>
				</div>
				<div id="apptDetails">
					<div id="apptColor" style="height: 30px"></div>
					<div class="col text-center">
					<span id="apptTitle"></span>
					</div>
					<div class="text-center">
					<br>
					<span id="apptDate"></span>
					<br>
					@
					<br>
					<span id="apptTime"></span>
					<br>
					<span id="apptLocation"></span>
					<br>
					</div>
					<span id="notesLabel">Notes:</span><br>
					<span id="apptNotes"></span>
				</div>
			</div>
			</div>
			<!-- Show appointments for days with 3+ appointments scheduled -->
			<div id="showDay">
				<h3><span id="selectedDate"></span></h3>
				<h4><div id="selectedDateApptList"></div></h4>
			</div>
		</div>
	</div>
</div>
<script src="resources/js/calendar.js"></script>
<jsp:include page="/WEB-INF/includes/footer.jsp"/>
