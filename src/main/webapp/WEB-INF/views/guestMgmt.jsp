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
				<div class="col-sm-3">
					<div class="${(editGuestSuccess != null) ? 'successAlert':''}">${editGuestSuccess}</div>	
					<div class="${(editGuestError != null) ? 'errorAlert':''}">${editGuestError}</div>
					<span  style="width: 150px; margin:0; font-size:200%;">Guest List</span>
					<div class="text-right  float-right  d-block d-sm-none" >
						<button  type="button" class="btn btn-link img-fluid showAddGuest" onclick="openAddGuest()">
	      					<span class="material-icons" style="background-color: #F1E9DA; color: #D90368; font-size: 300%;">add_circle</span>
	   					</button>  					
   					</div>
				</div>
				
				<div class="col-sm-8 text-right">
					<br>
					<span class="present"><i class="fas fa-check-circle"></i></span>&nbsp;Accepted&emsp;
					<span class="absent"><i class="fas fa-times-circle"></i></span>&nbsp;Declined&emsp;
					<span class="noReply"><i class="fas fa-exclamation-circle"></i></span>&nbsp;No Reply&emsp;
				</div>
				<div class="col-sm-1 d-none d-sm-block">
					<button type="button" class="btn btn-link img-fluid showAddGuest" onclick="openAddGuest()">
      					<span class="material-icons" style="background-color: #F1E9DA; color: #D90368; font-size: 300%;">add_circle</span>
   					</button>  					
   				</div>
   			</div>

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
									<div class="col-md-8">
										Plus Ones&nbsp;
										<a href="#" data-toggle="tooltip" data-placement="right" title="People accompanying the invited guest">
											<span class="info"><i class="fas fa-question-circle"></i></span>
										</a>
									</div>
									<div class="col-md-8">
									</div>
								</th>
								<th scope="col">
									<div class="col-md-8">
										RSVP Status
									</div>
									<div class="col-md-8">
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
								<tr class="selectGuest" id="guestId${guest.guestId}">
									<td scope="row">${guest.firstName}</td>
									<td>${guest.lastName}</td>
									<td>Adults: ${guest.adultsWith}&nbsp;&nbsp;&nbsp;Kids: ${guest.kidsWith}</td>
									<td><c:choose>
											<c:when test="${guest.isPresent eq 0? true : false}"><span class="present"><i class="fas fa-check-circle" style="margin-left: 50px"></i></span></c:when>
						  					<c:when test="${guest.isPresent eq 1? true : false}"><span class="noReply"><i class="fas fa-exclamation-circle" style="margin-left: 50px"></i></span></c:when>		
						  					<c:otherwise><span class="absent"><i class="fas fa-times-circle" style="margin-left: 50px"></i></span></c:otherwise>
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
						<span onclick="openEditGuest(${selectedGuest.guestId})"><i class="fas fa-edit"></i></span>
						<span onclick="closeShowGuest()" class="closebtn"><i class="fas fa-times"></i></span>
						<h2>${selectedGuest.firstName} ${selectedGuest.lastName}</h2>
						<label>Email:</label>
						<input type="text" value="${selectedGuest.email}" class="form-control" style="margin-bottom:10px;"disabled>
						<label>Plus One (Maximum):</label>
						<div class="row">
							<div class="col-3">
								<label>Adults:</label> 
							</div>
							<div class="col-3">	
								${selectedGuest.adultsMax}
							</div>
							<div class="col-3">
								<label>Kids:</label> 
							</div>
							<div class="col-3">
								${selectedGuest.kidsMax}
							</div>
						</div>				
						<label>Group:</label>
						<input type="text" value="${selectedGuest.company}" class="form-control" style="margin-bottom:10px;"disabled>
						<label>Notes:</label>
						<textarea class="form-control" rows="5" disabled>${selectedGuest.notes}</textarea>
						<hr>
						<h5><i>RSVP</i></h5>
						<div class="row">
							<div class="col-6">
								<label>RSVP Status:</label>
							</div>
							<div class="col-6">
								<!-- TODO: Check selectedGuest.isPresent value -->
								<c:choose>
						  			<c:when test="${selectedGuest.isPresent eq 1? true : false}">No Reply</c:when>
						  			<c:when test="${selectedGuest.isPresent eq 0? true : false}">Accepted</c:when>
						  			<c:otherwise>Declined</c:otherwise>
								</c:choose>
						 	</div>
						</div>
						<div class="row">
							<div class="col-6">
								<label>Meal Choice:</label>
							</div>
							<div class="col-6">
							 	${selectedGuest.mealChoice eq 'null'? '': selectedGuest.mealChoice}
							</div>
						</div>
						<label>Plus Ones:</label>
						<div class="row">
							<div class="col-3">
								<label>Kids: </label>
							</div>
							<div class="col-3">
								${selectedGuest.kidsWith}
							</div>
							<div class="col-3">
								<label>Adults: </label>
							</div>
							<div class="col-3">
								${selectedGuest.adultsWith}
							</div>
						</div>
						<label>Special Requests:</label>
						<div> ${selectedGuest.specialRequests}</div>
						<hr>
						<h5><i>Plus Ones&nbsp;<a href="#" data-toggle="tooltip" data-placement="top" title="People accompanying the invited guest">
							<span class="info"><i class="fas fa-question-circle"></i></span>
						</a></i></h5>
						<div class="row">
							<div class="col-3">
								<label>Adults: </label>
							</div>	
							<div class="col-9">
								<c:forEach items="${plusOnesList.plusOnes}" var="person" >
									<c:if test="${person.category == 'Adult'}">
										<div>Name:<b> ${person.fullName}</b><br>MealChoice:<b> ${person.mealChoice}</b></div>
										<hr>
									</c:if>
								</c:forEach>
							</div>
						</div>
						<div class="row">
							<div class="col-3">
								<label>Kids: </label>
							</div>
							<div class="col-9">
								<c:forEach items="${plusOnesList.plusOnes}" var="person" >
									<c:if test="${person.category == 'Kid'}">
										<div>Name:<b> ${person.fullName}</b><br>Meal Choice: <b>${person.mealChoice}</b></div>
										<hr>
									</c:if>
								</c:forEach>
							</div>
						</div>
						<hr>
						<form:form id ="deleteGuestForm" action="deleteGuest" method="post" class="text-center" onclick="deleteGuest()">
							<input name="token" type="hidden" value="${selectedGuest.guestId}"/>
							<button type="submit" class="btn btn-info" style="background-color: #D90368; color: #F1E9DA; border: none;">
      							<span class="material-icons align-bottom" style="font-size: 150%;">remove_circle</span><span class="align-text-bottom">Remove Guest</span>
   							</button>
						</form:form>
					</div>
					<br>
				</div>
				</div>
			<br>
			
			
			
			<div id="editGuestSection" class="sidenav" style="display:none; width:360px">
			<div class="guestFormPad">
				<span onclick="closeEditGuest()" class="closebtn"><i class="fas fa-times"></i></span>
				<!-- Edit Guest -->
				<div id="guestSuccess" class="successAlert"></div>
				<h2>Edit Guest</h2>
				<form:form id="editGuest" action="editGuest" method="post" modelAttribute="guest" onsubmit="return validateEditForm();">
					<form:hidden path="guestId" value="${selectedGuest.guestId}"/>
					<label>First Name:</label>
					<form:input path="firstName" value="${selectedGuest.firstName}"  class="editfName form-control" oninput="editFirstName()" style="margin-bottom:10px;"/>
						<span id="fNameEdit" class="formError"></span> <br/>
					<label>Last Name: </label>
					<form:input path="lastName" value="${selectedGuest.lastName}" class="editlName form-control" oninput="editLastName()" style="margin-bottom:10px;"/>
						<span id="lNameEdit" class="formError"></span> <br/>
					<label>Email: </label>
					<form:input path="email" value="${selectedGuest.email}" class="editEmailAdd form-control" oninput="editEmailAddress()" style="margin-bottom:10px;"/>
						<span id="editEmailError" class="formError"></span> <br/>
					<div class="form-group row">
						<div class="col-6">
							<label>RSVP Status: </label>
						</div>
						<div class="col-6">
							<form:select path="isPresent" class="form-control" style="margin-bottom:10px;">
								<c:choose>
						  			<c:when test="${selectedGuest.isPresent eq 0}">
						  				<form:option value="0" label="Accepted" selected="selected"/>
						  				<form:option value="1" label="No Reply"/>
						  				<form:option value="2" label="Declined" />
						  			</c:when>
						  			<c:when test="${selectedGuest.isPresent eq 1}">
						  				<form:option value="0" label="Accepted" />
						  				<form:option value="1" label="No Reply" selected="selected"/>
						  				<form:option value="2" label="Declined" />
						  			</c:when>
						  			<c:otherwise>
						  				<form:option value="0" label="Accepted" />
						  				<form:option value="1" label="No Reply" />
						  				<form:option value="2" label="Declined" selected="selected"/>
						  			</c:otherwise>
						  		</c:choose>
							</form:select>
						</div>
					</div>
					<div class="form-group row">
						<div class="col-6">
							<label>Meal Choice <a class="rsvpMealChoiceMsg" href="#" data-toggle="tooltip" data-placement="top" title="Keep in mind that you must send the RSVPs for this event before selecting a meal choice."><span class="info"><i class="fas fa-question-circle"></i></span></a> :</label>
						</div>
						<div class="col-6">
							<form:select id="guestMealChoice" path="mealChoice" class="form-control" style="margin-bottom:10px;">
								
							</form:select>
						</div>
					</div>
					<label>Plus ones <a href="#" data-toggle="tooltip" data-placement="top" title="This is the maximum number of plus ones the guest can RSVP to. You cannot change this value to a number smaller than the number of plus ones already registered.">
						<span class="info"><i class="fas fa-question-circle"></i></span>
					</a>(Maximum):</label>
					<div class="form-group row">
						<div class="col-6">
							<div class="form-group row">
								<label class="col-6 col-form-label">Adults:</label>					
						       	<form:select id="editAdultsMax" path="adultsMax" class="form-control col-6">
						       		<%-- <form:option value="0" label="0" selected="${(selectedGuest.adultsMax eq 0) ? 'selected' : ''}"/>
						       		<form:option value="1" label="1" selected="${(selectedGuest.adultsMax eq 1) ? 'selected' : ''}"/>
						       		<form:option value="2" label="2" selected="${(selectedGuest.adultsMax eq 2) ? 'selected' : ''}"/>
					        		<form:option value="3" label="3" selected="${(selectedGuest.adultsMax eq 3) ? 'selected' : ''}"/>
					        		<form:option value="4" label="4" selected="${(selectedGuest.adultsMax eq 4) ? 'selected' : ''}"/> --%>
								</form:select>
							</div>
						</div>
						<div class="col-6">	
							<div class="form-group row">
						        <label class="col-6 col-form-label">Kids:</label>
					        	<form:select id="editKidsMax" path="kidsMax"  class="form-control col-6">
					        		
								</form:select>
							</div>
						</div>
					</div>
					<label>Group: </label>
					<form:input path="company" value="${selectedGuest.company}" class="form-control" style="margin-bottom:10px;"/>
					<label>Notes: </label>
					<textarea name="notes" id="notes" cols="5" class="form-control" style="margin-bottom:10px;"> ${selectedGuest.notes}</textarea>
					<div class="text-right">
						<button type="submit" class="btn btn-info">
	      					Save
	   					</button>
   					</div>
   					<hr>
				</form:form>
				<br>
				<div id="editPlusOnes">
					<div id="plusOnesSuccess" class="successAlert"></div>
					<h2>Edit Plus Ones <sup><a href="#" data-toggle="tooltip" data-placement="top" title="To change the number of plus ones, please change the maximum number of adults and kids this guest can bring with them in the form above."><span class="info"><i class="fas fa-question-circle"></i></span></a></sup></h2>					
					<div id="plusOnesDiv">
						<h4 id="plusOnesAdultsLabel">Adults:</h4>
						<div id="plusOnesAdults"></div>
						<br>
						<h4 id="plusOnesKidsLabel">Kids:</h4>
						<div id="plusOnesKids"></div>
					</div>
						
					<div class="text-right">
						<button onclick="editPlusOnes(${selectedGuest.guestId})" class="btn btn-info">
		     				Save
		   				</button>
	   				</div>
	   			</div>

 			</div>
			</div>
			
			
			<div id="addGuestSection" class="sidenav" >
			<div class="guestFormPad">
			<span id="closeAddGuest" class="closebtn" onclick="closeAddGuest()"><i class="fas fa-times"></i></span>
			<!-- Add guest -->
			<h2>Add Guest</h2>
			<form:form id="addGuest" action="addGuest" method="post" modelAttribute="guest" onsubmit="return validateGuestForm();">
				<label>First Name<span style="font-size:22px;color:red">*</span>: </label>
				<form:input path="firstName" class="fName form-control" oninput="validateFirstName()" style="margin-bottom:10px;" maxlength="20"/>				
					<span id="fNameError" class="formError"></span> <br/>
				<label>Last Name<span style="font-size:22px;color:red">*</span>: </label>
				<form:input path="lastName" class="lName form-control" oninput="validateLastName()" style="margin-bottom:10px;" maxlength="20"/>
					<span id="lNameError" class="formError"></span> <br/>
				<label>Email<span style="font-size:22px;color:red">*</span>: </label>
				<form:input path="email" class="guestEmail form-control" style="margin-bottom:10px;" oninput="validateEmail()"/>
					<span id=emailError class="formError"></span> <br/>
				<label>
					Plus ones
					<a href="#" data-toggle="tooltip" data-placement="top" title="People accompanying the invited guest">
						<span class="info">
							<i class="fas fa-question-circle"></i>
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
						<!-- TODO: No Reply cannot be default -->
						<form:select path="isPresent" class="form-control col-6">			
				  			<form:option value="0" label="Accepted" />
						  	<form:option value="1" label="No Reply" selected="selected"/>
						  	<form:option value="2" label="Declined" />
						</form:select>
				</div>
				<label>Group: </label>
				<form:input path="company" class="form-control" style="margin-bottom:10px;"/>
				<label>Notes: </label>
				<form:textarea path="notes" row="5" value="" class="form-control" style="margin-bottom:10px;"/>

				<!-- TODO: Set value attr to eventId that's in the session scope -->
				<form:hidden path="eventId" value="1"/>
				<button id="btnAddGuestDone" type="submit" class="btn btn-info">Done</button>
			</form:form>
			
			</div>
		</div>
		</div>
	</div>
</div>

<script src="resources/js/guestMgmt.js"></script>
<script src="resources/js/validateGuest.js"></script>
<script src="resources/js/validateGuestPlusOne.js"></script>
<jsp:include page="/WEB-INF/includes/footer.jsp"/>