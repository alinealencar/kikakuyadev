<footer id="footer" class="container-fluid text-center" style="margin-top: 15px;">
		<div>&copy; KIKAKUYA - 2018 All Rights Reserved</div>
</footer>
	
<!-- Events -->
<link rel="stylesheet" type="text/css" href="resources/css/eventPage.css">

<script>
function stickyFooter(){
		
	}

	$(document).ready(function(){
		if($("#container").height() < $(window).height()){
	   		$("#container").css('min-height', $(window).height());	    
	    	$("footer").offset({top:  $(window).height() - 50, left: 0});
	    }
});

	$(window).resize(function(){
	    $("#container").css('min-height', $(window).height());

	});	


</script>