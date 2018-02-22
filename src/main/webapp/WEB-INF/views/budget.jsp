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
			<div id="editBudget">
				<form:form action="editBudget" method="post" modelAttribute="goodsListForm">
					Budget: <input name="totalBudget" value="${event.totalBudget}"/><br>
					<c:set var="count" value="0" scope="page" />
					<c:forEach var="category" items="${budgetInfo}" varStatus="catRow">
	   					<h3>${category.key}</h3><br>
	   					<c:forEach var="vendor" items="${category.value}" varStatus="vendorRow">
	   						<h4>${vendor.key.name} - Price</h4><br>
	   						<c:forEach var="good" items="${vendor.value}" varStatus="status">
	   							<input type="hidden" name="goodsList[${count}].goodId" value="${good.goodId}"/>
	   							<input name="goodsList[${count}].goodName" value="${good.goodName}"/> - <input name="goodsList[${count}].goodPrice" value="${good.goodPrice}"/><br>
								<c:set var="count" value="${count + 1}" scope="page"/>
							</c:forEach>
						</c:forEach>
					</c:forEach>
				<span><input type="submit" value="Save"/></span>
				</form:form>
			</div>
		</div>
		<div class="col-sm-4" style="border-style: solid; padding: 10px; border-width:1px; border-color: #cccccc">
			<!-- budget form add here -->
			<form:form id="formAddToBudget" action="addToBudget" method="post" modelAttribute="vendor">	
				<div class="form-group">
      				<form:select id="category" class="form-control ui-select" path="category">
	        			<option selected>--- Select Category ---</option>
	       				<option>Balloon Services</option>
	       				<option>Cake</option>
	       				<option>Cards & Stationery</option>
	       				<option>Caterer</option>
	       				<option>Decorations</option>
	       				<option>Entertainment</option>
	       				<option>Floral Design</option>
	       				<option>Music</option>
	       				<option>Party Equipment Rental</option>
	       				<option>Photography</option>
	       				<option>Transportation</option>
	       				<option>Venue</option>
      				</form:select>
   				</div>
   				<fieldset class="form-group" style="width:auto; padding: 10px; border-style: solid; border-width:1px; border-color: #cccccc">
   				<legend  style="width:auto; margin-bottom: 0px; font-size: 1rem; border-color: #cccccc">Vendor</legend>
      				<form:select id="vendor" class="form-control" path="vendorId">
	        			<option selected>--- Select Vendor ---</option>
	       				<c:forEach items="${vendors}" var="vendor">
	       					<option value="${vendor.vendorId}">${vendor.name}</option>
	       				</c:forEach>
      				</form:select>
      				<div class="text-center">- or -</div>
      				<div class="text-center">
      				<button input type="button" class="btn btn-info" onclick="location.href='/dev/search'">
      						<span class="material-icons align-bottom" style="font-size: 150%;">search</span><span class="align-text-bottom">Search Vendor</span>
      				</button>
      				</div>
   				</fieldset>
   				<fieldset class="form-group" style="width:auto; padding: 10px; border-style: solid; border-width:1px; border-color: #cccccc">
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
      						<span class="material-icons" style="font-size: 150%; background-color: #F1E9DA; color: #D90368;">add_circle</span><span class="align-text-bottom" style="color: #D90368; font-size: 20px"></span>
      					</button>
      					<button id="btnRemoveItemPrice" type="button" class="btn btn-link" style="margin: 10px;">
      						<span class="material-icons" style="font-size: 150%; background-color: #F1E9DA; color: #D90368;">remove_circle</span><span class="align-text-bottom" style="color: #D90368; font-size: 20px"></span>
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
		</div>
	</div>
<!-- body contents end -->
</div>
<script src="resources/js/jquery-editable-select.js"></script>
<script src="resources/js/budget.js"></script>
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

$(document).on("keypress", ":input:not(select)", function(event) {
    return event.keyCode != 13;
});
</script>

<jsp:include page="/WEB-INF/includes/footer.jsp"/>


