<!-- Change feature variable -->
<%! String feature = "RSVP Response Confirmation" ;%>

<% session.setAttribute("feature", feature); %>
<% session.setAttribute("title", "KIKAKUYA - " + feature); %>
<jsp:include page="/WEB-INF/includes/head.jsp" />
<jsp:include page="/WEB-INF/includes/header-rsvp-response.jsp"/>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="container"><!-- body contents start -->
	<div class="text-center" style="margin: 50px 0;">
		<c:if test="${not empty respondRSVPSuccess}">
			<h2>${respondRSVPSuccess}</h2>
		</c:if>
		<c:if test="${not empty respondRSVPError}">
			<h2>${respondRSVPError}</h2>
		</c:if>
		<h1>Thank you!</h1>
		<img class="img-fluid" alt="Reply RSVP" src="resources/images/guests/reply.png">
	</div>
</div>
<jsp:include page="/WEB-INF/includes/footer.jsp"/>