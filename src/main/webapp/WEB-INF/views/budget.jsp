<!-- Change feature variable -->
<%! String feature = "Budget" ;%>

<% session.setAttribute("feature", feature); %>
<% session.setAttribute("title", "KIKAKUYA - " + feature); %>
<jsp:include page="/WEB-INF/includes/head.jsp" />
<jsp:include page="/WEB-INF/includes/header.jsp"/>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page isELIgnored="false" %>
<div class="container">
<!-- body contents start -->
	<div class="row">
		<div class="col-sm-8">
			<div id="showBudget">
				<!-- show budget -->
				<h3>Budget: $${event.totalBudget}</h3>
				<c:forEach var="category" items="${budgetInfo}">
	   				<h3>${category.key}</h3>
	   				<c:forEach var="vendor" items="${category.value}">
	   					<h4>${vendor.key.name} - Price</h4>
	   					<c:forEach var="good" items="${vendor.value}">
	   						<h5>${good.goodName} - ${good.goodPrice}</h5>
						</c:forEach>
					</c:forEach>
					<h4>Subtotal: </h4>
				</c:forEach>
				<h3>Total: </h3>
			</div>
			<div id="editBudget">
				<form:form action="editBudget" method="post" modelAttribute="budgetForm">
					<!-- Dummy form. Do not delete. -->
					<form></form>
					
					Budget: $<input name="totalBudget" value="${event.totalBudget}"/><br>
					<c:set var="count" value="0" scope="page" />
					<c:forEach var="category" items="${budgetInfo}" varStatus="catRow">
							<!-- Delete category -->
	   						<form:form action="deleteCategory" method="post" modelAttribute="budgetForm">
	   							<button type="submit" class="fabutton"><i class="fas fa-minus-circle"></i></button>
	   							<form:hidden path="category" value="${category.key}"/>
	   						</form:form>
	   						<h3>${category.key}</h3><br>
	   					<c:forEach var="vendor" items="${category.value}" varStatus="vendorRow">
	   						<!-- Delete vendor -->
	   						<form:form action="deleteVendor" method="post" modelAttribute="budgetForm">
	   							<button type="submit" class="fabutton"><i class="fas fa-minus-circle"></i></button>
	   							<form:hidden path="vendorId" value="${vendor.key.vendorId}"/>
	   						</form:form>
	   						<h4>${vendor.key.name} - Price</h4><br>
	   						<c:forEach var="good" items="${vendor.value}" varStatus="status">
	   							<!-- Delete good -->
	   							<form:form action="deleteGood" method="post" modelAttribute="budgetForm">
	   								<button type="submit" class="fabutton"><i class="fas fa-minus-circle"></i></button>
	   								<form:hidden path="vendorId" value="${vendor.key.vendorId}"/>
	   								<form:hidden path="goodId" value="${good.goodId}"/>
	   							</form:form>
	   							<input name="goodsList[${count}].goodName" value="${good.goodName}"/> - $<input name="goodsList[${count}].goodPrice" value="${good.goodPrice}"/><br>
								<c:set var="count" value="${count + 1}" scope="page"/>
							</c:forEach>
						</c:forEach>
					</c:forEach>
 				<span><input type="submit" value="Save"/></span>
				</form:form>
			</div>
		</div>
		<div class="col-sm-4">
			<!-- budget form add here -->
			<div  style="border-style: solid; padding: 10px; border-width:1px; border-color: #cccccc; display:inline-block;">
			<form:form id="formAddToBudget" action="addToBudget" method="post" modelAttribute="vendor">	
				<div class="form-group">
      				<form:select id="category" class="form-control ui-select" path="category">
	        			<option selected>--- Select Category ---</option>
	        			<option>Accommodation</option>
	        			<option>Alcohol</option>
	       				<option>Balloon Services</option>
	       				<option>Beauty</option>
	       				<option>Cake</option>
	       				<option>Cards & Stationery</option>
	       				<option>Caterer</option>
	       				<option>Decorations</option>
	       				<option>Entertainment</option>
	       				<option>Floral Design</option>
	       				<option>Music</option>
	       				<option>Party Equipment Rental</option>
	       				<option>Party Favors</option>
	       				<option>Photography</option>
	       				<option>Staff</option>
	       				<option>Transportation</option>
	       				<option>Venue</option>
	       				<option>Other</option>
      				</form:select>
   				</div>
   				<fieldset id="vendorFieldSet" class="form-group" style="width:auto; padding: 10px; border-style: solid; border-width:1px; border-color: #cccccc">
   				<legend  style="width:auto; margin-bottom: 0px; font-size: 1rem; border-color: #cccccc">Vendor</legend>
      				<label>Select Vendor:</label>
      				<form:select id="vendor" class="form-control" path="vendorId">
	        			<option>--- Vendor ---</option>
	       				<c:forEach items="${vendors}" var="vendor">
	       					<option value="${vendor.vendorId}" selected>${vendor.name}</option>
	       				</c:forEach>
      				</form:select>
      				<div class="text-center">- or -</div>
      				<div class="text-center">
      				<button type="button" class="btn btn-info" onclick="location.href='/dev/search'">
      						<span class="material-icons align-bottom" style="font-size: 150%;">search</span><span class="align-text-bottom">Search Vendor</span>
      				</button>
      				</div>
      				<div class="text-center">- or -</div>
      				<div class="text-center">
      				<button type="button" class="btn btn-info btnAddVendor">
      						<span class="material-icons align-bottom" style="font-size: 150%;">create</span><span class="align-text-bottom">Add Vendor</span>
      				</button>
      				</div>
      				
   				</fieldset>
   				<fieldset id="goodFieldSet" class="form-group" style="width:auto; padding: 10px; border-style: solid; border-width:1px; border-color: #cccccc">
   				<legend  style="width:auto; margin-bottom: 0px; font-size: 1rem; border-color: #cccccc">Items</legend>
   				<div id="item-price">
   				<c:forEach begin="0" end="${fn:length($vendor.goodsList)}" varStatus="loop">
	   				<div id="itemTextBoxGroup" class="row">
		   					<div id="txtItem" class="col-6">
		   						<form:input type="text" class="form-control" id="item1" placeholder="Item" style="margin-bottom: 5px;" path="goodsList[${loop.index}].goodName"/>
		   					</div>
		   					<div id="txtPrice" class="col-6">
		   						<form:input type="text" class="form-control" id="price1" placeholder="Price" style="margin-bottom: 5px;" path="goodsList[${loop.index}].goodPrice" />
		   					</div>

		   			</div>
		   			</c:forEach>
	   				<div class="text-center">
						<button id="btnAddItemPrice" type="button" class="btn btn-link" style="margin: 10px;">
      						<span class="material-icons" style="font-size: 170%; background-color: #F1E9DA; color: #D90368;">add_circle</span><span class="align-text-bottom" style="color: #D90368; font-size: 20px"></span>
      					</button>
      					<button id="btnRemoveItemPrice" type="button" class="btn btn-link" style="margin: 10px;">
      						<span class="material-icons" style="font-size: 170%; background-color: #F1E9DA; color: #D90368;">remove_circle</span><span class="align-text-bottom" style="color: #D90368; font-size: 20px"></span>
      					</button>
      				</div>
      			</div>
   				</fieldset>
   				<div class="text-center">
					<button type="submit" class="btn btn-primary" style="margin: 10px; background-color: #D90368; border-color: #D90368; ">
	      				<span class="material-icons" style="font-size: 110%; background-color: #D90368; color: #F1E9DA;">add_circle</span><span class="align-text-bottom">Add</span>
	      			</button>
      			</div>
      			
			</form:form>
			
			<div id="enterVendor" class="col-sm-12" style="border-style: solid; padding: 10px; border-width:1px; border-color: #cccccc; display: none;">
				<form:form action="addVendor" method="post" modelAttribute="vendor">
      				<div class="text-center" id="enterVendor">
      					<form:input type="text" class="form-control" placeholder="Vendor Name" path="name" />
      					<form:input type="text" class="form-control" placeholder="Address" path="address" />
      					<form:input type="text" class="form-control" placeholder="Phone Number" path="phoneNo" />
      					<form:input type="text" class="form-control" placeholder="Website" path="website" />
      				</div><br>
      				<div class="text-center">
      					<button type="submit" class="btn btn-success">Submit</button>
      				</div><br>
      				<div class="text-center">
      					<button type="reset" class="btn btn-danger" id="btnCancelAddVendor">Cancel</button>
      				</div>
      			</form:form><br>
      		</div>
		</div>
		</div>
	</div>
		
