<!-- Change feature variable -->
<%! String feature = "RSVP Response" ;%>

<% session.setAttribute("feature", feature); %>
<% session.setAttribute("title", "KIKAKUYA - " + feature); %>
<jsp:include page="/WEB-INF/includes/head.jsp" />
<jsp:include page="/WEB-INF/includes/header-rsvp-response.jsp"/>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<script src="resources/js/validateRSVPResponse.js"></script>
<script src="resources/js/rsvpResponse.js"></script>

<div class="container"><!-- body contents start -->
	<div>
		<div class="${(respondRSVPError != null) ? 'errorAlert':''}" role="alert">${sendRSVPError}</div>
	</div>
	<div id="errorResponse" class="plusOneError errorAlert" style="display:none;"><span class="material-icons align-bottom" style="font-size: 150%;">error</span>&emsp;Please provide missing information</div>
	<h4 class="text-center">The favor of reply is required by <b>${email.replyDue}</b></h4>
	<h1 class="text-center">${guest.firstName} ${guest.lastName}</h1>
	<form:form id="responseForm" action="sendRsvpResponse" method="post" modelAttribute="guest"><!-- onsubmit="return validateResponseForm();"> -->
	  	<form:hidden value="${token}" path="token" />
	  	<form:hidden value="${guest.guestId}" path="guestId" />
	  	<c:forEach items="${adults}" var="adult">
	  		<input type="hidden" value="${adult.fullName}" class="adults"/>
	  	</c:forEach>
	  	<c:forEach items="${kids}" var="kid">
	  		<input type="hidden" value="${kid.fullName}" class="kids"/>
	  	</c:forEach>
	
		<div class="form-group row">
		  	<label class="radio-inline text-center col-sm-6">
		  		<h4><form:radiobutton name="attendance" id="attend" value="0" path="isPresent" required="true" checked="true"/>Happily attend!</h4>
		  	</label>
		  	<label class="radio-inline text-center col-sm-6">
		  		<h4><form:radiobutton name="attendance" id="absent" value="2" path="isPresent" />Sadly decline...</h4>
		  	</label>
		</div>
		  	
		<div class="form-group row toHide toShow" >
			<div class="col-sm-4">
				<h5>Number of people in your party</h5>
				<p>*not including you</p>
			</div>
	   		<label for="adult" class="col-form-label col-sm-2 text-sm-right toShow">Adults:</label>
	   		<div class="col-sm-2">
		    	<form:select class="form-control" id="adult" path="adultsWith" onChange="show(this)">
		    	<c:forEach begin="0" end="${guest.adultsMax}" varStatus="loop">
		       		<option value="${loop.index}">${loop.index}</option>
		       	</c:forEach>
		    	</form:select>
		    </div>
	   		<label for="kid" class="col-form-label col-sm-2 text-sm-right toShow">Kids:</label>
	   		<div class="col-sm-2">
	      		<form:select class="form-control" id="kid" path="kidsWith">
	        	<c:forEach begin="0" end="${guest.kidsMax}" varStatus="loop">
		       		<option value="${loop.index}">${loop.index}</option>
		       	</c:forEach>
	      		</form:select>
	      	</div>
		</div>
				
				
		<div class="form-group" >
		<c:choose>
			<c:when test="${(not empty email.mealChoiceBeef) || (not empty email.mealChoicePork) || (not empty email.mealChoiceChicken) || (not empty email.mealChoiceVeg) || (not empty email.mealChoiceFish) || (not empty email.mealChoiceKids)}">
				<h5 class="toHide toShow">Please indicate name and a meal choice</h5>
			</c:when>
			<c:otherwise>
				<h5 class="toHide toShow">Please indicate name</h5>
			</c:otherwise>
		</c:choose>
		
		
			<!-- meal choice for guest -->
			<div class="row toHide toShow">
				<div class="col-sm-1"></div>
				<div class="col-sm-6">
    				<label for="guestName" class="sr-only">Guest Name</label>
    				<form:input type="text" id="guestName" class="form-control" value="${guest.firstName} ${guest.lastName}" path="${firstName}" oninput="validateGuest(this)"/>
    				<span id="mainGuestError" class="plusOneError formError" style='font-size: 14px; text-align:left; display:none;'><i class='fas fa-times'></i>  Please enter name</span>
    			</div>
    			
    			<c:if test="${(not empty email.mealChoiceBeef) || (not empty email.mealChoicePork) || (not empty email.mealChoiceChicken) || (not empty email.mealChoiceVeg) || (not empty email.mealChoiceFish) || (not empty email.mealChoiceKids)}">
    			<div class="col-sm-5">
    				<form:select class="custom-select mb-2 mr-sm-2 mb-sm-0 meal" id="guestMeal" path="mealChoice" onchange="validateMeal(this)">
    					<option value="" disabled="disabled" selected>---Select a meal---</option>
    					<c:if test="${not empty email.mealChoiceBeef}">
    						<option value="${email.mealChoiceBeef}">${email.mealChoiceBeef}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoicePork}">
    						<option value="${email.mealChoicePork}">${email.mealChoicePork}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoiceChicken}">
    						<option value="${email.mealChoiceChicken}">${email.mealChoiceChicken}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoiceVeg}">
    						<option value="${email.mealChoiceVeg}">${email.mealChoiceVeg}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoiceFish}">
    						<option value="${email.mealChoiceFish}">${email.mealChoiceFish}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoiceKids}">
    						<option value="${email.mealChoiceKids}">${email.mealChoiceKids}</option>
    					</c:if>
  					</form:select>
  					<span id="guestMealError" class="mealError formError" style='font-size: 14px; text-align:left; display:none;'><i class='fas fa-times'></i>  Please select a meal</span>
    			</div>
    			</c:if>
    		</div>
    		
    			
    		<!-- meal choice for Adult +1 -->
    		<div class="row toHide plusOnes" id="adult1" style="display: none">
    			<div class="col-sm-1 text-right" style="padding:0; margin:0;">
    				<span id="closeAdult1" class="closebtn" style="font-size:11px"><i class="fas fa-times"></i></span>
    			</div>
				<div class="col-sm-6">
    				<label for="+1" class="sr-only">Guest +1 Name</label>
     				<form:input type="text" id="adultName1" class="form-control plus" placeholder="Enter Adult 1" path="plusOneList[0].fullName" oninput="validateGuest(this)"/>
      				<span id="adult1Error" class="plusOneError formError" style='font-size: 14px; text-align:left; display:none;'><i class='fas fa-times'></i>  Please enter name</span>
      			</div>
      			<c:if test="${(not empty email.mealChoiceBeef) || (not empty email.mealChoicePork) || (not empty email.mealChoiceChicken) || (not empty email.mealChoiceVeg) || (not empty email.mealChoiceFish) || (not empty email.mealChoiceKids)}">
      			<div class="col-sm-5">
      				<form:select class="custom-select mb-2 mr-sm-2 mb-sm-0 meal" id="adultMeal1" path="plusOneList[0].mealChoice" onchange="validateMeal(this)">
    					<option value="" disabled="disabled" selected>---Select a meal---</option>
    					<c:if test="${not empty email.mealChoiceBeef}">
    						<option value="${email.mealChoiceBeef}">${email.mealChoiceBeef}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoicePork}">
    						<option value="${email.mealChoicePork}">${email.mealChoicePork}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoiceChicken}">
    						<option value="${email.mealChoiceChicken}">${email.mealChoiceChicken}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoiceVeg}">
    						<option value="${email.mealChoiceVeg}">${email.mealChoiceVeg}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoiceFish}">
    						<option value="${email.mealChoiceFish}">${email.mealChoiceFish}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoiceKids}">
    						<option value="${email.mealChoiceKids}">${email.mealChoiceKids}</option>
    					</c:if>
  					</form:select>
  					<span id="adult1MealError" class="mealError formError" style='font-size: 14px; text-align:left; display:none;'><i class='fas fa-times'></i>  Please select a meal</span>
      			</div>
      			</c:if>
      			<form:hidden class="form-control" id="category" value="Adult" path="plusOneList[0].category" />
       		</div>
			
			<!-- meal choice for Adult +2 -->
    		<div class="row toHide plusOnes" id="adult2" style="display: none">
    			<div class="col-sm-1 text-right" style="padding:0; margin:0;">
    				<span id="closeAdult2" class="closebtn" style="font-size:11px"><i class="fas fa-times"></i></span>
    			</div>
				<div class="col-sm-6">
    				<label for="+1" class="sr-only">Guest +1 Name</label>
     				<form:input type="text" id="adultName2" class="form-control plus" placeholder = "Enter Adult 2" path="plusOneList[1].fullName" oninput="validateGuest(this)"/>
      				<span id="adult2Error" class="plusOneError formError" style='font-size: 14px; text-align:left; display:none;'><i class='fas fa-times'></i>  Please enter name</span>
      			</div>
      			<c:if test="${(not empty email.mealChoiceBeef) || (not empty email.mealChoicePork) || (not empty email.mealChoiceChicken) || (not empty email.mealChoiceVeg) || (not empty email.mealChoiceFish) || (not empty email.mealChoiceKids)}">
      			<div class="col-sm-5">
      				<form:select class="custom-select mb-2 mr-sm-2 mb-sm-0 meal" id="adultMeal2" path="plusOneList[1].mealChoice" onchange="validateMeal(this)">
    					<option value="" disabled="disabled" selected>---Select a meal---</option>
    					<c:if test="${not empty email.mealChoiceBeef}">
    						<option value="${email.mealChoiceBeef}">${email.mealChoiceBeef}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoicePork}">
    						<option value="${email.mealChoicePork}">${email.mealChoicePork}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoiceChicken}">
    						<option value="${email.mealChoiceChicken}">${email.mealChoiceChicken}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoiceVeg}">
    						<option value="${email.mealChoiceVeg}">${email.mealChoiceVeg}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoiceFish}">
    						<option value="${email.mealChoiceFish}">${email.mealChoiceFish}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoiceKids}">
    						<option value="${email.mealChoiceKids}">${email.mealChoiceKids}</option>
    					</c:if>
  					</form:select>
  					<span id="adult2MealError" class="mealError formError" style='font-size: 14px; text-align:left; display:none;'><i class='fas fa-times'></i>  Please select a meal</span>
      			</div>
      			</c:if>
      			<form:hidden class="form-control" id="category" value="Adult" path="plusOneList[1].category" />
    		</div>
    		
    		<!-- meal choice for Adult +3 -->
    		<div class="row toHide plusOnes" id="adult3" style="display: none">
    			<div class="col-sm-1 text-right" style="padding:0; margin:0;">
    				<span id="closeAdult3" class="closebtn" style="font-size:11px"><i class="fas fa-times"></i></span>
    			</div>
				<div class="col-sm-6">
    				<label for="+1" class="sr-only">Guest +1 Name</label>
     				<form:input type="text" id="adultName3" class="form-control plus" placeholder="Enter Adult 3" path="plusOneList[2].fullName" oninput="validateGuest(this)"/>
     				<span id="adult3Error" class="plusOneError formError" style='font-size: 14px; text-align:left; display:none;'><i class='fas fa-times'></i>  Please enter name</span>
      			</div>
      			<c:if test="${(not empty email.mealChoiceBeef) || (not empty email.mealChoicePork) || (not empty email.mealChoiceChicken) || (not empty email.mealChoiceVeg) || (not empty email.mealChoiceFish) || (not empty email.mealChoiceKids)}">
      			<div class="col-sm-5">
      				<form:select class="custom-select mb-2 mr-sm-2 mb-sm-0 meal" id="adultMeal3" path="plusOneList[2].mealChoice" onchange="validateMeal(this)">
    					<option value="" disabled="disabled" selected>---Select a meal---</option>
    					<c:if test="${not empty email.mealChoiceBeef}">
    						<option value="${email.mealChoiceBeef}">${email.mealChoiceBeef}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoicePork}">
    						<option value="${email.mealChoicePork}">${email.mealChoicePork}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoiceChicken}">
    						<option value="${email.mealChoiceChicken}">${email.mealChoiceChicken}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoiceVeg}">
    						<option value="${email.mealChoiceVeg}">${email.mealChoiceVeg}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoiceFish}">
    						<option value="${email.mealChoiceFish}">${email.mealChoiceFish}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoiceKids}">
    						<option value="${email.mealChoiceKids}">${email.mealChoiceKids}</option>
    					</c:if>
  					</form:select>
  					<span id="adult3MealError" class="mealError formError" style='font-size: 14px; text-align:left; display:none;'><i class='fas fa-times'></i>  Please select a meal</span>
      			</div>
      			</c:if>
      			<form:hidden class="form-control" id="category" value="Adult" path="plusOneList[2].category" />
    		</div>
    		
    		<!-- meal choice for Adult +4 -->
    		<div class="row toHide plusOnes" id="adult4" style="display: none">
    			<div class="col-sm-1 text-right" style="padding:0; margin:0;">
    				<span id="closeAdult4" class="closebtn" style="font-size:11px"><i class="fas fa-times"></i></span>
    			</div>
				<div class="col-sm-6">
    				<label for="+1" class="sr-only">Guest +1 Name</label>
     				<form:input type="text" id="adultName4" class="form-control plus" placeholder="Enter Adult 4" path="plusOneList[3].fullName" oninput="validateGuest(this)"/>
      				<span id="adult4Error" class="plusOneError formError" style='font-size: 14px; text-align:left; display:none;'><i class='fas fa-times'></i>  Please enter name</span>
      			</div>
      			<c:if test="${(not empty email.mealChoiceBeef) || (not empty email.mealChoicePork) || (not empty email.mealChoiceChicken) || (not empty email.mealChoiceVeg) || (not empty email.mealChoiceFish) || (not empty email.mealChoiceKids)}">
      			<div class="col-sm-5">
      				<form:select class="custom-select mb-2 mr-sm-2 mb-sm-0 meal" id="adultMeal4" path="plusOneList[3].mealChoice" onchange="validateMeal(this)">
    					<option value="" disabled="disabled" selected>---Select a meal---</option>
    					<c:if test="${not empty email.mealChoiceBeef}">
    						<option value="${email.mealChoiceBeef}">${email.mealChoiceBeef}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoicePork}">
    						<option value="${email.mealChoicePork}">${email.mealChoicePork}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoiceChicken}">
    						<option value="${email.mealChoiceChicken}">${email.mealChoiceChicken}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoiceVeg}">
    						<option value="${email.mealChoiceVeg}">${email.mealChoiceVeg}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoiceFish}">
    						<option value="${email.mealChoiceFish}">${email.mealChoiceFish}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoiceKids}">
    						<option value="${email.mealChoiceKids}">${email.mealChoiceKids}</option>
    					</c:if>
  					</form:select>
  					<span id="adult4MealError" class="mealError formError" style='font-size: 14px; text-align:left; display:none;'><i class='fas fa-times'></i>  Please select a meal</span>
      			</div>
      			</c:if>
      			<form:hidden class="form-control" id="category" value="Adult" path="plusOneList[3].category" />
    		</div>
    		
    		<!-- meal choice for Kid +1 -->
    		<div class="row toHide plusOnes" id="kid1" style="display: none">
    			<div class="col-sm-1 text-right" style="padding:0; margin:0;">
    				<span id="closeKid1" class="closebtn" style="font-size:11px"><i class="fas fa-times"></i></span>
    			</div>
				<div class="col-sm-6">
    				<label for="+1" class="sr-only">Guest +1 Name</label>
     				<form:input type="text" id="kidName1" class="form-control plus" placeholder="Enter Kid 1" path="plusOneList[4].fullName" oninput="validateGuest(this)"/>
     				<span id="kid1Error" class="plusOneError formError" style='font-size: 14px; text-align:left; display:none;'><i class='fas fa-times'></i>  Please enter name</span>
      			</div>
      			<c:if test="${(not empty email.mealChoiceBeef) || (not empty email.mealChoicePork) || (not empty email.mealChoiceChicken) || (not empty email.mealChoiceVeg) || (not empty email.mealChoiceFish) || (not empty email.mealChoiceKids)}">
      			<div class="col-sm-5">
      				<form:select class="custom-select mb-2 mr-sm-2 mb-sm-0 meal" id="kidMeal1" path="plusOneList[4].mealChoice" onchange="validateMeal(this)">
    					<option value="" disabled="disabled" selected>---Select a meal---</option>
    					<c:if test="${not empty email.mealChoiceBeef}">
    						<option value="${email.mealChoiceBeef}">${email.mealChoiceBeef}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoicePork}">
    						<option value="${email.mealChoicePork}">${email.mealChoicePork}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoiceChicken}">
    						<option value="${email.mealChoiceChicken}">${email.mealChoiceChicken}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoiceVeg}">
    						<option value="${email.mealChoiceVeg}">${email.mealChoiceVeg}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoiceFish}">
    						<option value="${email.mealChoiceFish}">${email.mealChoiceFish}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoiceKids}">
    						<option value="${email.mealChoiceKids}">${email.mealChoiceKids}</option>
    					</c:if>
  					</form:select>
  					<span id="kid1MealError" class="mealError formError" style='font-size: 14px; text-align:left; display:none;'><i class='fas fa-times'></i>  Please select a meal</span>
      			</div>
      			</c:if>
      			<form:hidden class="form-control" id="category" value="Kid" path="plusOneList[4].category" />
    		</div>
    		
    		<!-- meal choice for Kid +2 -->
    		<div class="row toHide plusOnes" id="kid2" style="display: none">
    			<div class="col-sm-1 text-right" style="padding:0; margin:0;">
    				<span id="closeKid2" class="closebtn" style="font-size:11px"><i class="fas fa-times"></i></span>
    			</div>
				<div class="col-sm-6">
    				<label for="+1" class="sr-only">Guest +1 Name</label>
     				<form:input type="text" id="kidName2" class="form-control plus" placeholder="Enter Kid 2" path="plusOneList[5].fullName" oninput="validateGuest(this)"/>
     				<span id="kid2Error" class="plusOneError formError" style='font-size: 14px; text-align:left; display:none;'><i class='fas fa-times'></i>  Please enter name</span>
      			</div>
      			<c:if test="${(not empty email.mealChoiceBeef) || (not empty email.mealChoicePork) || (not empty email.mealChoiceChicken) || (not empty email.mealChoiceVeg) || (not empty email.mealChoiceFish) || (not empty email.mealChoiceKids)}">
      			<div class="col-sm-5">
      				<form:select class="custom-select mb-2 mr-sm-2 mb-sm-0 meal" id="kidMeal2" path="plusOneList[5].mealChoice" onchange="validateMeal(this)">
    					<option value="" disabled="disabled" selected>---Select a meal---</option>
    					<c:if test="${not empty email.mealChoiceBeef}">
    						<option value="${email.mealChoiceBeef}">${email.mealChoiceBeef}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoicePork}">
    						<option value="${email.mealChoicePork}">${email.mealChoicePork}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoiceChicken}">
    						<option value="${email.mealChoiceChicken}">${email.mealChoiceChicken}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoiceVeg}">
    						<option value="${email.mealChoiceVeg}">${email.mealChoiceVeg}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoiceFish}">
    						<option value="${email.mealChoiceFish}">${email.mealChoiceFish}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoiceKids}">
    						<option value="${email.mealChoiceKids}">${email.mealChoiceKids}</option>
    					</c:if>
  					</form:select>
  					<span id="kid2MealError" class="mealError formError" style='font-size: 14px; text-align:left; display:none;'><i class='fas fa-times'></i>  Please select a meal</span>
      			</div>
      			</c:if>
      			<form:hidden class="form-control" id="category" value="Kid" path="plusOneList[5].category" />
      			
    		</div>
    		
    		<!-- meal choice for Kid +3 -->
    		<div class="row toHide plusOnes" id="kid3" style="display: none">
    			<div class="col-sm-1 text-right" style="padding:0; margin:0;">
    				<span id="closeKid3" class="closebtn" style="font-size:11px"><i class="fas fa-times"></i></span>
    			</div>
				<div class="col-sm-6">
    				<label for="+1" class="sr-only">Guest +1 Name</label>
     				<form:input type="text" id="kidName3" class="form-control plus" placeholder="Enter Kid 3" path="plusOneList[6].fullName" oninput="validateGuest(this)"/>
     				<span id="kid3Error" class="plusOneError formError" style='font-size: 14px; text-align:left; display:none;'><i class='fas fa-times'></i>  Please enter name</span>
      			</div>
      			<c:if test="${(not empty email.mealChoiceBeef) || (not empty email.mealChoicePork) || (not empty email.mealChoiceChicken) || (not empty email.mealChoiceVeg) || (not empty email.mealChoiceFish) || (not empty email.mealChoiceKids)}">
      			<div class="col-sm-5">
      				<form:select class="custom-select mb-2 mr-sm-2 mb-sm-0 meal" id="kidMeal3" path="plusOneList[6].mealChoice" onchange="validateMeal(this)">
    					<option value="" disabled="disabled" selected>---Select a meal---</option>
    					<c:if test="${not empty email.mealChoiceBeef}">
    						<option value="${email.mealChoiceBeef}">${email.mealChoiceBeef}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoicePork}">
    						<option value="${email.mealChoicePork}">${email.mealChoicePork}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoiceChicken}">
    						<option value="${email.mealChoiceChicken}">${email.mealChoiceChicken}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoiceVeg}">
    						<option value="${email.mealChoiceVeg}">${email.mealChoiceVeg}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoiceFish}">
    						<option value="${email.mealChoiceFish}">${email.mealChoiceFish}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoiceKids}">
    						<option value="${email.mealChoiceKids}">${email.mealChoiceKids}</option>
    					</c:if>
  					</form:select>
  					<span id="kid3MealError" class="mealError formError" style='font-size: 14px; text-align:left; display:none;'><i class='fas fa-times'></i>  Please select a meal</span>
      			</div>
      			</c:if>
      			<form:hidden class="form-control" id="category" value="Kid" path="plusOneList[6].category" />
      			
    		</div>
    		
    		<!-- meal choice for Kid +4 -->
    		<div class="row toHide plusOnes" id="kid4" style="display: none">
    			<div class="col-sm-1 text-right" style="padding:0; margin:0;">
    				<span id="closeKid4" class="closebtn" style="font-size:11px"><i class="fas fa-times"></i></span>
    			</div>
				<div class="col-sm-6">
    				<label for="+1" class="sr-only">Guest +1 Name</label>
     				<form:input type="text" id="kidName4" class="form-control plus" placeholder="Enter Kid 4" path="plusOneList[7].fullName" oninput="validateGuest(this)"/>
     				<span id="kid4Error" class="plusOneError formError" style='font-size: 14px; text-align:left; display:none;'><i class='fas fa-times'></i>  Please enter name</span>
      			</div>
      			<c:if test="${(not empty email.mealChoiceBeef) || (not empty email.mealChoicePork) || (not empty email.mealChoiceChicken) || (not empty email.mealChoiceVeg) || (not empty email.mealChoiceFish) || (not empty email.mealChoiceKids)}">
      			<div class="col-sm-5">
      				<form:select class="custom-select mb-2 mr-sm-2 mb-sm-0 meal" id="kidMeal4" path="plusOneList[7].mealChoice" onchange="validateMeal(this)">
    					<option value="" disabled="disabled" selected>---Select a meal---</option>
    					<c:if test="${not empty email.mealChoiceBeef}">
    						<option value="${email.mealChoiceBeef}">${email.mealChoiceBeef}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoicePork}">
    						<option value="${email.mealChoicePork}">${email.mealChoicePork}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoiceChicken}">
    						<option value="${email.mealChoiceChicken}">${email.mealChoiceChicken}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoiceVeg}">
    						<option value="${email.mealChoiceVeg}">${email.mealChoiceVeg}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoiceFish}">
    						<option value="${email.mealChoiceFish}">${email.mealChoiceFish}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoiceKids}">
    						<option value="${email.mealChoiceKids}">${email.mealChoiceKids}</option>
    					</c:if>
  					</form:select>
  					<span id="kid4MealError" class="mealError formError" style='font-size: 14px; text-align:left; display:none;'><i class='fas fa-times'></i>  Please select a meal</span>
      			</div>
      			</c:if>
      			<form:hidden class="form-control" id="category" value="Kid" path="plusOneList[7].category" />
    		</div><br>
    		
		<div class="form-group toHide toShow">
			<h5><label for="specialRequirements">Special Requirements (Optional)</label></h5>
			<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-11">
				<c:if test="${not empty guest.specialRequests}">
    				<form:textarea class="form-control" id="specialRequirements" rows="3" value="${guest.specialRequests}" path="specialRequests"></form:textarea>
				</c:if>
				<c:if test="${empty guest.specialRequests}">
    				<form:textarea class="form-control" id="specialRequirements" rows="3" value="" path="specialRequests"></form:textarea>
				</c:if>
			</div>
		</div>
		<br>	
		<div class="text-center">
			<button type="button" id="btnSendResponse" class="btn btn-success col-4 mb-2">Send</button>
		</div>
		</div>
	</form:form>
 <script type="text/javascript">
 	window.history.forward(-1); 
 </script>

</div><!-- body contents end -->
<jsp:include page="/WEB-INF/includes/footer.jsp"/>