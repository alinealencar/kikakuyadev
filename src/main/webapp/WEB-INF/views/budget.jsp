<!-- Change feature variable -->
<%! String feature = "Budget" ;%>

<% session.setAttribute("feature", feature); %>
<% session.setAttribute("title", "KIKAKUYA - " + feature); %>
<jsp:include page="/WEB-INF/includes/head.jsp" />
<jsp:include page="/WEB-INF/includes/header.jsp"/>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page isELIgnored="false" %>
<div class="container">
<!-- body contents start -->
	<div class="row">
		<div class="col-sm-8">
			<!-- budget form here -->
			<h3>Budget: ${event.totalBudget}</h3>
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
		<div class="col-sm-4" style="border-style: solid; padding: 10px; border-width:1px; border-color: #cccccc">
			<!-- budget form add here -->
			<form:form action="" method="post" modelAttribute="vendor">	
				<div class="form-group">
      				<form:select id="category" class="form-control ui-select" path="category">
	        			<option selected>--- Select Category ---</option>
	       				<option>Balloon Services</option>
	       				<option>Cake</option>
	       				<option>Cards & Stationery</option>
	       				<option>Decorations</option>
	       				<option>Entertainment</option>
	       				<option>Floral Design</option>
	       				<option>Music</option>
	       				<option>Party Equipment Rental</option>
	       				<option>Photographer</option>
	       				<option>Venue</option>
      				</form:select>
   				</div>
   				<fieldset class="form-group" style="width:auto; padding: 10px; border-style: solid; border-width:1px; border-color: #cccccc">
   				<legend  style="width:auto; margin-bottom: 0px; font-size: 1rem; border-color: #cccccc">Vendor</legend>
      				<form:select id="ventor" class="form-control" path="name">
	        			<option>--- Select Vendor ---</option>
	       				<c:forEach items="${vendors}" var="vendor">
	       					<option value="${vendor.vendorId}" selected>${vendor.name}</option>
	       				</c:forEach>
      				</form:select>
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
      			
			</form:form>
		</div>
	</div>
<!-- body contents end -->
</div>
<script src="resources/js/jquery-editable-select.js"></script>
<script src="resources/js/budget.js"></script>

<jsp:include page="/WEB-INF/includes/footer.jsp"/>


