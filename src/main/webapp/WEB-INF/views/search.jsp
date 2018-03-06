<!-- Change feature variable -->
<%! String feature = "Search" ;%>

<% session.setAttribute("feature", feature); %>
<% session.setAttribute("title", "KIKAKUYA - " + feature); %>
<jsp:include page="/WEB-INF/includes/head.jsp" />
<jsp:include page="/WEB-INF/includes/header.jsp"/>
<jsp:include page="/WEB-INF/includes/menu.jsp"/>
<div class="container">
<!-- body contents start -->
	<h2>Search Vendors</h2>
	<form action="search" method="post" onsubmit="return validateSearch();">
		<div class="form-group row" style="margin-top: 50px;">		
			<div class="col-sm-5 text-center">			
				<div>
					<input type="text" class="category form-control" oninput="validateCategory()" name="category" placeholder="Category" class="col-12">
					<span id="categoryError" class="formError"></span>
					<br><br>
				</div>
			</div>
			<div class="col-sm-5 text-center">
				<div>
					<input type="text" class="location form-control" oninput="validateLocation()" name="location" placeholder="Location" class="col-12">
					<span id="locationError" class="formError"></span>
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
<script src="resources/js/validateSearch.js"></script>
<jsp:include page="/WEB-INF/includes/footer.jsp"/>