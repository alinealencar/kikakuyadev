<footer class="container-fluid text-center">
	<div>&copy; KIKAKUYA - 2018 All Rights Reserved</div>
</footer>
</div><!-- end of #container.container-fluid -->
<!-- jQuery library -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script>
	$(document).ready(function(){
		if($("#container").height() < $(window).height()){
	   		$("#container").css('min-height', $(window).height());	    
	    	$("footer").offset({top:  $(window).height() - 50, left: 0});
	    }else{$("#container").css('min-height', $(window).height());
	    }
	});

	$(window).resize(function(){
	    $("#container").css('min-height', $(window).height());
    
	});	
</script>
</body>
</html>