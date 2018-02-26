<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!-- Change feature variable -->
<%! String feature = "Guests" ;%>

<% session.setAttribute("feature", feature); %>
<% session.setAttribute("title", "KIKAKUYA - " + feature); %>
<jsp:include page="/WEB-INF/includes/head.jsp" />
<jsp:include page="/WEB-INF/includes/header.jsp"/>
<jsp:include page="/WEB-INF/includes/menu.jsp"/>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-6">
					<h2   onclick="openShowGuest()">Guest List</h2>
				</div>
				<div class="col-6 text-right">
					<button id="showAddGuest"  type="button" class="btn btn-link img-fluid" onclick="openAddGuest()">
      					<span class="material-icons" style="background-color: #F1E9DA; color: #D90368; font-size: 300%;">add_circle</span>
   					</button>  					
   				</div>
   			</div>
   			<div class="row">
   				<div class="col-10 text-right">
					<span class="present"><i class="fas fa-check-circle"></i></span>&nbsp;Accepted&emsp;
					<span class="absent"><i class="fas fa-times-circle"></i></span>&nbsp;Declined&emsp;
					<span class="noReply"><i class="fas fa-exclamation-circle"></i></span>&nbsp;No Reply&emsp;
				</div>
   			</div><br>
			<div class="row col-12">
				<div class="table-responsive">
					<table id="guests" class="table table-hover">
						<thead>
							<tr>
								<th scope="col">
									<div class="col-md-6">
										First Name
									</div>
									<div class="col-md-6">
										<button id="btnAscFName" type="button" class="btn btn-link" style="background-color: #F1E9DA; color: #D90368;" onclick="ascFirstName()">
											<i class="fas fa-sort-alpha-down"></i>
										</button>
										<button id="btnDescFName" type="button" class="btn btn-link" style="background-color: #F1E9DA; color: #D90368;" onclick="descFirstName()">
											<i class="fas fa-sort-alpha-up"></i>
										</button>
									</div>
								</th>
								<th scope="col">
									<div class="col-md-6">
										Last Name
									</div>
									<div class="col-md-6">
										<button id="btnAscLName" type="button" class="btn btn-link" style="background-color: #F1E9DA; color: #D90368;" onclick="ascLastName()">
											<i class="fas fa-sort-alpha-down"></i>
										</button>
										<button id="btnDescLName" type="button" class="btn btn-link" style="background-color: #F1E9DA; color: #D90368;" onclick="descLastName()">
											<i class="fas fa-sort-alpha-up"></i>
										</button>
									</div>
								</th>
								<th scope="col" class="align-baseline">
									<div class="col-md-6">
										Plus Ones&nbsp;
										<a href="#" data-toggle="tooltip" data-placement="right" title="People accompanying the invited guest">
											<span class="info"><i class="fas fa-info-circle"></i></span>
										</a>
									</div>
									<div class="col-md-6">
									</div>
								</th>
								<th scope="col">
									<div class="col-md-6">
										RSVP Status
									</div>
									<div class="col-md-6">
										<button type="button" class="btn btn-link" style="background-color: #F1E9DA; color: #D90368; padding:6px 14px;" onclick="ascStatus()">
											<i class="fas fa-sort-up"></i>
										</button>
										<button type="button" class="btn btn-link" style="background-color: #F1E9DA; color: #D90368; padding:6px 14px" onclick="descStatus()">
											<i class="fas fa-sort-down"></i>
										</button>
									</div>
								</th>
								<!-- Load all guests for the selected event -->
							</tr>
						</thead>
						<tbody  onclick="openShowGuest()">
							<c:forEach items="${guests}" var="guest" >
								<tr class="selectGuest">
									<td scope="row">${guest.firstName}</td>
									<td>${guest.lastName}</td>
									<td>Adults: ${guest.adultsWith}&nbsp;&nbsp;&nbsp;Kids: ${guest.kidsWith}</td>
									<td><c:choose>
						  					<c:when test="${guest.isPresent eq 0? true : false}"><span class="noReply"><i class="fas fa-exclamation-circle"></i></span></c:when>
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
			</div>
			<br>
			</div>



			<div class="col-md-4">
				<!--  <div id="showGuestSection" style="display:${selectedGuest == null? 'none':'inline-block'}">-->
				<div id="showGuestSection" class="sidenav"  style="width:${selectedGuest == null? '0':'360px'}">
				<div class="guestFormPad">
					<!-- Show guest -->
					<div id="guestDetails">
						<span onclick="editGuest(); return false"><i class="fas fa-edit"></i></span>
						<span onclick="closeShowGuest()" class="closebtn"><i class="fas fa-times"></i></span>
						<h2>${selectedGuest.firstName} ${selectedGuest.lastName}</h2>
						<div>Email: ${selectedGuest.email}</div>
						<div>plus One (Maximum):</div>
						<div>Adults: ${selectedGuest.adultsMax}</div>
						<div>Kids: ${selectedGuest.kidsMax}</div>				
						<div>Group: ${selectedGuest.company}</div>
						<div>Notes: ${selectedGuest.notes}</div>
						<br>
						<h5><i>RSVP</i></h5>
						<div>RSVP Status: ${selectedGuest.isPresent}</div>
						<div>Meal Choice: ${selectedGuest.mealChoice}</div>
						<div>Kids With: ${selectedGuest.kidsWith}&nbsp;&nbsp;Adults With: ${selectedGuest.adultsWith}</div>
						<div>Special Requests: ${selectedGuest.specialRequests}</div>
						<br>
						<h5><i>Plus Ones&nbsp;<a href="#" data-toggle="tooltip" data-placement="right" title="People accompanying the invited guest">
							<span class="info"><i class="fas fa-info-circle"></i></span>
						</a></i></h5>
						
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
				</div>
			<br>
			
			
			
			<div id="editGuestSection" style="display:none">
				<span onclick="closeAll(); return false"><i class="fas fa-times"></i></span>
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
					<span>Plus ones <a href="#" data-toggle="tooltip" data-placement="right" title="People accompanying the invited guest">
						<span class="info"><i class="fas fa-info-circle"></i></span>
					</a>(Maximum):</span>
					<br/>
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
			
			
			<div id="addGuestSection" class="sidenav" >
			<div class="guestFormPad">
			<span id="closeAddGuest" class="closebtn" onclick="closeAddGuest()"><i class="fas fa-times"></i></span>
			<!-- Add guest -->
			<h2>Add Guest</h2>
			<form:form id="addGuest" action="addGuest" method="post" modelAttribute="guest">
				<label>First Name: </label>
				<form:input path="firstName" class="form-control" style="margin-bottom:10px;"/>				
				<label>Last Name: </label>
				<form:input path="lastName" class="form-control" style="margin-bottom:10px;"/>
				<label>Email: </label>
				<form:input path="email" class="form-control" style="margin-bottom:10px;"/>
				<label>
					Plus ones
					<a href="#" data-toggle="tooltip" data-placement="right" title="People accompanying the invited guest">
						<span class="info">
							<i class="fas fa-info-circle"></i>
						</span>
					</a>
					(Maximum):
				</label>
				<div class="form-group row">
					<div class="col-6">
						<div class="form-group row">
							<label class="col-6 col-form-label">Adults:</label>
					        	<form:select path="adultsMax" class="form-control col-6">
					        		<form:option value="0" label="0" selected="selected"/>
					        		<form:option value="1" label="1"/>
					        		<form:option value="2" label="2"/>
					        		<form:option value="3" label="3"/>
					        		<form:option value="4" label="4"/>
								</form:select>
						</div>
					</div>
					<div class="col-6">
						<div class="form-group row">
					        <label class="col-6 col-form-label">Kids:</label>
					        	<form:select path="kidsMax" class="form-control col-6">
					        		<form:option value="0" label="0" selected="selected"/>
					        		<form:option value="1" label="1"/>
					        		<form:option value="2" label="2"/>
					        		<form:option value="3" label="3"/>
					        		<form:option value="4" label="4"/>
								</form:select>
							</div>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-6">RSVP Status: </label>
						<form:select path="isPresent" class="form-control col-6">
							<option value="0">No Reply</option>
				  			<option value="1">Present</option>
				  			<option value="2">Absent</option>
						</form:select>
				</div>
				<label>Group: </label>
				<form:input path="company" class="form-control" style="margin-bottom:10px;"/>
				<label>Notes: </label>
				<form:input path="notes" value="" class="form-control" style="margin-bottom:10px;"/>

				<!-- TODO: Set value attr to eventId that's in the session scope -->
				<form:hidden path="eventId" value="1"/>
				<button id="btnAddGuestDone" type="submit" class="btn btn-info">Done</button>
			</form:form>
			
			</div>
		</div>
		</div>
	</div>


