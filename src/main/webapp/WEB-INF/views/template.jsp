
<!-- Change feature variable -->
<%! String feature = "Template" ;%>

<% session.setAttribute("feature", feature); %>
<% session.setAttribute("title", "KIKAKUYA - " + feature); %>
<jsp:include page="/WEB-INF/includes/head.jsp" />
<jsp:include page="/WEB-INF/includes/header.jsp"/>
<jsp:include page="/WEB-INF/includes/menu.jsp"/>
<div class="container">
	<!-- body contents start -->
		  <h1>NEW PAGE</h1>
		  <p>This is some text.</p> 
  	<!-- body contents end -->
</div>
<jsp:include page="/WEB-INF/includes/footer.jsp"/>
