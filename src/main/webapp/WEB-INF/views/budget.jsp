<!-- Change feature variable -->
<%! String feature = "Budget" ;%>

<% session.setAttribute("feature", feature); %>
<% session.setAttribute("title", "KIKAKUYA - " + feature); %>
<jsp:include page="/WEB-INF/includes/head.jsp" />
<jsp:include page="/WEB-INF/includes/header.jsp"/>
<div class="container">
<!-- body contents start -->
	<div class="row">
		<div class="col-sm-8">
			<!-- budget form here -->
		</div>
		<div class="col-sm-4">
			<!-- budget form add here -->
		</div>
	</div>
<!-- body contents end -->
</div>
<jsp:include page="/WEB-INF/includes/footer.jsp"/>
