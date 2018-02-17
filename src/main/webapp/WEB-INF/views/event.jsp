<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/includes/event.jsp" />
<!-- div id="showEventList"-->
<!-- form:form action="list" method="post" modelAttribute="event"-->

<button class="w3-button w3-xlarge w3-circle w3-pink" oncLick="showForm()">+</button>
<div id = "alertMessage">
	<div class="${(insertError  != null) ? 'alert alert-danger' :''}" role="alert">${insertError }</div>
	<div class="${(addAnEvent  != null) ? 'alert alert-danger' :''}" role="alert">${addAnEvent }</div>
	<div class="${(noEvents  != null) ? 'alert alert-danger' :''}" role="alert">${noEvents }</div>
</div>


	<div class="tile">
		<c:forEach items="${listEvent}" var="event">
			<div class="eventTile">Event Name: ${event.eventName}
			<button type="submit" formmethod="GET" action="delete?eventId=${event.eventId}" value="Delete"></button>
		<a class="tile-title" href="search" style="text-decoration:none">
			Location: ${event.location} <br/>
			Event Date: ${event.eventDate}<br/>
		</a>
			</div>
		</c:forEach>
	</div>


<!-- /form:form -->
<!--<spring:url value="/add" var="saveURL"/>-->

<div id="showAddForm" style="display:none;">

<form:form modelAttribute="event" method="POST" action="add" >
	<!--<form:hidden path="eventId"/>-->
<table>
	<tr>
		<td>Event Name:</td>
		<td><form:input path="eventName"/>
	</tr>
	<tr>
		<td>Location:</td>
		<td><form:input path="location"/>
	</tr>

	<tr>
		<td>Date:</td>
		<td><form:input type="date" path="eventDate"/>
	</tr>
	
	<tr>
		<td></td>
		<td><button type="submit" onclick="showList">Save</button>
	</tr>
</table>
</form:form>
</div>
	<script>
	function showList() {
	    var list = document.getElementById("showEventList");
	    var addFrom = document.getElementById("showAddForm")
	    if (list.style.display === "none") {
	        list.style.display = "block";
	        addFrom.style.display = "none";
	    }
	}
	function showForm(){
		var list = document.getElementById("showEventList");
		var addFrom = document.getElementById("showAddForm")
		if (addFrom.style.display === "none"){
			addFrom.style.display = "block";
			list.style.display = "none";
		}
	}
	function showMessage(){
		
	}
	
	</script>
	
<style>
.eventTile{
	border: 2px solid;
	float: left;
	margin-right: 10px;
	}
	
.tile {
  transform: scale(1); 
  position: relative;
  width: 100%;
  margin: 0.5em;
}

.tile-thumbnail {
  position: relative;
  height: 0;
  padding-bottom: 60%;
  
  > img {
    position: absolute;
    width: 100%;
    height: 100%;
  }
}

.tile-title { 
  border-top: 1px solid;
  display: block;
  margin: 0.25em;
  color: #333;
  font-weight: 700;
  text-align: left;
  text-decoration: bold;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  
  &:before {
    content: '';
    z-index: 1;
    position: absolute;
    display: block;
    background: rgba(#f00, 0.25);
  }
}
</style>