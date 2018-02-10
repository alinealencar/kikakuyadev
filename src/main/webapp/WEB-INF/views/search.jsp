<!-- Change feature variable -->
<%! String feature = "Search" ;%>

<% session.setAttribute("feature", feature); %>
<% session.setAttribute("title", "KIKAKUYA - " + feature); %>
<jsp:include page="/WEB-INF/includes/head.jsp" />
<jsp:include page="/WEB-INF/includes/header.jsp"/>
<div class="container">
	<!-- body contents start -->
	<form action="search" method="post" >
		<div>
			<input name="category" placeholder="Category">
			<br><br>
		</div>
		<div>
			<input name="location" placeholder="Location">
			<br><br>
		</div>
		<input type = "submit" value = "Search" />
	</form>
<!-- body contents end -->
</div>
<jsp:include page="/WEB-INF/includes/footer.jsp"/>