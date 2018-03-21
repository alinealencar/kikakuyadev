<!-- Change feature variable -->
<%! String feature = "Lists" ;%>

<% session.setAttribute("feature", feature); %>
<% session.setAttribute("title", "KIKAKUYA - " + feature); %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="/WEB-INF/includes/head.jsp" />
<jsp:include page="/WEB-INF/includes/header.jsp"/>
<jsp:include page="/WEB-INF/includes/menu.jsp"/>
<script src="resources/js/list.js"></script>
<div class="container"><!-- body contents start -->
	<div class="row">
		<!-- for small screen ------------------------------------------------------------------------------>
		<!-- Show All lists -->
		<!-- All lists header-->		
		<div id="showAllLists-sm" class="sideAllLists">
			<div class="sideListPad">
			<div class="row ">
				<div class="col-12 text-right">
					<span id="closeShowAllLists" class="closebtn" onclick="closeAllLists()"><i class="fas fa-times"></i></span>
				</div>
			</div>
			<div class="row">
				<div class="col-9">
					<h3>All lists</h3>
				</div>
				<c:if test="${not empty lists}">
					<div class="col-3 text-right" >
						<button  type="button" class="btn btn-link img-fluid" onclick="openEditAllListSm()">
		      				<span><i class="fas fa-edit"></i></span>
		   				</button>  
		   			</div>
		   		</c:if>
			</div>
			<form:form method="post" action="addList" modelAttribute="list" onsubmit="return validateListTitleSM();">
			<div class="row">
				<div class="col-9">
					<form:input path="listTitle" type="text" id="listInput" class="titleListSM form-control" placeholder="Name new list" oninput="validateNameSM()"/>
					<span id="titleErrorSM" class="formError"></span>
				</div>
				<div class="col-3">
					<button type="submit" class="btn btn-link img-fluid showAddGuest" style="padding:0px;"> 
		    			<span class="material-icons" style="background-color: #F1E9DA; color: #D90368; font-size: 250%; padding:0px;">add_circle</span>
		   			</button>
	   			</div>
   			</div> 
   			</form:form> 		
			<hr>
			
			<!-- All lists body -->
			<!--<c:set var="cat" value="1" scope="page" />-->
			<ul id="showAllListBody-sm">
				<c:forEach var="list" items="${lists}" >
					<form:form class="formSelectList" action="showList" method="post" modelAttribute="list">
						<form:hidden path="listId" value="${list.listId}" />
						<li class="showAllListLiSm">
							<button id="btnSelectList" class="btn-block btnSelectListClass" type="submit">
			   					<span><i class="fas fa-list-ul"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${list.listTitle}</span>
			   				</button>
						</li>
					</form:form>	
				</c:forEach>	
			</ul>
		</div>	
		</div>
		<!-- End of Show All list -->
		
		<!-- Edit All lists  -->
		<!-- All lists header-->
		<div id="editAllLists-sm" class="sideAllLists" style="display:none;" >
		<div class="sideListPad">
			<div class="row ">
				<div class="col-12 text-right">
					<button  type="button" class="btn btn-link img-fluid" onclick="closeEditAllListsSm()">
						<span id="closeEditAllLists"><i class="fas fa-times"></i></span>
					</button>
				</div>
			</div>
			<div class="row">
				<div class="col-9">
					<h3>All lists</h3>
				</div>
				<div class="col-3 text-right">
					<button type="button" id="btnSaveEditList-sm" class="btn btn-primary" style="margin: 10px; background-color: #D90368; border-color: #D90368; ">
		    			Save
		    		</button>
		    	</div>
		   	</div>
		   	<hr>
			
		<!-- All lists body **********************************-->
			<ul id="editAllListBody-sm">	
				<form:form id="formEditList-sm" action="editList" method="post" modelAttribute="list">
					<form:hidden id="listIdHidden-sm" path="listId" value=""/>
					<c:forEach var="list" items="${lists}" varStatus="loop">
						<form:hidden path="listsList[${loop.index}].listId" value="${list.listId}" />
						<li>					
		   					<div class="row">
		   						<div class="col-2 btnListDelete">
	   								<button onclick="deleteListSM(${list.listId})" class="fabutton absent"><i class="fas fa-minus-circle"></i></button>
	   							</div>
		   						<div class="col-10">
		   							<form:input path="listsList[${loop.index}].listTitle" value="${list.listTitle}" class="form-control" />
		   						</div>
		   					</div>							
						</li>
					</c:forEach>
				</form:form>	
			</ul>
		</div>							
		</div>
		<!-- End of Edit All lists -->
		<!-- End of for small screen -->
		
		<!-- for big screen ------------------------------------------------------------------------------------------->
		<div id="allListsDiv" class="col-sm-4 d-none d-sm-block" style="border-right:1px solid #cccccc;">
		<!-- Show All lists -->
		<!-- All lists header-->		
		<div id="showAllLists">
			<div class="row">
				<div class="col-9">
					<h3>All lists</h3>
				</div>
				<c:if test="${not empty lists}">
					<div class="col-3 text-right" >
						<button  type="button" class="btn btn-link img-fluid" onclick="openEditAllLists()">
		      				<span><i class="fas fa-edit"></i></span>
		   				</button>  
		   			</div>
		   		</c:if>
			</div>
			<form:form method="post" action="addList" modelAttribute="list" onsubmit="return validateListTitle();">
			<div class="row">
				<div class="col-9">
					<form:input path="listTitle" type="text" id="listInput" class="titleList form-control" oninput="validateName()" placeholder="Name new list" />
					<span id="titleError" class="formError"></span>
				</div>
				<div class="col-3">
					<button type="submit" class="btn btn-link img-fluid showAddGuest" style="padding:0px;"> 
		    			<span class="material-icons" style="background-color: #F1E9DA; color: #D90368; font-size: 250%; padding:0px;">add_circle</span>
		   			</button>
	   			</div>
   			</div> 
   			</form:form> 		
			<hr>
			
			<!-- All lists body -->
			<!--<c:set var="cat" value="1" scope="page" />-->
			<ul id="showAllListBody">
				<c:forEach var="list" items="${lists}" >
					<form:form class="formSelectList" action="showList" method="post" modelAttribute="list">
						<form:hidden path="listId" value="${list.listId}" />
						<c:choose>
							<c:when test="${selectedList.listTitle eq list.listTitle}">
								<li class="showAllListLi">
									<button id="btnSelectList" class="btn-block btnSelectListClass" type="submit" style="background-color: #888!important; color: #fff;">
			   							<span><i class="fas fa-list-ul"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${list.listTitle}</span>
			   						</button>
								</li>
							</c:when>
							<c:otherwise>
								<li class="showAllListLi">
									<button id="btnSelectList" class="btn-block btnSelectListClass" type="submit">
			   							<span><i class="fas fa-list-ul"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${list.listTitle}</span>
			   						</button>
								</li>
							</c:otherwise>
						</c:choose>
					</form:form>	
				</c:forEach>	
			</ul>
		</div>
		<!-- End of Show All list -->
		
		<!-- Edit All lists  -->
		<!-- All lists header-->
		<div id="editAllLists" style="display:none;">
			<div class="row">
				<div class="col-6">
					<h3>All lists</h3>
				</div>
				<div class="col-3 text-right">
					<button type="button" id="btnSaveEditList" class="btn btn-primary" style="margin: 10px; background-color: #D90368; border-color: #D90368; " onclick="validateListTitleE()">
		    			Save
		    		</button>
		    	</div>
				<div class="col-3">
					<button  type="button" class="btn btn-link img-fluid showAddGuest" onclick="closeEditAllLists()">
		      			<span onclick="closeEditAllLists()"><i class="fas fa-times"></i></span>
		   			</button>  
		   		</div>
		   	</div>
		   	<hr>
			
		<!-- All lists body -->
			<ul id="editAllListBody">	
				<form:form id="formEditList" action="editList" method="post" modelAttribute="list">
					<form:hidden id="listIdHidden" path="listId" value=""/>
					<c:forEach var="list" items="${lists}" varStatus="loop">
						<form:hidden path="listsList[${loop.index}].listId" value="${list.listId}"/>
						
						<li>					
		   					<div class="row">
		   						<div class="col-2 btnListDelete">
	   								<button onclick="deleteList(${list.listId})" class="fabutton absent"><i class="fas fa-minus-circle"></i></button>
	   							</div>
		   						<div class="col-10">
		   							<form:input path="listsList[${loop.index}].listTitle" value="${list.listTitle}" class="titleListE form-control" oninput="validateNameE()" />
		   							<span id="titleErrorE" class="formError"></span>
		   						</div>
		   					</div>							
						</li>
					</c:forEach>
				</form:form>	
			</ul>							
		</div>
		<!-- End of Edit All lists -->
		<!-- End of for big screen -->
		</div>
		<!-- *****************************************************************************************************column change -->
		<!-- Show item list  -->
		<div class="col-sm-8" id="itemsDiv">
		<!-- item list header -->		
			<c:choose>
				<c:when test="${empty noListMessage}">									
					<div id="myDIV" class="listHeader">
						<div class="row">
							<div class="col-1 d-block d-sm-none">
			      				<span onclick="openAllLists()"  style="color:#2E294E; font-size: 150%; padding:0px;"><i class="fas fa-bars"></i></span>
							</div>
							<div class="col-7">
								<h3>${selectedList.listTitle}</h3>
							</div>
							<c:if test="${not empty items}">
								<div class="col-5 text-right d-none d-sm-block">
									<button  type="button" class="btn btn-link img-fluid" onclick="openEditItemList()">
			      						<span><i class="fas fa-edit"></i></span>
			   						</button>  
			   					</div>	   		
								<div class="col-4 text-right d-block d-sm-none">
									<button  type="button" class="btn btn-link img-fluid" onclick="openEditItemList()">
			      						<span><i class="fas fa-edit"></i></span>
			   						</button>  
			   					</div>	   	
			   				</c:if>								
						</div>
						<form:form id="formAddItem" action="addItem" method="post" modelAttribute="item">
							<div class="row">
								<div class="col-10">
									<form:input path="itemName" id="itemInput" class="form-control" placeholder="Add item" />
								</div>						
								<div class="col-2">
					  				<button type="submit" class="btn btn-link img-fluid" style="padding:0px;"> <!-- onclick="newElement()"> -->
				      					<span class="material-icons" style="background-color: #F1E9DA; color: #D90368; font-size: 250%; padding:0px;">add_circle</span>
				   					</button>
			   					</div>
		   					</div>	
	   					</form:form>	
					</div>
			
				<hr>
			<!-- item list body -->
			<c:if test="${not empty noItemsMsg}">
				<div class="text-center">
					<h5>${noItemsMsg}</h5>
				</div>
				<div class="text-center">
					<img class="img-fluid" src="resources/images/general/not_found.png" alt="not found" height="200" width="200">
				</div>
			</c:if>
			<ul id="itemList">
			<c:if test="${fn:length(items) > 0}">
				<c:forEach var="item" items="${items}">
					<form:form id="formUpdateItemStatus" action="updateItemStatus" method="post" modelAttribute="item">
						<c:choose>
							<c:when test="${item.itemStatus eq 0}">
								<li><form:checkbox path="itemStatus" class=".checkbox-info itemStatusChk" value="1" onClick="this.form.submit()"/>
								&nbsp;&nbsp;&nbsp;${item.itemName}</li>
							</c:when>
							<c:otherwise>
								<li><form:checkbox path="itemStatus" class=".checkbox-info itemStatusChk" value="1" onClick="this.form.submit()" checked="true"/>
								&nbsp;&nbsp;&nbsp;${item.itemName}</li>
							</c:otherwise>
						</c:choose>
						<form:hidden path="itemId" value="${item.itemId}"/>
					</form:form>
				</c:forEach>
				</c:if>
				<ul id="itemList">
					<c:if test="${fn:length(items) > 0}">
						<c:forEach var="item" items="${items}">
								<form:form id="formUpdateItemStatus" action="updateItemStatus" method="post" modelAttribute="item">
										<c:choose>
											<c:when test="${item.itemStatus eq 0}">
												<li><form:checkbox path="itemStatus" class=".checkbox-info itemStatusChk" value="1" onClick="this.form.submit()"/>
												&nbsp;&nbsp;&nbsp;${item.itemName}</li>
											</c:when>
											<c:otherwise>
												<li><form:checkbox path="itemStatus" class=".checkbox-info itemStatusChk" value="1" onClick="this.form.submit()" checked="true"/>
												&nbsp;&nbsp;&nbsp;${item.itemName}</li>
											</c:otherwise>
										</c:choose>
									<form:hidden path="itemId" value="${item.itemId}"/>
								</form:form>
							</c:forEach>
						</c:if>
					</ul>
				</c:when>
				<c:otherwise>
					<div class="row">
						<div class="col-1 d-block d-sm-none">
		      				<span onclick="openAllLists()"  style="color:#2E294E; font-size: 150%; padding:0px;"><i class="fas fa-bars"></i></span>
						</div>
						<div class="col-11 text-center">
							<h4>${noListMessage}</h4>
						</div>
						<div class="col-12 text-center">
							<img class="img-fluid" src="resources/images/general/not_found.png" alt="not found" height="200" width="200">
						</div>
					</div>					
				</c:otherwise>
			</c:choose>
		</div>

				
		<!-- End of Show item list -->	
		
		<!-- Edit item list  -->
		<!-- item lists header-->
		<div class="col-sm-8" id="editItemList" style="display: none;">
			<div id="myDIV" class="listHeader">
				<div class="row">
					<div class="col-1 d-block d-sm-none">
			      		<span onclick=""  style="color:#2E294E; font-size: 150%; padding:0px;"><i class="fas fa-bars"></i></span>
					</div>
					<div class="col-6 d-block d-sm-none">
						<h3>${selectedList.listTitle}</h3>
					</div>
					<div class="col-9 d-none d-sm-block">
						<h3>${selectedList.listTitle}</h3>
					</div>
	      			<div class="col-2">
						<button type="button" id="btnSaveEditItem" class="btn btn-primary" style="margin: 10px; background-color: #D90368; border-color: #D90368; ">
	      					Save
	      				</button>
	      			</div>
					<div class="col-3 d-block d-sm-none text-right">
						<button  type="button" class="btn btn-link img-fluid" onclick="closeEditItemList()">
			      			<span><i class="fas fa-times"></i></span>
			   			</button>  
			   		</div>
			   		<div class="col-1 d-none d-sm-block text-right">
						<button  type="button" class="btn btn-link img-fluid" onclick="closeEditItemList()">
			      			<span><i class="fas fa-times"></i></span>
			   			</button>  
			   		</div>	   			   									
				</div>
 			</div>		
				
			<hr>
		<!-- item list body -->
			<ul id="editItemListBody">
				<form:form id="formEditItem" action="editItem" method="post" modelAttribute="item">
					<form:hidden id="itemIdHidden" path="itemId" value=""/>
					<c:forEach var="item" items="${items}" varStatus="loop">
						<form:hidden path="itemsList[${loop.index}].itemId" value="${item.itemId}" />
						<li>
							<div class="row">
								<div class="col-1 btnListDelete">
	   								<button onclick="deleteItem(${item.itemId})" class="fabutton absent"><i class="fas fa-minus-circle"></i></button>
	   							</div>
		   						<div class="col-11">
		   							<form:input path="itemsList[${loop.index}].itemName" value="${item.itemName}" class="form-control" />
		   						</div>
		   					</div>
	   					</li>
					</c:forEach>
				</form:form>
			</ul>
		   						
		</div>
		<!-- End of Edit item lists -->	
			
	</div> <!-- .row for all contents -->	
</div><!-- body contents end -->

<script src="resources/js/validateList.js"></script>
<jsp:include page="/WEB-INF/includes/footer.jsp"/>
<script src="resources/js/jquery-foggy.js"></script>
