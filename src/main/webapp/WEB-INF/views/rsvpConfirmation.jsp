<!-- Change feature variable -->
<%! String feature = "RSVP Confirmation" ;%>
<% session.setAttribute("feature", feature); %>
<% session.setAttribute("title", "KIKAKUYA - " + feature); %>
<jsp:include page="/WEB-INF/includes/head.jsp" />
<jsp:include page="/WEB-INF/includes/header.jsp"/>
<div class="container">
	<h2>You have successfully sent RSVPs to all guests.</h2>
</div>
<jsp:include page="/WEB-INF/includes/footer.jsp"/>