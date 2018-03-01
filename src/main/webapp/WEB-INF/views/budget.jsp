<!-- Change feature variable -->
<%! String feature = "Budget" ;%>

<% session.setAttribute("feature", feature); %>
<% session.setAttribute("title", "KIKAKUYA - " + feature); %>
<jsp:include page="/WEB-INF/includes/head.jsp" />
<jsp:include page="/WEB-INF/includes/header.jsp"/>
<jsp:include page="/WEB-INF/includes/menu.jsp"/>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page isELIgnored="false" %>
<script src="resources/js/budget.js"></script>
<div class="container">
<!-- body contents start -->
	<div class="row">
		<div class="col-sm-8">
			${editSuccess}
			${goodDeleted}
			<div id="showBudget" ${goodDeleted != '' ? 'style="display:none;"':''}>
				<!-- show budget -->
				<span onclick="openEditBudget()"><i class="fas fa-edit"></i></span>
				<h3>Budget: $${event.totalBudget}</h3>
				<c:set var="cat" value="1" scope="page" />
				<c:forEach var="category" items="${budgetInfo}">
	   				<h3>${category.key}</h3>
	   				<c:forEach var="vendor" items="${category.value}">
	   					<h4>${vendor.key.name} - Price</h4>
	   					<!-- Get details of the vendor -->
	   					<form action="showVendor" method="post">
	   						<input type="hidden" name="vendorId" value="${vendor.key.vendorId}"/>
	   						<button type="submit" class="fabutton">
	   							<i class="fas fa-address-card"></i>
	   						</button>
	   					</form>
	   					<c:forEach var="good" items="${vendor.value}">
	   						<h5>${good.goodName} - <span class="category${cat}">${good.goodPrice}</span></h5>
						</c:forEach>
					</c:forEach>
					<h4>Subtotal: $ <script>document.write(calculateSubtotal('category${cat}'));</script></h4>
					
					<c:set var="cat" value="${cat + 1}" scope="page"/>
				</c:forEach>
				<h3>Grand Total: $<span id="totalBudget"><script>document.write(calculateTotal());</script></span></h3>
				<h3>Amount Remaining: $<span id="amountRemaining"><script>document.write(calculateAmountRemaining('${event.totalBudget}', calculateTotal()));</script></span></h3>
			</div>
			<!-- edit budget -->
			<div id="editBudget" ${goodDeleted != '' ? '' : 'style="display:none;"'}>
				<span onclick="openShowBudget()" class="closebtn"><i class="fas fa-times"></i></span>
				<form:form action="editBudget" method="post" modelAttribute="budgetForm">
					<button type="submit">Save</button>
					<br>
					<!-- Fields for the delete operation -->
					<form:hidden path="category" value=""/>
					<form:hidden path="vendorId" value=""/>
	   				<form:hidden path="goodId" value=""/>
	   				
					Budget: $<input type="number" name="totalBudget" value="${event.totalBudget}"/><br>
					<c:set var="catEdit" value="1" scope="page" />
					<c:set var="count" value="0" scope="page" />
					<c:forEach var="category" items="${budgetInfo}" varStatus="catRow">
						<button onclick="deleteCategory('${category.key}');" class="fabutton absent"><i class="fas fa-minus-circle"></i></button>
	   					<h3>${category.key}</h3><br>
	   					<c:forEach var="vendor" items="${category.value}" varStatus="vendorRow">
	   						<button onclick="deleteVendor(${vendor.key.vendorId});" class="fabutton absent"><i class="fas fa-minus-circle"></i></button>
	   						<h4>${vendor.key.name} - Price</h4><br>
	   						<c:forEach var="good" items="${vendor.value}" varStatus="status">
	   							<button onclick="deleteGood(${vendor.key.vendorId}, ${good.goodId});" class="fabutton absent"><i class="fas fa-minus-circle"></i></button>
	   							<input name="goodsList[${count}].goodName" value="${good.goodName}"/> - <span>$<input class="catEdit${catEdit}" type="number" name="goodsList[${count}].goodPrice" value="${good.goodPrice}" oninput="calculateSubtotalLive('${event.totalBudget}','${catEdit}')"/></span><br>
								<input type="hidden" name="goodsList[${count}].goodId" value="${good.goodId}"/>
								<c:set var="count" value="${count + 1}" scope="page"/>
							</c:forEach>
						</c:forEach>
						<h4>Subtotal: $ <span id="subtotal${catEdit}" class="subtotalEdit"><script>calculateSubtotalLive('${event.totalBudget}', '${catEdit}');</script></span></h4>
						<c:set var="catEdit" value="${catEdit + 1}" scope="page"/>
					</c:forEach>
					<h3>Grand Total: $<span id="totalBudgetEdit"><script>calculateTotalEdit('${event.totalBudget}');</script></span></h3>
					<h3>Amount Remaining: $<span id="amountRemainingEdit"><script>document.write(calculateAmountRemaining('${event.totalBudget}', calculateTotal()));</script></span></h3>
				</form:form>
			</div>
		</div>
		<div class="col-sm-4">
			<!-- vendor details  -->
			<div id="vendorsInfo" ${selectedVendor != null ? '' : 'style="display:none;"'}>
				<span onclick="openAddVendor();" class="closebtn"><i class="fas fa-times"></i></span> <br>
				${selectedVendor.name} <br>
				${selectedVendor.phoneNo != "" ? 'Phone: ' : ''} ${selectedVendor.phoneNo} <br>
				${selectedVendor.address != "" ? 'Address: ' : ''} ${selectedVendor.address} <br> 
				${selectedVendor.website != "" ? 'Website: ' : ''} <a href="${selectedVendor.website}">Yelp</a>
			</div>
			
			<!-- budget form add here -->
			<div id="addVendor" style="border-style: solid; padding: 10px; border-width:1px; border-color: #cccccc; display: ${selectedVendor eq null ? 'inline-block' : 'none'};">
			<form:form id="formAddToBudget" action="addToBudget" method="post" modelAttribute="vendor">	
				<div class="form-group">
      				<form:select id="category" class="form-control ui-select category" path="category">
	        			<option selected>--- Select Category ---</option>
	        			<option value="Accommodation">Accommodation</option>
	        			<option value="Alcohol">Alcohol</option>
	       				<option value="Balloon Services">Balloon Services</option>
	       				<option value="Beauty">Beauty</option>
	       				<option value="Cake">Cake</option>
	       				<option value="Cards & Stationery">Cards & Stationery</option>
	       				<option value="Caterer">Caterer</option>
	       				<option value="Decorations">Decorations</option>
	       				<option value="Entertainment">Entertainment</option>
	       				<option value="Floral Design">Floral Design</option>
	       				<option value="Music">Music</option>
	       				<option value="Party Equipment Rental">Party Equipment Rental</option>
	       				<option value="Party Favors">Party Favors</option>
	       				<option value="Photography">Photography</option>
	       				<option value="Staff">Staff</option>
	       				<option value="Transportation">Transportation</option>
	       				<option value="Venue">Venue</option>
	       				<option value="Other">Other</option>
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
      				<div  class="form-group row">
      					<div class="col-sm-6 text-center">
      						<button type="submit" class="btn btn-success">Submit</button>
      					</div><br>
      					<div class="col-sm-6 text-center">
      						<button type="reset" class="btn btn-danger" id="btnCancelAddVendor">Cancel</button>
      					</div>
      				</div>
      			</form:form><br>
      		</div>
		</div>
		</div>
	</div>
		
<!-- body contents end -->
</div>
<script src="resources/js/jquery-editable-select.js"></script>
<script type="text/javascript">
/*** Sticky form ***/
$(document).ready(function(){
	//show selected value
	var valueFromLS = sessionStorage.getItem("selectedCategory");
	$(".category option[value='" + valueFromLS + "']").prop("selected",true);
});
$(document).ready(function(){
	//get selected value from dropdown
	$('.category').change(function(){
		var selectedCategory = $('.category').val();
		sessionStorage.setItem("selectedCategory",selectedCategory);
	});
});

$(document).ready(function(){
	var counter = 1;
	$("#btnAddItemPrice").click(function () {
		$('#txtItem').append('<input type="text" class="form-control" id="item' + counter + '" placeholder="Item" style="margin-bottom: 5px;" name="goodsList['+ counter + '].goodName">');
		$('#txtPrice').append('<input type="text" class="form-control" id="price' + counter + '" placeholder="Price" style="margin-bottom: 5px;" name="goodsList['+ counter + '].goodPrice">');
		counter++;
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

</script>

<jsp:include page="/WEB-INF/includes/footer.jsp"/>


