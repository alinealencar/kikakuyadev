
<!-- Change feature variable -->
<%! String feature = "RSVP Response" ;%>

<% session.setAttribute("feature", feature); %>
<% session.setAttribute("title", "KIKAKUYA - " + feature); %>
<jsp:include page="/WEB-INF/includes/head.jsp" />
<jsp:include page="/WEB-INF/includes/header-rsvp-response.jsp"/>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div>
	<div class="${(respondRSVPSuccess != null) ? 'alert alert-success':''}" role="alert">${respondRSVPSuccess}</div>
	<div class="${(respondRSVPError != null) ? 'alert alert-danger':''}" role="alert">${respondRSVPError}</div>
</div>
<div class="container"><!-- body contents start -->
	<h4 class="text-center">The favor of reply is required by <b>${email.replyDue}</b></h4>
	<h1 class="text-center">${guest.firstName} ${guest.lastName}</h1>
	<form:form action="sendRsvpResponse" method="post" modelAttribute="guest">
	  	<form:hidden value="${token}" path="token" />
		<div class="form-group row">
		  	<label class="radio-inline text-center col-sm-6">
		  		<h4><form:radiobutton name="attendance" value="1" path="isPresent" />Happily attend!</h4>
		  	</label>
		  	<label class="radio-inline text-center col-sm-6">
		  		<h4><form:radiobutton name="attendance" value="2" path="isPresent" />Sadly decline...</h4>
		  	</label>
		</div>
		  	
		<div class="form-group row" >
			<div class="col-sm-4">
				<h5>Number of people in your party</h5>
				<p>*not including you</p>
			</div>
	   		<label for="adult" class="col-form-label col-sm-2 text-sm-right">Adults:</label>
	   		<div class="col-sm-2">
		    	<form:select class="form-control" id="adult" path="adultsWith" onChange="show(this)">
		    	<c:forEach begin="0" end="${guest.adultsMax}" varStatus="loop">
		       		<option value="${loop.index}">${loop.index}</option>
		       	</c:forEach>
		    	</form:select>
		    </div>
	   		<label for="kid" class="col-form-label col-sm-2 text-sm-right">Kids:</label>
	   		<div class="col-sm-2">
	      		<form:select class="form-control" id="kid" path="kidsWith">
	        	<c:forEach begin="0" end="${guest.kidsMax}" varStatus="loop">
		       		<option value="${loop.index}">${loop.index}</option>
		       	</c:forEach>
	      		</form:select>
	      	</div>
		</div>
				
				
		<div class="form-group" >
			<h5>Please indicate name and a meal choice</h5>
			
			<!-- meal choice for guest -->
			<div class="row">
				<div class="col-sm-6">
    				<label for="guestName" class="sr-only">Guest Name</label>
    				<form:input type="text" id="guestName" class="form-control" placeholder="${guest.firstName} ${guest.lastName}" path="${firstName}"/>
    			</div>
    			<div class="col-sm-6">
    				<form:select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="inlineFormCustomSelect" path="mealChoice">
    					<option value="" selected>---Select a meal---</option>
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
    			</div>
    		</div>
    			
    		<!-- meal choice for +1 -->
    		<!--<c:forEach begin="0" end="${guest.adultsMax}" varStatus="loop">-->
    		<div class="row" id="adult1">
				<div class="col-sm-6">
    				<label for="+1" class="sr-only">Guest +1 Name</label>
     				<form:input type="text" id="+1" class="form-control" path="plusOneList[0].fullName"/>
      			</div>
      			<div class="col-sm-6">
      				<form:select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="inlineFormCustomSelect" path="plusOneList[${loop.index}].mealChoice">
    					<option value="" selected>---Select a meal---</option>
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
      			</div>
    		</div>
    		<!--</c:forEach>-->
			
		<div class="form-group">
			<h5><label for="specialRequirements">Special Requirements (Optional)</label></h5>
			<c:if test="${not empty guest.specialRequests}">
    			<form:textarea class="form-control" id="specialRequirments" rows="3" value="${guest.specialRequests}" path="specialRequests"></form:textarea>
			</c:if>
			<c:if test="${empty guest.specialRequests}">
    			<form:textarea class="form-control" id="specialRequirments" rows="3" value="" path="specialRequests"></form:textarea>
			</c:if>
		</div>
			
		<div class="text-center">
			<button type="submit" class="btn btn-success col-4 mb-2">Send</button>
		</div>
	</form:form>
 <script type="text/javascript">
 function show(obj) {
	  //var rsvp = document.getElementById("adult");
	  var value = obj.options[obj.selectedIndex].value;
	  var count = obj.options.length;
	    for(i=1;i<count;i++){
	    	document.getElementById('myDiv'+i).style.display = 'none';
	    
	   		//if (document.getElementById('adult'+i).style.display === "none") {
	   			if(no>0){
	    		document.getElementById('adult'+no).style.display = 'block';
	    }
	    }
 }
 </script>

</div><!-- body contents end -->
<jsp:include page="/WEB-INF/includes/footer.jsp"/>
