
<!-- Change feature variable -->
<%! String feature = "Calendar" ;%>

<% session.setAttribute("feature", feature); %>
<% session.setAttribute("title", "KIKAKUYA - " + feature); %>
<jsp:include page="/WEB-INF/includes/head.jsp" />
<jsp:include page="/WEB-INF/includes/header.jsp"/>
<jsp:include page="/WEB-INF/includes/menu.jsp"/>
<div class="container">
	<!-- body contents start -->
		  <h1>Calendar</h1>
		  <p>This is some text.</p> 
		  <img  src="resources/images/guests/message_circle_line.png" alt="message" class="img-fluid"><br>
		  <img  src="resources/images/guests/message_circle_line.png" alt="message" class="img-fluid"><br>
		  <img  src="resources/images/guests/message_circle_line.png" alt="message" class="img-fluid"><br>
		  <img  src="resources/images/guests/message_circle_line.png" alt="message" class="img-fluid"><br>
		  <img  src="resources/images/guests/message_circle_line.png" alt="message" class="img-fluid"><br>
		  <img  src="resources/images/guests/message_circle_line.png" alt="message" class="img-fluid"><br>
  	<!-- body contents end -->
</div>
<jsp:include page="/WEB-INF/includes/footer.jsp"/>
