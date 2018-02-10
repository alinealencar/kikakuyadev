<!-- Change feature variable -->
<%! String feature = "Guests" ;%>

<% session.setAttribute("feature", feature); %>
<% session.setAttribute("title", "KIKAKUYA - " + feature); %>
<jsp:include page="/WEB-INF/includes/head.jsp" />
<jsp:include page="/WEB-INF/includes/header.jsp"/>
<div class="container">
	<!-- body contents start -->
		  <h1>NEW PAGE</h1>
		  <p>This is some text.</p> 
		  <img  src="resources/images/guests/message_circle_line.png" alt="message" class="img-fluid">
  	<!-- body contents end -->
</div>
<jsp:include page="/WEB-INF/includes/footer.jsp"/>
