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
		<!-- All list -->
		<div class="col-sm-4 d-none d-sm-block" style="border-right:1px solid #cccccc;">
			<div class="row">
				<div class="col-9">
					<h3>All lists</h3>
				</div>
				<div class="col-3">
					<button  type="button" class="btn btn-link img-fluid showAddGuest" onclick="openAddGuest()">
		      			<span onclick="openEditGuest()"><i class="fas fa-edit"></i></span>
		   			</button>  
		   		</div>
			</div>
			<form:form method="post" action="addList" modelAttribute="list">
			<div class="row">
				<div class="col-9">
					<form:input path="listTitle" type="text" id="listInput" class="form-control" placeholder="Name new list" />
				</div>
				<div class="col-3">
					<button type="button" class="btn btn-link img-fluid showAddGuest" style="padding:0px;" onclick="newElement()">
		    			<span class="material-icons" style="background-color: #F1E9DA; color: #D90368; font-size: 250%; padding:0px;">add_circle</span>
		   			</button>
	   			</div>
   			</div> 
   			</form:form> 		
			<hr>
			
			<!-- all list body -->
			<c:set var="cat" value="1" scope="page" />
			<ul id="allList">
				<c:forEach var="good" items="${vendor.value}">
	   				<div class="row">
	   					<div class= "col-2">
	   						<span><i class="fas fa-list-ul"></i></span>
	   					</div>
	   					<div class= "col-10">
	   						${listTitle}To-do list
	   					</div>
	   				</div>
				</c:forEach>		
			</ul>			
		</div>
		
		<!-- item list -->
		<div class="col-sm-8">
			<div id="myDIV" class="listHeader">
				<div class="row">
					<div class="col-1 d-block d-sm-none">
		      			<span onclick=""  style="color:#2E294E; font-size: 150%; padding:0px;"><i class="fas fa-bars"></i></span>
					</div>
					<div class="col-9">
						<h3>${listTitle}To-do list</h3>
					</div>
					<div class="col-2 text-right">
						<button  type="button" class="btn btn-link img-fluid" onclick="">
		      				<span><i class="fas fa-edit"></i></span>
		   				</button>  
		   			</div>	   									
				</div>
				<div class="row">
					<div class="col-10">
						<input type="text" id="itemInput" class="form-control" placeholder="Add item">
					</div>
					<div class="col-2">
			  			<button type="button" class="btn btn-link img-fluid" style="padding:0px;" onclick="newElement()">
		      				<span class="material-icons" style="background-color: #F1E9DA; color: #D90368; font-size: 250%; padding:0px;">add_circle</span>
		   				</button>
	   				</div>
   				</div>  		
			</div>
			<hr>
			<!-- item list body -->
			<ul id="itemList">
			</ul>
		</div>
	</div> 	
</div><!-- body contents end -->
<script src="resources/js/list.js"></script>
<jsp:include page="/WEB-INF/includes/footer.jsp"/>

