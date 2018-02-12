<!-- Change feature variable -->
<%! String feature = "Guests" ;%>

<% session.setAttribute("feature", feature); %>
<% session.setAttribute("title", "KIKAKUYA - " + feature); %>
<jsp:include page="/WEB-INF/includes/head.jsp" />
<jsp:include page="/WEB-INF/includes/header.jsp"/>
<div class="container">
<!-- body contents start -->
	<div class="row">
		<form action="sendMessage" method="get"><input class="img-fluid" type="image" src="resources/images/guests/message_circle_line.png" alt="Send Message"></form>
		<form action="guestMgmt" method="get"><input class="img-fluid" type="image" src="resources/images/guests/guest_circle_line.png" alt="Guest List"></form>

	</div>
	
<!-- body contents end -->
</div>
<jsp:include page="/WEB-INF/includes/footer.jsp"/>
