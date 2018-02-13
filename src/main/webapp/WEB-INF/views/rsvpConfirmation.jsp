<!-- Change feature variable -->
<%! String feature = "RSVP Response Confirmation" ;%>

<% session.setAttribute("feature", feature); %>
<% session.setAttribute("title", "KIKAKUYA - " + feature); %>
<jsp:include page="/WEB-INF/includes/head.jsp" />
<jsp:include page="/WEB-INF/includes/header-rsvp-response.jsp"/>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div>
	<div class="${(respondRSVPSuccess != null) ? 'alert alert-success':''}" role="alert">${respondRSVPSuccess}</div>
	<div class="${(respondRSVPError != null) ? 'alert alert-danger':''}" role="alert">${respondRSVPError}</div>
</div>

<jsp:include page="/WEB-INF/includes/footer.jsp"/>