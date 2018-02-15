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
		<th>Plus Ones</th>
		<th>Status</th>
		<!-- Load all guests for the selected event -->
	</tr>
	<c:forEach items="${guests}" var="guest" >
		<tr>
			<td>rd</td>
			<td>${guest.firstName}</td>
			<td>${guest.lastName}</td>
			<td>Adults: ${guest.adultsWith}&nbsp;&nbsp;&nbsp;Kids: ${guest.kidsWith}</td>
			<td><c:choose>
  					<c:when test="${guest.isPresent eq 0? true : false}"><i class="fas fa-question-circle"></i></c:when>
  					<c:when test="${guest.isPresent eq 1? true : false}"><i class="fas fa-check-circle"></i></c:when>
  					<c:otherwise><i class="fas fa-times-circle"></i></c:otherwise>
				</c:choose>
				<form class="showGuestForm" action="showGuest" method="post">
					<input name="selectedGuest" type="hidden" value="${guest.guestId}"/>
				</form>
			</td>
		</tr>
	</c:forEach>
</table>
<br>
<!-- Show guest -->
<div id="guestDetails">
	<h2>${selectedGuest.firstName} ${selectedGuest.lastName}</h2>
	<div>Email: ${selectedGuest.email}</div>
	<div>Maximum No. of Adults: ${selectedGuest.adultsMax}</div>
	<div>Maximum No. of Kids: ${selectedGuest.kidsMax}</div>
	<div>Group: ${selectedGuest.company}</div>
	<div>Notes: ${selectedGuest.notes}</div>
	<h6><i>RSVP</i></h6>
	<div>RSVP Status: ${selectedGuest.isPresent}</div>
	<div>Kids With: ${selectedGuest.kidsWith}&nbsp;&nbsp;Adults With: ${selectedGuest.adultsWith}</div>
</div>
<br>
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
<!-- Edit Guest -->
<h2>Edit Guest Information</h2>
<form:form id="editGuest" action="editGuest" method="post" modelAttribute="guest">
	<span>First Name:</span>
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
	
	<span>Group: </span>
	<form:input path="company" value=""/>
	
	<br>
	<span>Note: </span>
	<form:input path="specialRequests" value=""/>
	
</form:form>
<br>
<!-- Edit Plus Ones -->
<h2>Edit Plus Ones Information</h2>
<!-- Add guest -->
<h2>Add Guest</h2>
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