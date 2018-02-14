<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!-- Change feature variable -->
<%! String feature = "Guests" ;%>

<% session.setAttribute("feature", feature); %>
<% session.setAttribute("title", "KIKAKUYA - " + feature); %>
<jsp:include page="/WEB-INF/includes/head.jsp" />
<jsp:include page="/WEB-INF/includes/header.jsp"/>
<table id="guests">
	<tr>
		<th>Select</th>
		<th>First Name</th>
		<th>Last Name</th>
		<th>Plus Ones - Adults</th>
		<th>Plus Ones - Kids</th>
		<th>Status</th>
		<!-- Load all guests for the selected event -->
	</tr>
	<c:forEach items="${guests}" var="guest" >
		<tr>
			<td>rd</td>
			<td>${guest.firstName}</td>
			<td>${guest.lastName}</td>
			<td>${guest.adultsWith}</td>
			<td>${guest.kidsWith}</td>
			<td>${guest.isPresent}
				<form class="showGuestForm" action="showGuest" method="post">
					<input name="selectedGuest" type="hidden" value="${guest.guestId}"/>
				</form>
			</td>
		</tr>
	</c:forEach>
</table>
<h2>Guest Details</h2>
<span>First Name: ${selectedGuest.firstName}</span>
<span>Last Name: ${selectedGuest.lastName}</span>
<span>Email: ${selectedGuest.email}</span>
<span>Maximum No. of Adults: ${selectedGuest.adultsMax}</span>
<span>Maximum No. of Kids: ${selectedGuest.kidsMax}</span>
<span>Group: ${selectedGuest.company}</span>
<span>Notes: add note column to the db</span>
<span><i>RSVP</i></span>
<span>RSVP Status: ${selectedGuest.isPresent}</span>
<span>Kids With: ${selectedGuest.kidsWith}&nbsp;&nbsp;Adults With: ${selectedGuest.adultsWith}</span>

<span></span>
<script>
function addRowHandlers() {
    var table = document.getElementById("guests");
    var rows = table.getElementsByTagName("tr");
    for (i = 0; i < rows.length; i++) {
        var currentRow = table.rows[i];
        var createClickHandler = 
            function(row) 
            {
                 return function() { 
                                   		var formNode = row.getElementsByClassName("showGuestForm");
                                   		console.log(formNode);
                                   		formNode[0].submit();
                                 }; 
            };

        currentRow.onclick = createClickHandler(currentRow);
    }
}
window.onload = addRowHandlers();
</script>
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