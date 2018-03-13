<!-- Change feature variable -->
<%! String feature = "Lists" ;%>

<% session.setAttribute("feature", feature); %>
<% session.setAttribute("title", "KIKAKUYA - " + feature); %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<jsp:include page="/WEB-INF/includes/head.jsp" />
<jsp:include page="/WEB-INF/includes/header.jsp"/>
<jsp:include page="/WEB-INF/includes/menu.jsp"/>

<div class="container"><!-- body contents start -->
	<div class="row">
		<!-- Show All lists -->
		<!-- All lists header-->
		<div id="showAllLists" class="col-sm-4" style="border-right:1px solid #cccccc;">
			<div class="row">
				<div class="col-9">
					<h3>All lists</h3>
				</div>
				<div class="col-3 text-right" >
					<button  type="button" class="btn btn-link img-fluid showAddGuest" onclick="openEditAllLists()">
		      			<span onclick="openEditAllLists()"><i class="fas fa-edit"></i></span>
		   			</button>  
		   		</div>
			</div>
			<form:form method="post" action="addList" modelAttribute="list">
			<div class="row">
				<div class="col-9">
					<form:input path="listTitle" type="text" id="listInput" class="form-control" placeholder="Name new list" />
				</div>
				<div class="col-3">
					<button type="submit" class="btn btn-link img-fluid showAddGuest" style="padding:0px;" onclick="newElement()"> 
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
						<li class="showAllListLi">
							<button id="btnSelectList" class="btn-block" type="submit">
			   					<span><i class="fas fa-list-ul"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${list.listTitle}</span>
			   				</button>
						</li>
					</form:form>	
				</c:forEach>	
			</ul>
		</div>
		<!-- End of Show All list -->
		
		<!-- Edit All lists  -->
		<!-- All lists header-->
		<div id="editAllLists" class="col-sm-4" style="display: none; border-right:1px solid #cccccc;">
			<div class="row">
				<div class="col-9">
					<h3>All lists</h3>
				</div>
				
				<div class="col-3">
					<button  type="button" class="btn btn-link img-fluid" onclick="closeEditAllLists()">
		      			<span onclick="closeEditAllLists()"><i class="fas fa-times"></i></span>
		   			</button>  
		   		</div>
			</div>
			<div class="row">
				<div class="col-12 text-right">
					<button type="button" id="" class="btn btn-primary" style="margin: 10px; background-color: #D90368; border-color: #D90368; ">
	      				Save
	      			</button>
	      		</div>
	      	</div>
			<hr>
			
		<!-- All lists body -->
			<ul id="editAllListBody">	
				<c:forEach var="list" items="${lists}" >
					<li>					
		   				<div class="row">
		   					<div class="col-2 btnListDelete">
	   							<button onclick="" class="fabutton absent"><i class="fas fa-minus-circle"></i></button>
	   						</div>
		   					<div class="col-10">
		   						<input name="" value="${list.listTitle}" class="form-control">
		   					</div>
		   				</div>							
					</li>	
				</c:forEach>
			</ul>	
		   					
				
		   						
		</div>
		<!-- End of Edit All lists -->
		<!-- *****************************************************************************************************column change -->
		<!-- Show item list  -->
		<!-- item list header -->
		<c:choose>
			<c:when test="${empty noListMessage}">
				<div class="col-sm-8" id="itemsDiv">
				<div id="myDIV" class="listHeader">
					<div class="row">
						<div class="col-1 d-block d-sm-none">
		      				<span onclick=""  style="color:#2E294E; font-size: 150%; padding:0px;"><i class="fas fa-bars"></i></span>
						</div>
						<div class="col-7">
							<h3>${selectedList.listTitle}</h3>
						</div>
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
			<ul id="itemList">
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
			</ul>
		</div>
		</c:when>
				<c:otherwise>
					<br><br><br>
					<div class="text-center">
						<h4>&nbsp;&nbsp;&nbsp;${noListMessage}</h4>
					</div>
				</c:otherwise>
			</c:choose>

				
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
						<button type="button" id="" class="btn btn-primary" style="margin: 10px; background-color: #D90368; border-color: #D90368; ">
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
		<!-- All lists body -->
			<ul id="editItemListBody">
				<c:forEach var="item" items="${items}">
					<li>
						<div class="row">
		   					<div class="col-12">
		   						<input name="" value="${item.itemName}" class="form-control">
		   					</div>
		   				</div>
	   				</li>
				</c:forEach>
			</ul>
		   						
		</div>
		<!-- End of Edit item lists -->	
			
	</div> <!-- .row for all contents -->	
</div><!-- body contents end -->
<script src="resources/js/list.js"></script>
<jsp:include page="/WEB-INF/includes/footer.jsp"/>

