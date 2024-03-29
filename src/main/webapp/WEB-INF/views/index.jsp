<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> --%>

<% session.setAttribute("title", "KIKAKUYA"); %>

<jsp:include page="/WEB-INF/includes/head.jsp" />
<jsp:include page="/WEB-INF/includes/header-login.jsp"/>

<div id="contents" class="container" style="margin-top: 50px;">
	<!-- body contents start -->
	<div class="row">
		<div class="col-sm-12 text-center"  style="margin-bottom: 30px;">
			<h2>FEATURES</h2>
		</div>
	</div>
	<br>
	<br>
	<div class="row">
		<div class="col-sm-4 text-center">
			<img class="img-fluid" alt="Budget" src="resources/images/login/budget_circle_line.png" width="30%">
			<h3>Budget</h3>
			<p> Save money and track your budget. "Budget" shows you how your cash is moving by categories and vendors. It prevents you from overspending and helps you monitor and balance your expenses.</p>
		</div>
		<br>
		<br>
		<div class="col-sm-4 text-center">
			<img alt="Calendar" src="resources/images/login/calendar_circle_line.png" width="30%">
			<h3>Calendar</h3>
			<p>Scheduling is one of the most important elements to make an event a success. "Calendar" is a simple an easy tool to help you with your appointments.</p>
		</div>
		<div class="col-sm-4 text-center">
			<img alt="Guests" src="resources/images/login/guest_circle_line.png" width="30%">
			<h3>Guests</h3>
			<p>Who is coming? Did you receive a response for your RSVP? "Guests" assists with your guest management. Includes broadcasting messages to guests and RSVP.</p>
		</div>
	</div>
	<br>
	<br>
	<div class="row">
		<div class="col-sm-4 text-center">
			<img alt="Lists" src="resources/images/login/list_circle_line.png" width="30%">
			<h3>Lists</h3>
			<p>Don't forget anything for the event! Boost your productivity! "Lists" supports your stressless preparation.</p>
		</div>
		<div class="col-sm-4 text-center">
			<img alt="Search" src="resources/images/login/search_circle_line.png" width="30%">
			<h3>Search</h3>
			<p>Browse business by category and location. You will find the right service at the right place with "Search".</p>
		</div>
		<div class="col-sm-4">
			<div class="row">
				<div class="col-sm-4 text-center">
				</div>
				<div class="col-sm-8">
					<h3></h3>
					<p></p>
				</div>
			</div>		
		</div>
	</div>
  	<!-- body contents end -->
</div>
<jsp:include page="/WEB-INF/includes/footer.jsp"/>
<script src="resources/js/index.js"></script>