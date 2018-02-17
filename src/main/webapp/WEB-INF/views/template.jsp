
<!-- Change feature variable -->
<%! String feature = "Search" ;%>

<% session.setAttribute("feature", feature); %>
<% session.setAttribute("title", "KIKAKUYA - " + feature); %>
<jsp:include page="/WEB-INF/includes/head.jsp" />
<jsp:include page="/WEB-INF/includes/header.jsp"/>
<div id="contents" class="container" style="margin-top: 50px;">
	<!-- body contents start -->
		  <h2>NEW PAGE</h2>
		  <p>This is some text.</p> 
		  <img  src="resources/images/guests/message_circle_line.png" alt="message" class="img-fluid">
  	<!-- body contents end -->
</div>
<jsp:include page="/WEB-INF/includes/footer.jsp"/>
