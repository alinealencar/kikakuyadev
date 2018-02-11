
<!-- Change feature variable -->
<%! String feature = "RSVP Response" ;%>

<% session.setAttribute("feature", feature); %>
<% session.setAttribute("title", "KIKAKUYA - " + feature); %>
<jsp:include page="/WEB-INF/includes/head.jsp" />
<jsp:include page="/WEB-INF/includes/header-rsvp-response.jsp"/>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<div class="container"><!-- body contents start -->
	<h4 class="text-center">The favor of reply is required by <b>${email.replyDue}</b></h4>
	<h1 class="text-center">${guest.firstName} ${guest.lastName}</h1>
	<form action="rsvpResponse" method="post">
	  
		<div class="form-group row">
		  	<label class="radio-inline text-center col-sm-6">
		  		<h4><input  type="radio" name="attendance" value="attend" required>Happily attend!</h4>
		  	</label>
		  	<label class="radio-inline text-center col-sm-6">
		  		<h4><input type="radio" name="attendance" value="absent" >Sadly decline...</h4>
		  	</label>
		</div>
		  	
		<div class="form-group row" >
			<div class="col-sm-4">
				<h5>Number of people in your party</h5>
				<p>*not including you</p>
			</div>
	   		<label for="adult" class="col-form-label col-sm-2 text-sm-right">Adults:</label>
	   		<div class="col-sm-2">
		    	<select class="form-control" id="adult">
		    	<c:forEach begin="0" end="${email.adultsMax}" varStatus="loop">
		       		<option>${loop.index}</option>
		       	</c:forEach>
		    	</select>
		    </div>
	   		<label for="kid" class="col-form-label col-sm-2 text-sm-right">Kids:</label>
	   		<div class="col-sm-2">
	      		<select class="form-control" id="kid">
	        	<c:forEach begin="0" end="${email.kidsMax}" varStatus="loop">
		       		<option>${loop.index}</option>
		       	</c:forEach>
	      		</select>
	      	</div>
		</div>
				
				
		<div class="form-group" >
			<h5>Please indicate name and a meal choice</h5>
			
			<!-- meal choice for guest -->
			<div class="row">
				<div class="col-sm-6">
    				<label for="guestName" class="sr-only">Guest Name</label>
    				<input type="text" id="guestName" class="form-control" placeholder="${guest.firstName} ${guest.lastName}">
    			</div>
    			<div class="col-sm-6">
    				<select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="inlineFormCustomSelect" required>
    					<option value="" selected>---Select a meal---</option>
    					<c:if test="${not empty email.mealChoiceBeef}">
    						<option value="${email.mealChoiceBeef}">${email.mealChoiceBeef}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoicePork}">
    						<option value="${email.mealChoicePork}">${email.mealChoicePork}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoiceChicken}">
    						<option value="${email.mealChoiceBeef}">${email.mealChoiceBeef}</option>
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
  					</select>
    			</div>
    		</div>
    			
    		<!-- meal choice for +1 -->
    		<c:forEach begin="0" end="${email.adultsMax}" varStatus="loop">
    		<div class="row">
				<div class="col-sm-6">
    				<label for="+1" class="sr-only">Guest +1 Name</label>
     				<input type="text" id="+1" class="form-control" required>
      			</div>
      			<div class="col-sm-6">
      				<select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="inlineFormCustomSelect" required >
    					<option value="" selected>---Select a meal---</option>
    					<c:if test="${not empty email.mealChoiceBeef}">
    						<option value="${email.mealChoiceBeef}">${email.mealChoiceBeef}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoicePork}">
    						<option value="${email.mealChoicePork}">${email.mealChoicePork}</option>
    					</c:if>
    					<c:if test="${not empty email.mealChoiceChicken}">
    						<option value="${email.mealChoiceBeef}">${email.mealChoiceBeef}</option>
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
  					</select>
      			</div>
    		</div>
    		</c:forEach>
		</div>
			
		<div class="form-group">
			<h5><label for="specialRequirements">Special Requirements (Optional)</label></h5>
    		<textarea class="form-control" id="specialRequirments" rows="3"></textarea>
		</div>
			
		<div class="text-center">
			<button type="submit" class="btn btn-success col-4 mb-2">Send</button>
		</div>
	</form>
  	
</div><!-- body contents end -->
<jsp:include page="/WEB-INF/includes/footer.jsp"/>
