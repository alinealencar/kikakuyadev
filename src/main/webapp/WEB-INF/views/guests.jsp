<!-- Change feature variable -->
<%! String feature = "Guests" ;%>

<% session.setAttribute("feature", feature); %>
<% session.setAttribute("title", "KIKAKUYA - " + feature); %>
<jsp:include page="/WEB-INF/includes/head.jsp" />
<jsp:include page="/WEB-INF/includes/header.jsp"/>
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
	<h3>${attendGuests}58 guests of 80${totalGuests}</h3>
	<div class="progress" style="margin-bottom: 50px;">
  		<div class="progress-bar bg-success" role="progressbar" style="width: ${attendRate}72.5%" aria-valuenow="${attendRate}72.5" aria-valuemin="0" aria-valuemax="100">${attendGuests}58</div>
  		<div class="progress-bar bg-danger" role="progressbar" style="width: ${absentRate}0.625%" aria-valuenow="${absentRate}0.625" aria-valuemin="0" aria-valuemax="100">${absentGuests}5</div>
  		<div class="progress-bar bg-warning" role="progressbar" style="width: ${noResponseRate}27.5%" aria-valuenow="${noResponseRate}27.5" aria-valuemin="0" aria-valuemax="100">${noResponseGuests}22</div>
	</div>
<!-- body contents end -->
</div>
<jsp:include page="/WEB-INF/includes/footer.jsp"/>
