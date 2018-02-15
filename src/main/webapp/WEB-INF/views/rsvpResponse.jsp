
<!-- Change feature variable -->
<%! String feature = "RSVP Response" ;%>

<% session.setAttribute("feature", feature); %>
<% session.setAttribute("title", "KIKAKUYA - " + feature); %>
<jsp:include page="/WEB-INF/includes/head.jsp" />
<jsp:include page="/WEB-INF/includes/header-rsvp-response.jsp"/>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div class="container"><!-- body contents start -->
	<div>
		<div class="${(sendRSVPError != null) ? 'alert alert-danger':''}" role="alert">${sendRSVPError}</div>
	</div>
	
	<h4 class="text-center">The favor of reply is required by <b>${email.replyDue}</b></h4>
	<h1 class="text-center">${guest.firstName} ${guest.lastName}</h1>
	<form:form action="sendRsvpResponse" method="post" modelAttribute="guest">
	  	<form:hidden value="${token}" path="token" />
	  	<form:hidden value="${guest.guestId}" path="guestId" />
		<div class="form-group row">
		  	<label class="radio-inline text-center col-sm-6">
		  		<h4><form:radiobutton name="attendance" id="attend" value="1" path="isPresent" required="true" checked="true"/>Happily attend!</h4>
		  	</label>
		  	<label class="radio-inline text-center col-sm-6">
		  		<h4><form:radiobutton name="attendance" id="absent" value="2" path="isPresent" />Sadly decline...</h4>
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
    				<form:input type="text" id="guestName" class="form-control" value="${guest.firstName} ${guest.lastName}" path="${firstName}" required="true"/>
    			</div>
    			<div class="col-sm-6">
    				<form:select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="guestMeal" path="mealChoice">
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
    			
    		<!-- meal choice for Adult +1 -->
    		<div class="row" id="adult1" style="display: none">
				<div class="col-sm-6">
    				<label for="+1" class="sr-only">Guest +1 Name</label>
     				<form:input type="text" id="+1" class="form-control" path="plusOneList[0].fullName"/>
      			</div>
      			<div class="col-sm-6">
      				<form:select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="inlineFormCustomSelect" path="plusOneList[0].mealChoice">
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
      			<div class="col-sm-6">
      				<form:select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="inlineFormCustomSelect" path="plusOneList[0].isAdult">
      					<option value=1 selected>Adult</option>
      					<option value=0 selected>Kid</option>
      				</form:select>
      			</div>
    		</div>
			
			<!-- meal choice for Adult +2 -->
    		<div class="row" id="adult2" style="display: none">
				<div class="col-sm-6">
    				<label for="+1" class="sr-only">Guest +1 Name</label>
     				<form:input type="text" id="+1" class="form-control" path="plusOneList[1].fullName"/>
      			</div>
      			<div class="col-sm-6">
      				<form:select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="inlineFormCustomSelect" path="plusOneList[1].mealChoice">
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
      			<div class="col-sm-6">
      				<form:select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="inlineFormCustomSelect" path="plusOneList[1].isAdult">
      					<option value=1 selected>Adult</option>
      					<option value=0 selected>Kid</option>
      				</form:select>
      			</div>
    		</div>
    		
    		<!-- meal choice for Adult +3 -->
    		<div class="row" id="adult3" style="display: none">
				<div class="col-sm-6">
    				<label for="+1" class="sr-only">Guest +1 Name</label>
     				<form:input type="text" id="+1" class="form-control" path="plusOneList[2].fullName"/>
      			</div>
      			<div class="col-sm-6">
      				<form:select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="inlineFormCustomSelect" path="plusOneList[2].mealChoice">
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
      			<div class="col-sm-6">
      				<form:select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="inlineFormCustomSelect" path="plusOneList[2].isAdult">
      					<option value=1 selected>Adult</option>
      					<option value=0 selected>Kid</option>
      				</form:select>
      			</div>
    		</div>
    		
    		<!-- meal choice for Adult +4 -->
    		<div class="row" id="adult4" style="display: none">
				<div class="col-sm-6">
    				<label for="+1" class="sr-only">Guest +1 Name</label>
     				<form:input type="text" id="+1" class="form-control" path="plusOneList[3].fullName"/>
      			</div>
      			<div class="col-sm-6">
      				<form:select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="inlineFormCustomSelect" path="plusOneList[3].mealChoice">
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
      			<div class="col-sm-6">
      				<form:select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="inlineFormCustomSelect" path="plusOneList[3].isAdult">
      					<option value=1 selected>Adult</option>
      					<option value=0 selected>Kid</option>
      				</form:select>
      			</div>
    		</div>
    		
    		<!-- meal choice for Kid +1 -->
    		<div class="row" id="kid1" style="display: none">
				<div class="col-sm-6">
    				<label for="+1" class="sr-only">Guest +1 Name</label>
     				<form:input type="text" id="+1" class="form-control" path="plusOneList[4].fullName"/>
      			</div>
      			<div class="col-sm-6">
      				<form:select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="inlineFormCustomSelect" path="plusOneList[4].mealChoice">
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
      			<div class="col-sm-6">
      				<form:select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="inlineFormCustomSelect" path="plusOneList[4].isAdult">
      					<option value=1 selected>Adult</option>
      					<option value=0 selected>Kid</option>
      				</form:select>
      			</div>
    		</div>
    		
    		<!-- meal choice for Kid +2 -->
    		<div class="row" id="kid2" style="display: none">
				<div class="col-sm-6">
    				<label for="+1" class="sr-only">Guest +1 Name</label>
     				<form:input type="text" id="+1" class="form-control" path="plusOneList[5].fullName"/>
      			</div>
      			<div class="col-sm-6">
      				<form:select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="inlineFormCustomSelect" path="plusOneList[5].mealChoice">
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
      			<div class="col-sm-6">
      				<form:select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="inlineFormCustomSelect" path="plusOneList[5].isAdult">
      					<option value=1 selected>Adult</option>
      					<option value=0 selected>Kid</option>
      				</form:select>
      			</div>
    		</div>
    		
    		<!-- meal choice for Kid +3 -->
    		<div class="row" id="kid3" style="display: none">
				<div class="col-sm-6">
    				<label for="+1" class="sr-only">Guest +1 Name</label>
     				<form:input type="text" id="+1" class="form-control" path="plusOneList[6].fullName"/>
      			</div>
      			<div class="col-sm-6">
      				<form:select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="inlineFormCustomSelect" path="plusOneList[6].mealChoice">
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
      			<div class="col-sm-6">
      				<form:select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="inlineFormCustomSelect" path="plusOneList[6].isAdult">
      					<option value=1 selected>Adult</option>
      					<option value=0 selected>Kid</option>
      				</form:select>
      			</div>
    		</div>
    		
    		<!-- meal choice for Kid +4 -->
    		<div class="row" id="kid4" style="display: none">
				<div class="col-sm-6">
    				<label for="+1" class="sr-only">Guest +1 Name</label>
     				<form:input type="text" id="+1" class="form-control" path="plusOneList[7].fullName"/>
      			</div>
      			<div class="col-sm-6">
      				<form:select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="inlineFormCustomSelect" path="plusOneList[7].mealChoice">
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
      			<div class="col-sm-6">
      				<form:select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="inlineFormCustomSelect" path="plusOneList[7].isAdult">
      					<option value=1 selected>Adult</option>
      					<option value=0 selected>Kid</option>
      				</form:select>
      			</div>
    		</div><br>
    		
		<div class="form-group">
			<h5><label for="specialRequirements">Special Requirements (Optional)</label></h5>
			<c:if test="${not empty guest.specialRequests}">
    			<form:textarea class="form-control" id="specialRequirements" rows="3" value="${guest.specialRequests}" path="specialRequests"></form:textarea>
			</c:if>
			<c:if test="${empty guest.specialRequests}">
    			<form:textarea class="form-control" id="specialRequirements" rows="3" value="" path="specialRequests"></form:textarea>
			</c:if>
		</div>
			
		<div class="text-center">
			<button type="submit" class="btn btn-success col-4 mb-2">Send</button>
		</div>
		</div>
	</form:form>
 <script type="text/javascript">
 $(function() {
	    $('#adult').change(function() {
	        var val = $(this).val();
	        switch (val){
	        	case '0':
               		$('#adult1').hide();
               		$('#adult2').hide();
               		$('#adult3').hide();
               		$('#adult4').hide();
                	break;
	            case '1':
	                $('#adult1').show();
	                $('#adult2').hide();
	                $('#adult3').hide();
               		$('#adult4').hide();
	                break;
	            case '2':
	                $('#adult1').show();
	                $('#adult2').show();
	                $('#adult3').hide();
               		$('#adult4').hide();
	                break;
	            case '3':
	               	$('#adult1').show();
	                $('#adult2').show();
	                $('#adult3').show();
	                $('#adult4').hide();
	               	break;
	            case '4':
	               	$('#adult1').show();
	                $('#adult2').show();
	                $('#adult3').show();
	                $('#adult4').show();
	               	break;
	            
	        }
	    });
 });
 
 $(function() {
	    $('#kid').change(function() {
	        var val = $(this).val();
	        switch (val){
	        	case '0':
            		$('#kid1').hide();
            		$('#kid2').hide();
            		$('#kid3').hide();
            		$('#kid4').hide();
             	break;
	            case '1':
	                $('#kid1').show();
	                $('#kid2').hide();
	                $('#kid3').hide();
            		$('#kid4').hide();
	                break;
	            case '2':
	                $('#kid1').show();
	                $('#kid2').show();
	                $('#kid3').hide();
            		$('#kid4').hide();
	                break;
	            case '3':
	               	$('#kid1').show();
	                $('#kid2').show();
	                $('#kid3').show();
	                $('#kid4').hide();
	               	break;
	            case '4':
	               	$('#kid1').show();
	                $('#kid2').show();
	                $('#kid3').show();
	                $('#kid4').show();
	               	break;
	            
	        }
	    });
});

 $(function() {
	    $('#absent').click(function() {
	    	$('#adult').prop('disabled', true);
	    	$('#kid').prop('disabled', true);
	    	$('#guestName').prop('disabled', true);
	    	$('#guestMeal').prop('disabled', true);
	    	$('#specialRequirements').prop('disabled', true);
	    		
	    });
		
 });
	    	
$(function() {
		 $('#attend').click(function() {
			 $('#adult').prop('disabled', false);
	    	 $('#kid').prop('disabled', false);
	    	 $('#guestName').prop('disabled', false);
	    	 $('#guestMeal').prop('disabled', false);
	    	 $('#specialRequirements').prop('disabled', false);
		    		
		   });		
});
 
 </script>

</div><!-- body contents end -->
<jsp:include page="/WEB-INF/includes/footer.jsp"/>
