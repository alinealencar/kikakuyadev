<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!-- Change feature variable -->
<%! String feature = "Guests" ;%>

<% session.setAttribute("feature", feature); %>
<% session.setAttribute("title", "KIKAKUYA - " + feature); %>
<jsp:include page="/WEB-INF/includes/head.jsp" />
<jsp:include page="/WEB-INF/includes/header.jsp"/>
<div class="container">
	<div class="row">
		<div class="col-8">
			<div class="row">
				<div class="col-10">
					<h2>Guest List</h2>
				</div>
				<div class="col-2">
					<button type="button" class="btn btn-link d-none d-md-block" onclick="addGuest()">
      					<span class="material-icons" style="font-size: 300%;">add_circle</span>
   					</button>
   				</div>
   			</div>
   			<div class="row">
				<table id="guests" class="table table-hover">
					<thead>
						<tr>
							<th scope="col">First Name</th>
							<th scope="col">Last Name</th>
							<th scope="col">Plus Ones</th>
							<th scope="col">RSVP Status</th>
							<!-- Load all guests for the selected event -->
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${guests}" var="guest" >
							<tr class="selectGuest">
								<td scope="row">${guest.firstName}</td>
								<td>${guest.lastName}</td>
								<td>Adults: ${guest.adultsWith}&nbsp;&nbsp;&nbsp;Kids: ${guest.kidsWith}</td>
								<td><c:choose>
					  					<c:when test="${guest.isPresent eq 0? true : false}"><span class="noReply"><i class="fas fa-question-circle"></i></span></c:when>
					  					<c:when test="${guest.isPresent eq 1? true : false}"><span class="present"><i class="fas fa-check-circle"></i></span></c:when>
					  					<c:otherwise><span class="absent"><i class="fas fa-times-circle"></i></span></c:otherwise>
									</c:choose>
									<form class="showGuestForm" action="showGuest" method="post">
										<input name="selectedGuest" type="hidden" value="${guest.guestId}"/>
									</form>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<br>
			</div>
			<div class="col-4">
				<div id="showGuestSection" style="display:${selectedGuest == null? 'none':'inline-block'}">
					<!-- Show guest -->
					<div id="guestDetails">
						<span onclick="editGuest(); return false"><i class="fas fa-edit"></i></span>
						<span onclick="closeAll(); return false"><i class="fas fa-times"></i></span>
						<h2>${selectedGuest.firstName} ${selectedGuest.lastName}</h2>
						<div>Email: ${selectedGuest.email}</div>
						<div>Maximum No. of Adults: ${selectedGuest.adultsMax}</div>
						<div>Maximum No. of Kids: ${selectedGuest.kidsMax}</div>
						<div>Group: ${selectedGuest.company}</div>
						<div>Notes: ${selectedGuest.notes}</div>
						<br>
						<h5><i>RSVP</i></h5>
						<div>RSVP Status: ${selectedGuest.isPresent}</div>
						<div>Meal Choice: ${selectedGuest.mealChoice}</div>
						<div>Kids With: ${selectedGuest.kidsWith}&nbsp;&nbsp;Adults With: ${selectedGuest.adultsWith}</div>
						<div>Special Requests: ${selectedGuest.specialRequests}</div>
						<br>
						<h5><i>Plus Ones</i></h5>
						<div>Adults: </div>
						<c:forEach items="${plusOnesList.plusOnes}" var="person" >
							${person.fullName}
							<c:if test="${person.category == 'Adult'}">
								<div><span>Name: ${person.fullName} - </span><span>Meal Choice: ${person.mealChoice}</span></div>
							</c:if>
						</c:forEach>
						<div>Kids: </div>
						<c:forEach items="${plusOnesList.plusOnes}" var="person" >
							<c:if test="${person.category == 'Kid'}">
								<div><span>Name: ${person.fullName} - </span><span>Meal Choice: ${person.mealChoice}</span></div>
							</c:if>
						</c:forEach>
						<br>
						<form:form action="deleteGuest" method="post">
							<input name="token" type="hidden" value="${selectedGuest.guestId}"/>
							<input class="btn btn-danger" type="submit" value="Remove guest"/>
						</form:form>
					</div>
					<br>
				</div>
			<br>
			<div id="editGuestSection" style="display:none">
				<!-- Edit Guest -->
				<h2>Edit Guest Information</h2>
				<form:form id="editGuest" action="editGuest" method="post" modelAttribute="guest">
					<form:hidden path="token" value="${selectedGuest.token}"/>
					<span>First Name:</span>
					<form:input path="firstName" value="${selectedGuest.firstName}"/>
					
					<br>
					<span>Last Name: </span>
					<form:input path="lastName" value="${selectedGuest.lastName}"/>
					
					<br>
					<span>Email: </span>
					<form:input path="email" value="${selectedGuest.email}"/>
					
					<br>
					<span>RSVP Status: </span>
					<form:select path="isPresent">
						<form:option value="0" label="No Reply" selected="${(selectedGuest.isPresent eq 0) ? 'selected' : ''}"/>
				  		<form:option value="1" label="Present" selected="${(selectedGuest.isPresent eq 1) ? 'selected' : ''}"/>
				  		<form:option value="2" label="Absent" selected="${(selectedGuest.isPresent eq 2) ? 'selected' : ''}"/>
					</form:select>
					<br>
					<span>Plus ones (Maximum): </span> <br/>
						<span>Adults:</span>
				        	<form:select path="adultsMax">
				        		<form:option value="0" label="0" selected="${(selectedGuest.adultsMax eq 0) ? 'selected' : ''}"/>
				        		<form:option value="1" label="1" selected="${(selectedGuest.adultsMax eq 1) ? 'selected' : ''}"/>
				        		<form:option value="2" label="2" selected="${(selectedGuest.adultsMax eq 2) ? 'selected' : ''}"/>
				        		<form:option value="3" label="3" selected="${(selectedGuest.adultsMax eq 3) ? 'selected' : ''}"/>
				        		<form:option value="4" label="4" selected="${(selectedGuest.adultsMax eq 4) ? 'selected' : ''}"/>
							</form:select>
				        <span>Kids:</span>
				        	<form:select path="kidsMax">
				        		<form:option value="0" label="0" selected="${(selectedGuest.kidsMax eq 0) ? 'selected' : ''}"/>
				        		<form:option value="1" label="1" selected="${(selectedGuest.kidsMax eq 1) ? 'selected' : ''}" />
				        		<form:option value="2" label="2" selected="${(selectedGuest.kidsMax eq 2) ? 'selected' : ''}"/>
				        		<form:option value="3" label="3" selected="${(selectedGuest.kidsMax eq 3) ? 'selected' : ''}" />
				        		<form:option value="4" label="4" selected="${(selectedGuest.kidsMax eq 4) ? 'selected' : ''}"/>
							</form:select>
					<br>
					
					<span>Group: </span>
					<form:input path="company" value="${selectedGuest.company}"/>
					
					<br>
					<span>Notes: </span>
					<form:input path="notes" value="${selectedGuest.notes}"/>
					<br>
					<span><input type="submit" value="Save"/></span>
				</form:form>
				<br>
				<!-- Edit Plus Ones -->
				<h2>Edit Plus Ones Information</h2>
				<form:form method="post" action="editPlusOnes" modelAttribute="plusOnesForm">
					<c:forEach items="${plusOnesList.plusOnes}" var="person" varStatus="status">
						<input type="hidden" name="plusOnes[${status.index}].guestPlusOneId" value="${person.guestPlusOneId}"/>
						<label>Name: </label>
						<input name="plusOnes[${status.index}].fullName" value="${person.fullName}"/>
						<label>Meal Choice: </label>
						<select name="plusOnes[${status.index}].mealChoice">
							<c:forEach items="${meals}" var="meal">
								<option value="${meal}" ${person.mealChoice eq meal ? 'selected': ''}>${meal}</option>
							</c:forEach>	
						</select>
						<br>
					</c:forEach>
					<span><input type="submit" value="Save"/></span>
				</form:form>
			</div>
			<div id="addGuestSection" style="display:none;">
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
				
				<span>Plus ones (Maximum): </span> <br/>
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
						<option value="0">No Reply</option>
			  			<option value="1">Present</option>
			  			<option value="2">Absent</option>
					</form:select>
				<br>
				
				<span>Group: </span>
				<form:input path="company" value=""/>
				
				<br>
				<span>Notes: </span>
				<form:input path="notes" value=""/>
				<br/>
				<!-- TODO: Set value attr to eventId that's in the session scope -->
				<form:hidden path="eventId" value="1"/>
				<span><input type="submit" value="Done"/></span>
			</form:form>
			</div>
		</div>
	</div>
</div>
<!-- Script to make rows clickable -->
<script src="resources/js/guestMgmt.js"></script>
<jsp:include page="/WEB-INF/includes/footer.jsp"/>