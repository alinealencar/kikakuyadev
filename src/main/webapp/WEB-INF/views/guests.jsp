<!-- Change feature variable -->
<%! String feature = "Guests" ;%>

<% session.setAttribute("feature", feature); %>
<% session.setAttribute("title", "KIKAKUYA - " + feature); %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<jsp:include page="/WEB-INF/includes/head.jsp" />
<jsp:include page="/WEB-INF/includes/header.jsp"/>
<jsp:include page="/WEB-INF/includes/menu.jsp"/>
<div class="container">
<!-- body contents start -->
	<div class="row">
		<div class="col-sm-6 text-center">
			<form action="sendMessage" method="get"><input class="img-fluid" type="image" src="resources/images/guests/message_circle_line.png" alt="Send Message"></form>
			<h3>Send Message</h3>
				<div>
				Send RSVP<br>
				Send Broadcast Message
			</div>
			<br>
		</div>
		<div class="col-sm-6 text-center">
			<form action="guestMgmt" method="get"><input class="img-fluid" type="image" src="resources/images/guests/guest_circle_line.png" alt="Guest List"></form>
			<h3>Guest List</h3>
			<div>
				Create guest lists<br>
				Check guest status
			</div>
			<br>
		</div>
	</div>
	<br>
	<c:if test="${totalGuests > 0}">
		<c:if test="${presentGuests <= 1}">
			<h3>${presentGuests} guest of ${totalGuests}</h3>	
		</c:if>
		<c:if test="${presentGuests > 1}">
			<h3>${presentGuests} guests of ${totalGuests}</h3>	
		</c:if>
		<div class="progress" style="margin-bottom: 25px;">
			<div class="progress-bar bg-danger" role="progressbar" style="width: ${(absentGuests/totalGuests)*100}%" aria-valuenow="${(absentGuests/totalGuests)*100}" aria-valuemin="0" aria-valuemax="100">${absentGuests}</div>
	  		<div class="progress-bar bg-success" role="progressbar" style="width: ${(presentGuests/totalGuests)*100}%" aria-valuenow="${(presentGuests/totalGuests)*100}" aria-valuemin="0" aria-valuemax="100">${presentGuests}</div>
	  		<div class="progress-bar bg-warning" role="progressbar" style="width: ${(noReplyGuests/totalGuests)*100}%" aria-valuenow="${(noReplyGuests/totalGuests)*100}" aria-valuemin="0" aria-valuemax="100">${noReplyGuests}</div>
		</div>
		<div class="row">
			<div class="col-sm-6">
				<p><span style="background-color: #dc3545;">&nbsp;&nbsp;&nbsp;&nbsp;</span>&nbsp;Declined&nbsp;&nbsp;&nbsp;<span style="background-color: #28a745;">&nbsp;&nbsp;&nbsp;&nbsp;</span>&nbsp; Accepted&nbsp;&nbsp;&nbsp; <span style="background-color: #ffc107;">&nbsp;&nbsp;&nbsp;&nbsp;</span>&nbsp;No Reply
			</div>
			<div class="col-sm-6 text-right">
				<span>Total Adults: ${totalAdult}&nbsp;&nbsp;&nbsp;&nbsp;Total Kids: ${totalKid}</span></p>
			</div>
		</div>
	</c:if>
<!-- body contents end -->
</div>
<jsp:include page="/WEB-INF/includes/footer.jsp"/>
