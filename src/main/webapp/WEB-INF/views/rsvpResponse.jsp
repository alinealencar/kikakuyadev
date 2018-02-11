
<!-- Change feature variable -->
<%! String feature = "RSVP Response" ;%>

<% session.setAttribute("feature", feature); %>
<% session.setAttribute("title", "KIKAKUYA - " + feature); %>
<jsp:include page="/WEB-INF/includes/head.jsp" />
<jsp:include page="/WEB-INF/includes/header-rsvp-response.jsp"/>

<div class="container"><!-- body contents start -->
	<h4 class="text-center">The favor of reply is required by <b>February 8th, 2018${deadline}</b></h4>
	<h1 class="text-center">Maria Alyssa Villacete${guestName}</h1>
	<form action="{responseURL}" method="post">
	  
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
		       		<option>0</option>
		       		<option>1</option>
		       		<option>2</option>
		       		<option>3</option>
		    	</select>
		    </div>
	   		<label for="kid" class="col-form-label col-sm-2 text-sm-right">Kids:</label>
	   		<div class="col-sm-2">
	      		<select class="form-control" id="kid">
	        		<option>0</option>
	        		<option>1</option>
	        		<option>2</option>
	        		<option>3</option>
	      		</select>
	      	</div>
		</div>
				
				
		<div class="form-group" >
			<h5>Please indicate name and a meal choice</h5>
			
			<!-- meal choice for guest -->
			<div class="row">
				<div class="col-sm-6">
    				<label for="guestName" class="sr-only">Guest Name</label>
    				<input type="text" id="guestName" class="form-control" placeholder="Maria Alyssa Villacette"${guestName}>
    			</div>
    			<div class="col-sm-6">
    				<select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="inlineFormCustomSelect" required>
    					<option value="" selected>---Select a meal---</option>
    					<option value="1">One</option>
    					<option value="2">Two</option>
    					<option value="3">Three</option>
  					</select>
    			</div>
    		</div>
    			
    		<!-- meal choice for +1 -->
    		<div class="row">
				<div class="col-sm-6">
    				<label for="+1" class="sr-only">Guest +1 Name</label>
     				<input type="text" id="+1" class="form-control" required>
      			</div>
      			<div class="col-sm-6">
      				<select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="inlineFormCustomSelect" required >
    					<option value="" selected>---Select a meal---</option>
    					<option value="1">One</option>
    					<option value="2">Two</option>
    					<option value="3">Three</option>
  					</select>
      			</div>
    		</div>
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
