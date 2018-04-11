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
<script src="resources/js/validateBudget.js"></script>
<div class="container">
<!-- body contents start -->
	<div class="row">
		<div class="col-sm-8">
		<c:if test="${not empty editSuccess}">
			<div class="successAlert">${editSuccess}</div>
		</c:if>
		<c:if test="${not empty goodDeleted}">
			<div class="successAlert">${goodDeleted}</div>
		</c:if>
			<div id="addTotalBudget" class="text-center" ${noBudget ? '' :  'style="display:none;"'}>
				<span>It looks like you haven't added a budget for your event yet!</span><br>
				<span>Estimate the budget for your event below.</span><br> 
				<span>Don't worry about this step, you can always change your budget later!</span><br><br>
				<form:form action="enterTotalBudget" modelAttribute="eventForm" class="form-inline row text-center">
					<div class="col-12">
						<form:hidden path="eventId" value="1"/>
						<label>Total budget for the event: $ </label>
						<form:input type="number" path="totalBudget" class="form-control" oninput="validateEnterTotalBudget(this)"/>
						<input id="btnEnterTotalBudget" class="btn btn-info text-right" type="button" value="Enter"/>
						<div id="enterTotalBudgetError" class="formError text-center" style='font-size: 14px; text-align:left; display: none'><i class='fas fa-times'></i>  Please enter a budget</div>
					</div>
				</form:form> 
			</div> 
			<div id="showBudget" ${goodDeleted != '' ? 'style="display:none;"':''} ${noBudget ? 'style="display:none;"' : ''}>
			<div style="border-style: solid; padding: 10px; border-width:1px; border-color: #cccccc; margin-bottom:20px;">
				<!-- show budget -->
				<span class="float-right" onclick="openEditBudget()"><i class="fas fa-edit"></i></span>
				<div class="row text-center">
					<div class="col-9 col-sm-12" style="padding-top:15px;">
						<span  style="width: 150px; margin:0; font-size:200%;">Budget: <b>$ <script>document.write((${event.totalBudget}).toLocaleString());</script></b></span>
					</div>					
					<div class="col-3 d-block d-sm-none" onclick="openAddBudgetForm()">					
					<button  type="button" class="btn btn-link img-fluid" onclick="">
	      				<span class="material-icons" style="background-color: #F1E9DA; color: #D90368; font-size: 300%;">add_circle</span>
	   				</button>
					</div>

				</div>
				<hr>
				<c:set var="cat" value="1" scope="page" />
				<c:forEach var="category" items="${budgetInfo}">
					<fieldset id="categoryBorder" class="form-group" style="width:auto; padding: 10px; border-style: solid; border-width:1px; border-color: #cccccc">
	   				<legend  style="width:auto; margin-bottom: 0px; font-size: 1rem; border-color: #cccccc"><h3>${category.key}</h3></legend>
	   				<c:forEach var="vendor" items="${category.value}">
	   					<div class="row">
		   					<div class= "col-12">
							<div class="row " style="padding-left:20px;">
		   						<h4 style="margin-right:10px; text-decoration:underline;">${vendor.key.name}</h4>
				   				<!-- Get details of the vendor -->
			   					<button id="${vendor.key.vendorId}" type="submit" class="fabutton" onclick="openVendorsInfo(this.id)">
				   					<i class="fas fa-address-card" ></i>
								</button>
		   					</div>
							</div>
	   					</div>
	   					<c:forEach var="good" items="${vendor.value}">
	   						<div class="row">
	   							<div class= "col-5 text-right" >
	   								<h5>${good.goodName}</h5>
	   							</div>
	   							<div class= "col-2 text-center">
	   								<h5>--</h5>
	   							</div>
	   							<div class= "col-5">
	   								<h5><span class="category${cat}"><script>document.write((${good.goodPrice}).toLocaleString());</script></span></h5>
	   							</div>
	   						</div>
						</c:forEach>
						<hr>
					</c:forEach>

					<div class="row">
	   					<div class= "col-5 text-right" >
	   						<h4>Subtotal:</h4>
	   					</div>
	   					<div class= "col-2 text-center">
	   						<h5>--</h5>
	   					</div>
	   					<div class= "col-5">
	   						 <script>document.write(calculateSubtotal('category${cat}'));</script></h4>
	   					</div>
	   				</div>			
					<c:set var="cat" value="${cat + 1}" scope="page"/>
					</fieldset>
				</c:forEach>
				<div class="row text-center">
					<div class="col-12">
						<h3>Grand Total: <b>$<span id="totalBudget"><script>document.write(calculateTotal().toLocaleString());</script></span></b></h3>
					</div>
				</div>
				<div class="row text-center">
					<div class="col-12">
						<h3>Amount Remaining: <span id="amountRemaining">$<script>document.write(calculateAmountRemaining('${event.totalBudget}', calculateTotal()).toLocaleString());</script></span></h3>
					</div>
				</div>
				
			</div>	
			</div>
			<!-- edit budget -->
			<div id="editBudget" ${goodDeleted != '' ? '' : 'style="display:none;"'} >
			<div style="border-style: solid; padding: 10px; border-width:1px; border-color: #cccccc; margin-bottom:20px;">
				<div onclick="openShowBudget()" class="closebtn" style=" position: absolute;right: 25px;"><i class="fas fa-times"></i></div>
				<br>
				<form:form action="editBudget" method="post" modelAttribute="budgetForm" class="editBudgetForm">
					<!-- Fields for the delete operation -->
					<form:hidden path="category" value=""/>
					<form:hidden path="vendorId" value=""/>
	   				<form:hidden path="goodId" value=""/>
	   				<span id="editBudgetError" class="formError" style='font-size: 14px; text-align:center; display: none'><i class='fas fa-times'></i>  Please fill in missing fields</span>
	   				<div class="row">
		   				<div class="col-sm-9">
		   					<div class="row">
		   						<div class="col-5 text-right">
		   							<span style="font-size:25px;">Budget: $</span>
		   						</div>	
		   						<div class="col-7">
		   							<input type="number" class="form-control" id="totalBudgetE" name="totalBudget" value="${event.totalBudget}" oninput="validateEditTotalBudget(this)"/>
		   							<span id="totalBudgetError" class="formError" style='font-size: 10px; text-align:left; display: none'><i class='fas fa-times'></i>  Please enter a budget</span>
		   						</div>
		   					</div>
		   				</div>
		   				<div class="col-sm-3 text-right">
							<button id="btnSaveEditBudget" type="button" class="btn btn-info"">Save</button>
						</div>
	   				</div>	   				
					<hr>
					<c:set var="catEdit" value="1" scope="page" />
					<c:set var="count" value="0" scope="page" />
					<c:forEach var="category" items="${budgetInfo}" varStatus="catRow">
						<fieldset id="categoryBorder" class="form-group" style="width:auto; padding: 10px; border-style: solid; border-width:1px; border-color: #cccccc">	   					
		   					<legend  style="width:auto; margin-bottom: 0px; font-size: 1rem; border-color: #cccccc">
			   					<button onclick="deleteCategory('${category.key}');" class="fabutton absent"><i class="fas fa-minus-circle"></i></button>
			   					<h3>${category.key}</h3>
		   					</legend>
		   					<c:forEach var="vendor" items="${category.value}" varStatus="vendorRow">
		   						<button onclick="deleteVendor(${vendor.key.vendorId});" class="fabutton absent"><i class="fas fa-minus-circle"></i></button>
		   						<h4 style="margin-right:10px; text-decoration:underline;">${vendor.key.name}</h4><br>
		   						<c:forEach var="good" items="${vendor.value}" varStatus="status">
		   							<div class="row">
		   								<div class= "col-6 col-md-5" >
		   									<div class="row">
		   										<div class= "col-2">
					   								<button onclick="deleteGood(${vendor.key.vendorId}, ${good.goodId});" class="fabutton absent"><i class="fas fa-minus-circle"></i></button>
					   							</div>
					   							<div class= "col-10" >
					   								<input name="goodsList[${count}].goodName" value="${good.goodName}" class="form-control" oninput="validateEditGood(this)">
				   									<span class="formError goodError" style='font-size: 10px; text-align:left; display: none'><i class='fas fa-times'></i>  Please enter an item</span>
				   								</div>
				   							</div>
				   						</div>
			   							<div class= "col-md-2 text-center d-none d-md-block " >
			   								-- 
			   							</div> 
			   							<div class= "col-6 col-md-5" >
			   								<div class="row">
		   										<div class= "col-2">
		   											$
		   										</div>	
		   										<div class= "col-10">
				   									<input class="catEdit${catEdit} form-control" type="number" name="goodsList[${count}].goodPrice" value="${good.goodPrice}" oninput="validateEditPrice(this); calculateSubtotalLive('${event.totalBudget}','${catEdit}');"/>
													<span class="formError priceError" style='font-size: 10px; text-align:left; display: none'><i class='fas fa-times'></i>  Please enter a price</span>
												</div>
											<input type="hidden" name="goodsList[${count}].goodId" value="${good.goodId}"/>
											<c:set var="count" value="${count + 1}" scope="page"/>
											</div>
										</div>
									</div>
								</c:forEach>
								<hr>
							</c:forEach>
							<div class="row">
	   							<div class= "col-5 text-right" >
	   								<h4>Subtotal:</h4>
	   							</div>
	   							<div class= "col-2 text-center">
	   								<h5>--</h5>
	   							</div>
	   							<div class= "col-5">
	   						 		 <h4>$ <span id="subtotal${catEdit}" class="subtotalEdit"><script>calculateSubtotalLive('${event.totalBudget}', '${catEdit}');</script></span></h4>
	   							</div>
	   						</div>			
							<c:set var="catEdit" value="${catEdit + 1}" scope="page"/>
						</fieldset>
					</c:forEach>
					<div class="row text-center">
						<div class="col-12">
							<h3>Grand Total: $<span id="totalBudgetEdit"><script>calculateTotalEdit('${event.totalBudget}');</script></span></h3>
						</div>
					</div>
					<div class="row text-center">
						<div class="col-12">
							<h3>Amount Remaining: <span id="amountRemainingEdit">$<script>document.write(calculateAmountRemaining('${event.totalBudget}', calculateTotal()).toLocaleString());</script></span></h3>
						</div>
					</div>
				</form:form>
			</div>
			</div>
		</div>
		<!-- for small screen vendor's detail---------------------------------------------------------------------------->
		<div id="smBudget" class="sidenav"> 
			<div id="vendorsInfoSm">
				<fieldset class="form-group" style="width:auto; padding: 10px; border-style: solid; border-width:1px; border-color: #cccccc">
				<span onclick="closeVendorsInfo();" class="closebtn"><i class="fas fa-times"></i></span> <br>
				<h4><span id="selectedVendorName"></span></h4> <br>
				<b>Phone: </b> <span id="selectedVendorPhone"></span> <br>
				<b>Address: </b><br> <span id="selectedVendorAddress"></span> <br> 
				<b>Web site: </b><a id="selectedVendorWebsite" href="" target="_blank">Yelp</a>
				</fieldset>
			</div>
 		</div>
 		
 		<!-- for small screen add budget form ----------------------------------------------------------------------------------->
		<div id="smBudgetAddForm" class="sidenav d-block d-md-none">
			<div id="addVendor" style="border-style: solid; padding: 10px; border-width:1px; border-color: #cccccc; display: ${selectedVendor eq null ? 'inline-block' : 'none'};">
			<span onclick="closeAddBudgetForm();" class="closebtn"><i class="fas fa-times"></i></span> <br>
			<form:form id="formAddToBudget-sm" action="addToBudget" method="post" modelAttribute="vendor"> <!-- onsubmit="return validateBudget();"> -->
				<div class="form-group">
      				<form:select id="category-sm" class="category form-control ui-select" path="category">
	        			<!--option selected>--- Select Category ---</option-->
	        			<option value="">--- Select Category ---</option>
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
      				<span id="categoryError-sm" class="formError"></span>
   				</div>
   				<fieldset id="vendorFieldSet" class="form-group" style="width:auto; padding: 10px; border-style: solid; border-width:1px; border-color: #cccccc">
   				<legend  style="width:auto; margin-bottom: 0px; font-size: 1rem; border-color: #cccccc">Vendor</legend>
      				<form:select id="vendor-sm" class="form-control vendor" path="vendorId">
	        			<option value="">--- Vendor ---</option>
	       				<c:forEach items="${vendors}" var="vendor">
	       					<option value="${vendor.vendorId}" selected>${vendor.name}</option>
	       				</c:forEach>
      				</form:select>
      				<span id="vendorError-sm" class="formError"></span>
      				<div class="text-center">- or -</div>
      				<div class="text-center">
      				<button type="button" class="btn btn-info" onclick="location.href='/search'">
      						<span class="material-icons align-bottom" style="font-size: 150%;">search</span><span class="align-text-bottom">Search Vendor</span>
      				</button>
      				</div>
      				<div class="text-center">- or -</div>
      				<div class="text-center">
      				<button type="button" id="btnAddVendor-sm" class="btn btn-info">
      						<span class="material-icons align-bottom" style="font-size: 150%;">create</span><span class="align-text-bottom">Add Vendor</span>
      				</button>
      				</div>
      				
   				</fieldset>
   				<fieldset id="goodFieldSet" class="form-group" style="width:auto; padding: 10px; border-style: solid; border-width:1px; border-color: #cccccc">
   				<legend  style="width:auto; margin-bottom: 0px; font-size: 1rem; border-color: #cccccc">Items</legend>
   				<div id="item-price">
   				<c:forEach begin="0" end="${fn:length($vendor.goodsList)}" varStatus="loop">
	   				<div id="itemTextBoxGroup" class="row">
		   					<div id="txtItem-sm" class="col-6">
		   						<form:input type="text" class="item-sm form-control" oninput="validateItemSM(this)" id="item1" placeholder="Item" style="margin-bottom: 5px;" path="goodsList[${loop.index}].goodName"/>
		   						
		   					</div>
		   					<div id="txtPrice-sm" class="col-6">
		   						<form:input type="text" class="price-sm form-control" oninput="validatePriceSM(this)" id="price1" placeholder="Price" style="margin-bottom: 5px;" path="goodsList[${loop.index}].goodPrice" />
		   						
		   					</div>
		   			</div>
		   			</c:forEach>
		   			<div class="col-6">
			   			<span id="itemError-sm" class="formError"></span>
			   		</div>
			   		<div id="priceErrorSM" class="col-6">
			   			<span id="priceError-sm" class="formError"></span>
					</div>
	   				<div class="text-center">
						<button id="btnAddItemPrice-sm" type="button" class="btn btn-link" style="margin: 10px;">
      						<span class="material-icons" style="font-size: 170%; background-color: #F1E9DA; color: #D90368;">add_circle</span><span class="align-text-bottom" style="color: #D90368; font-size: 20px"></span>
      					</button>
      					<button id="btnRemoveItemPrice-sm" type="button" class="btn btn-link" style="margin: 10px;">
      						<span class="material-icons" style="font-size: 170%; background-color: #F1E9DA; color: #D90368;">remove_circle</span><span class="align-text-bottom" style="color: #D90368; font-size: 20px"></span>
      					</button>
      				</div>
      			</div>
   				</fieldset>
   				<div class="text-center">
					<button type="button" id="addBudget-sm" class="btn btn-primary" style="margin: 10px; background-color: #D90368; border-color: #D90368; ">
	      				<span class="material-icons" style="font-size: 110%; background-color: #D90368; color: #F1E9DA;">add_circle</span><span class="align-text-bottom">Add</span>
	      			</button>
      			</div>
      			
			</form:form>
			
			<div id="enterVendor-sm" class="col-sm-12" style="border-style: solid; padding: 10px; border-width:1px; border-color: #cccccc; display: none;">
				<form:form id="addBudgetVenForm-sm" action="addVendor" method="post" modelAttribute="vendor">
      				<div class="text-center" id="enterVendor">
      					<form:input type="text" id="vendorName-sm" class="addName form-control" oninput="validateNameSM(this)" placeholder="Vendor Name" path="name" />
      						<span id="nameError-sm" class="formError"></span>
      					<form:input type="text" class="addAddress form-control" placeholder="Address" path="address" />
      						<span id="addressError" class="formError"></span>
      					<form:input type="text" id="phone-sm" class="addPhoneNo form-control" oninput="validatePhoneNoSM(this)" placeholder="Phone Number" path="phoneNo" />
      						<span id="phoneError-sm" class="formError"></span>
      					<form:input type="text" id="website-sm" class="form-control" oninput="validateWebsiteSM(this)" placeholder="Website" path="website" />
      						<span id="websiteError-sm" class="formError"></span>
      				</div><br>
      				<div  class="form-group row">
      					<div class="col-sm-6 text-center">
      						<button type="button" class="btn btn-success" id="btnEnterVendor-sm">Submit</button>
      					</div><br>
      					<div class="col-sm-6 text-center">
      						<button type="reset" class="btn btn-danger" id="btnCancelAddVendor-sm">Cancel</button>
      					</div>
      				</div>
      			</form:form><br>
      		</div>
		</div>
 		</div>
 		
  
		<div class="col-sm-4 d-none d-md-block">
			<!-- budget form add here -->		
			<!-- for big screen budget form ----------------------------------------------------------------------------------->
			<div id="addVendor" style="border-style: solid; padding: 10px; border-width:1px; border-color: #cccccc; display: ${selectedVendor eq null ? 'inline-block' : 'none'};">
			<form:form id="formAddToBudget" action="addToBudget" method="post" modelAttribute="vendor">
				<div class="form-group">
      				<form:select id="category-big" class="category form-control ui-select" path="category">
	        			<!--option selected>--- Select Category ---</option-->
	        			<option value="">--- Select Category ---</option>
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
      				<span id="categoryError" class="formError"></span>
   				</div>
   				<fieldset id="vendorFieldSet" class="form-group" style="width:auto; padding: 10px; border-style: solid; border-width:1px; border-color: #cccccc">
   				<legend  style="width:auto; margin-bottom: 0px; font-size: 1rem; border-color: #cccccc">Vendor</legend>
      				<form:select id="vendor-big" class="vendor form-control" path="vendorId">
	        			<option value="">--- Vendor ---</option>
	       				<c:forEach items="${vendors}" var="vendor">
	       					<option value="${vendor.vendorId}" selected>${vendor.name}</option>
	       				</c:forEach>
      				</form:select>
      					<span id="vendorError" class="formError"></span>
      				<div class="text-center">- or -</div>
      				<div class="text-center">
      				<button type="button" class="btn btn-info" onclick="location.href='/search'">
      						<span class="material-icons align-bottom" style="font-size: 150%;">search</span><span class="align-text-bottom">Search Vendor</span>
      				</button>
      				</div>
      				<div class="text-center">- or -</div>
      				<div class="text-center">
      				<button type="button" id="btnAddVendor-big" class="btn btn-info btnAddVendor">
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
		   						<form:input type="text" class="item-big form-control" oninput="validateItem(this)" id="item1" placeholder="Item" style="margin-bottom: 5px;" path="goodsList[${loop.index}].goodName"/>
				
		   					</div>
		   					<div id="txtPrice" class="col-6">
		   						<form:input type="text" class="price-big form-control" oninput="validatePrice(this)" id="price1" placeholder="Price" style="margin-bottom: 5px;" path="goodsList[${loop.index}].goodPrice" />
		   					</div>
		   			</div>
		   			</c:forEach>
		   				<div class="col-6">
			   				<span id="itemError" class="formError"></span>
			   				
			   			</div>
			   			<div id="priceErrorSM" class="col-6">
			   				<span id="priceError" class="formError"></span>
						</div>
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
					<button type="button" id="addBudget" class="btn btn-primary" style="margin: 10px; background-color: #D90368; border-color: #D90368;">
	      				<span class="material-icons" style="font-size: 110%; background-color: #D90368; color: #F1E9DA;">add_circle</span><span class="align-text-bottom">Add</span>
	      			</button>
      			</div>
      			
			</form:form>
			
			<div id="enterVendorBig" class="col-sm-12" style="border-style: solid; padding: 10px; border-width:1px; border-color: #cccccc; display: none;">
				<form:form id="addBudgetVenForm" class="addBudgetVendorForm" action="addVendor" method="post" modelAttribute="vendor"><!-- onsubmit="return validateBudget();" -->
      				<div class="text-center" id="enterVendor">
      					<form:input type="text" id="vendorName" class="addNameB form-control" oninput="validateName(this)" placeholder="Vendor Name" path="name" />
      						<span id="nameError" class="formError"></span>
      					<form:input type="text" id="address" class="addAddressB form-control" placeholder="Address" path="address" />
      						<span id="addressErrorB" class="formError"></span>
      					<form:input type="text" id="phone" class="addPhoneNoB form-control" placeholder="Phone Number" path="phoneNo" oninput="validatePhoneNo(this)"/>
      						<span id="phoneError" class="formError"></span>
      					<form:input type="text" id="website" class="form-control" placeholder="Website" path="website" oninput="validateWebsite(this)"/>
      						<span id="websiteError" class="formError"></span>
      				</div><br>
      				<div  class="form-group row">
      					<div class="col-sm-6 text-center">
      						<!--button type="submit" class="btn btn-success" id="btnEnterVendor">Submit</button-->
      						<input id="btnEnterVendor" class="btn btn-success" type="button" value="Done"/>
      					</div><br>
      					<div class="col-sm-6 text-center">
      						<button type="reset" class="btn btn-danger" id="btnCancelAddVendor">Cancel</button>
      					</div>
      				</div>
      			</form:form><br>
      		</div>
		</div><!-- end of budget form add -->
		
		</div>
	</div>
		
<!-- body contents end -->
</div>
<script src="resources/js/jquery-editable-select.js"></script>
<script type="text/javascript">
</script>
<jsp:include page="/WEB-INF/includes/footer.jsp"/>