<!-- Change feature variable -->
<%! String feature = "Lists" ;%>

<% session.setAttribute("feature", feature); %>
<% session.setAttribute("title", "KIKAKUYA - " + feature); %>
<jsp:include page="/WEB-INF/includes/head.jsp" />
<jsp:include page="/WEB-INF/includes/header.jsp"/>
<jsp:include page="/WEB-INF/includes/menu.jsp"/>
<div class="container"><!-- body contents start -->
	<div class="row">
		<div class="col-4">
			<div class="row">
			<div class="col-12">
				<h3>All lists</h3>
			</div>
			</div>
			<hr>
		</div>
		<div class="col-8">
			<div id="myDIV" class="listHeader">
				<div class="row">
					<div class="col-11">
						<h3>${listTitle}To-do list</h3>
					</div>
					<div class="col-1">
						<button  type="button" class="btn btn-link img-fluid showAddGuest" onclick="openAddGuest()">
		      				<span onclick="openEditGuest()"><i class="fas fa-edit"></i></span>
		   				</button>  
		   			</div>	   									
				</div>
				<div class="row">
					<div class="col-11">
						<input type="text" id="myInput" class="form-control" placeholder="Add item">
					</div>
					<div class="col-1">
			  			<button type="button" class="btn btn-link img-fluid showAddGuest" style="padding:0px;" onclick="newElement()">
		      				<span class="material-icons" style="background-color: #F1E9DA; color: #D90368; font-size: 250%; padding:0px;">add_circle</span>
		   				</button>
	   				</div>
   				</div>  		
			</div>
			<hr>
			<!-- list body -->
			<ul id="list">
			</ul>
		</div>
	</div> 	
</div><!-- body contents end -->
<script src="resources/js/list.js"></script>
<jsp:include page="/WEB-INF/includes/footer.jsp"/>