<!-- test
	<div id="mySidenav" class="sidenav">
	  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
	  <a href="#">About</a>
	  <a href="#">Services</a>
	  <a href="#">Clients</a>
	  <a href="#">Contact</a>
	</div>
	
	<span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; open</span><br>
 -->		
</div>


<!-- Script to make rows clickable -->
<script src="resources/js/guestMgmt.js"></script>
<script>
//open side form
function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
}

function openAddGuest() {
    document.getElementById("addGuestSection").style.width = "360px";
}

function openShowGuest() {
    document.getElementById("showGuestSection").style.width = "360px";
}

//close side form
function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}

function closeAddGuest() {
    document.getElementById("addGuestSection").style.width = "0";
}

function closeShowGuest() {
    document.getElementById("showGuestSection").style.width = "0";
}
</script>
<script>
// Add guest slider
/*
var addGuest = document.getElementById( 'addGuestSection' ),
body = document.body;

(showAddGuest.onclick) = function() {
classie.toggle( this, 'active' );
classie.toggle( addGuest, 'cbp-spmenu-open' );
disableOther( 'showAddGuest' );
};

(closeAddGuest.onclick) = function() {
	classie.toggle( this, 'active' );
	classie.toggle( addGuest, 'cbp-spmenu-open' );
	disableOther( 'showAddGuest' );
	};

$(document).ready(function(){
	$('[data-toggle="tooltip"]').tooltip();   
});*/
/*
function disableOther( button ) {
if( button !== 'showRight' ) {
classie.toggle( showRight, 'disabled' );
}
}
*/


//add guest clear form when it is submited
/*
$("#showAddGuest").click(function() {
	$("input[type=text], textarea").val("");
	$("select").val("0");
});
*/
</script>

<jsp:include page="/WEB-INF/includes/footer.jsp"/>