<!-- body contents end -->
</div>
<script src="resources/js/jquery-editable-select.js"></script>
<!-- <script src="resources/js/budget.js"></script> -->
<script type="text/javascript">
$(document).ready(function(){
	var counter = 1;
	$("#btnAddItemPrice").click(function () {
		$('#txtItem').append('<input type="text" class="form-control" id="item' + counter + '" placeholder="Item" style="margin-bottom: 5px;" name="goodsList['+ counter + '].goodName">');
		$('#txtPrice').append('<input type="text" class="form-control" id="price' + counter + '" placeholder="Price" style="margin-bottom: 5px;" name="goodsList['+ counter + '].goodPrice">');
		counter++;
	});
	
	$("#formAddToBudget").keypress(function(e) {
		  //Enter key
		  if (e.which == 13) {
		    return false;
		  }
		});
	
});

$(document).ready(function(){
	$('#btnRemoveItemPrice').click(function(){
		if($('#txtItem').children().length > 1)
			$('#txtItem :last-child').remove();
		if($('#txtPrice').children().length > 1)
			$('#txtPrice :last-child').remove();
	});
});

$(document).ready(function(){
	$('.btnAddVendor').click(function(){
		$('#formAddToBudget').hide();
		$('#enterVendor').show();
	});
});

$(document).ready(function(){
	$('#btnCancelAddVendor').click(function(){
		$('#formAddToBudget').show();
		$('#enterVendor').hide();
	});
});

$(document).on("keypress", ":input:not(select)", function(event) {
    return event.keyCode != 13;
});
</script>

<jsp:include page="/WEB-INF/includes/footer.jsp"/>


