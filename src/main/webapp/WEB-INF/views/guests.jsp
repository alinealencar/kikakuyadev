<!-- Change feature variable -->
<%! String feature = "Guests" ;%>

<% session.setAttribute("feature", feature); %>
<% session.setAttribute("title", "KIKAKUYA - " + feature); %>
<jsp:include page="/WEB-INF/includes/head.jsp" />
<jsp:include page="/WEB-INF/includes/header.jsp"/>
<jsp:include page="/WEB-INF/includes/menu.jsp"/>
<div class="container">
<!-- body contents start -->
	<div class="row" style="margin-top: 50px;">
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
	<h3>${presentGuests} guests of ${totalGuests}</h3>
	<div class="progress" style="margin-bottom: 50px;">
		<div class="progress-bar bg-danger" role="progressbar" style="width: ${(absentGuests/totalGuests)*100}%" aria-valuenow="${(absentGuests/totalGuests)*100}" aria-valuemin="0" aria-valuemax="100">${absentGuests}</div>
	  	<div class="progress-bar bg-success" role="progressbar" style="width: ${(presentGuests/totalGuests)*100}%" aria-valuenow="${(presentGuests/totalGuests)*100}" aria-valuemin="0" aria-valuemax="100">${presentGuests}</div>
	  	<div class="progress-bar bg-warning" role="progressbar" style="width: ${(noReplyGuests/totalGuests)*100}%" aria-valuenow="${(noReplyGuests/totalGuests)*100}" aria-valuemin="0" aria-valuemax="100">${noReplyGuests}</div>	</div>
<!-- body contents end -->
</div>
<jsp:include page="/WEB-INF/includes/footer.jsp"/>
