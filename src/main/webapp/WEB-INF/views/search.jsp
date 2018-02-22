<!-- Change feature variable -->
<%! String feature = "Search" ;%>

<% session.setAttribute("feature", feature); %>
<% session.setAttribute("title", "KIKAKUYA - " + feature); %>
<jsp:include page="/WEB-INF/includes/head.jsp" />
<jsp:include page="/WEB-INF/includes/header.jsp"/>
<div class="container">
<!-- body contents start -->
	<h2 style="margin-top: 50px;">Search Vendors</h2>
	<form action="search" method="post" >
		<div class="form-group row" style="margin-top: 50px;">		
			<div class="col-sm-5 text-center">			
				<div>
					<input type="text" class="form-control" name="category" placeholder="Category" class="col-12" required>
					<br><br>
				</div>
			</div>
			<div class="col-sm-5 text-center">
				<div>
					<input type="text" class="form-control" name="location" placeholder="Location" class="col-12" required>
					<br><br>
				</div>
			</div>
			<div class="col-sm-2 text-center">
				<button type="submit" class="btn btn-info">
      				<span class="material-icons align-bottom" style="font-size: 150%;">search</span><span class="align-text-bottom"> Search</span>
   				</button>
			</div>				
		</div>
	</form>
<!-- body contents end -->
</div>
<jsp:include page="/WEB-INF/includes/footer.jsp"/>