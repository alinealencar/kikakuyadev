<!-- Change feature variable -->
<%! String feature = "Budget" ;%>

<% session.setAttribute("feature", feature); %>
<% session.setAttribute("title", "KIKAKUYA - " + feature); %>
<jsp:include page="/WEB-INF/includes/head.jsp" />
<jsp:include page="/WEB-INF/includes/header.jsp"/>
<div class="container">
<!-- body contents start -->
	<div class="row">
		<div class="col-sm-8">
			<!-- budget form here -->
			<h3>Budget: ${event.totalBudget}</h3>
			
		</div>
		<div class="col-sm-4" style="border-style: solid; padding: 10px; border-width:1px; border-color: #cccccc">
			<!-- budget form add here -->
			<form >	
				<div class="form-group">
      				<select id="category" class="form-control ui-select">
	        			<option selected>--- Select Category ---</option>
	       				<option>Entertainment</option>
	       				<option>Music</option>
	       				<option>Venue</option>
      				</select>
   				</div>
   				<fieldset class="form-group" style="width:auto; padding: 10px; border-style: solid; border-width:1px; border-color: #cccccc">
   				<legend  style="width:auto; margin-bottom: 0px; font-size: 1rem; border-color: #cccccc">Vendor</legend>
      				<select id="ventor" class="form-control">
	        			<option selected>--- Select Vendor ---</option>
	       				<option>The Best Catering</option>
	       				<option>Caterz Inc.</option>
      				</select>
      				<div class="text-center">- or -</div>
      				<div class="text-center">
      				<button type="button" class="btn btn-info">
      					<span class="material-icons align-bottom" style="font-size: 150%;">search</span><span class="align-text-bottom">Search Vendor</span>
      				</button>
      				</div>
   				</fieldset>
   				<fieldset class="form-group" style="width:auto; padding: 10px; border-style: solid; border-width:1px; border-color: #cccccc">
   				<legend  style="width:auto; margin-bottom: 0px; font-size: 1rem; border-color: #cccccc">Items</legend>
   				<div id="item-price">
	   				<div id="itemTextBoxGroup" class="row">
		   					<div id="txtItem" class="col-6">
		   						<input type="text" class="form-control" id="item1" placeholder="Item" style="margin-bottom: 5px;">
		   					</div>
		   					<div id="txtPrice" class="col-6">
		   						<input type="text" class="form-control" id="price1" placeholder="Price" style="margin-bottom: 5px;">
		   					</div>

		   			</div>
	   				<div class="text-center">
						<button id="btnAddItemPrice" type="button" class="btn btn-link" style="margin: 10px;">
      						<span class="material-icons" style="font-size: 150%; background-color: #F1E9DA; color: #D90368;">add_circle</span><span class="align-text-bottom" style="color: #D90368; font-size: 20px">Add Item</span>
      					</button>
      				</div>
      			</div>
   				</fieldset>
   				<div class="text-center">
					<button type="button" class="btn btn-primary" style="margin: 10px; background-color: #D90368; border-color: #D90368; ">
	      				<span class="material-icons" style="font-size: 110%; background-color: #D90368; color: #F1E9DA;">add_circle</span><span class="align-text-bottom">Add</span>
	      			</button>
      			</div>
      			
			</form>
		</div>
	</div>
<!-- body contents end -->
</div>
<script src="resources/js/jquery-editable-select.js"></script>
<script src="resources/js/budget.js"></script>

<jsp:include page="/WEB-INF/includes/footer.jsp"/>


