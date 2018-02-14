<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!-- Change feature variable -->
<%! String feature = "Guests" ;%>

<% session.setAttribute("feature", feature); %>
<% session.setAttribute("title", "KIKAKUYA - " + feature); %>
<jsp:include page="/WEB-INF/includes/head.jsp" />
<jsp:include page="/WEB-INF/includes/header.jsp"/>
<div class="table">
	<div class="row">
		<div class="cell">Select</div>
		<div class="cell">First Name</div>
		<div class="cell">Last Name</div>
		<div class="cell">Plus Ones - Adults</div>
		<div class="cell">Plus Ones - Kids</div>
		<div class="cell">Status</div>
		<!-- Load all guests for the selected event -->
	</div>
	<c:forEach items="${guests}" var="guest" >
		<a class="row" href="#">
			<div class="cell">rd</div>
			<div class="cell">${guest.firstName}</div>
			<div class="cell">${guest.lastName}</div>
			<div class="cell">${guest.adultsWith}</div>
			<div class="cell">${guest.kidsWith}</div>
			<div class="cell">${guest.isPresent}</div>
		</a>
	</c:forEach>
	
</div>
<br>
<form:form id="addGuest" action="addGuest" method="post" modelAttribute="guest">
	<span>First Name: </span>
	<form:input path="firstName"/>

	<br>
	
	<span>Last Name: </span>
	<form:input path="lastName"/>
	
	<br>
	<span>Email: </span>
	<form:input path="email"/>
	
	<br>
	
	<span>Plus ones: </span> <br/>
		<span>Adults:</span>
        	<form:select path="adultsMax">
        		<form:option value="0" label="0" selected="selected"/>
        		<form:option value="1" label="1"/>
        		<form:option value="2" label="2"/>
        		<form:option value="3" label="3"/>
        		<form:option value="4" label="4"/>
			</form:select>
        <span>Kids:</span>
        	<form:select path="kidsMax">
        		<form:option value="0" label="0" selected="selected"/>
        		<form:option value="1" label="1"/>
        		<form:option value="2" label="2"/>
        		<form:option value="3" label="3"/>
        		<form:option value="4" label="4"/>
			</form:select>
	<br>
	<span>RSVP Status: </span>
		<form:select path="isPresent">
			<option value="0"> - </option>
  			<option value="1">Present</option>
  			<option value="2">Not present</option>
		</form:select>
	<br>
	
	<span>Group: </span>
	<form:input path="company" value=""/>
	
	<br>
	<span>Note: </span>
	<form:input path="specialRequests" value=""/>
	<br/>
	<!-- TODO: Set value attr to eventId that's in the session scope -->
	<form:hidden path="eventId" value="1"/>
	
	<!-- TO IMPLEMENT: Show addGuest first and hide editGuest. When the user clicks on "edit", hide addGuest and show editGuest -->
	<span><input type="submit" value="Done"/></span>
</form:form>
<jsp:include page="/WEB-INF/includes/footer.jsp"/>