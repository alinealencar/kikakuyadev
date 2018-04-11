$(function() {
	    $('#adult').change(function() {
	        var val = $(this).val();
	        switch (val){
	        	case '0':
               		$('#adult1').hide();
               		$('#adult2').hide();
               		$('#adult3').hide();
               		$('#adult4').hide();
               		$('#adult1Error').hide();
               		$('#adult2Error').hide();
               		$('#adult3Error').hide();
               		$('#adult4Error').hide();
               		$('#adult1MealError').hide();
               		$('#adult2MealError').hide();
               		$('#adult3MealError').hide();
               		$('#adult4MealError').hide();
                	break;
	            case '1':
	                $('#adult1').show();
	                $('#adult2').hide();
	                $('#adult3').hide();
               		$('#adult4').hide();
               		$('#adult2Error').hide();
               		$('#adult3Error').hide();
               		$('#adult4Error').hide();
               		$('#adult2MealError').hide();
               		$('#adult3MealError').hide();
               		$('#adult4MealError').hide();
               		$
	                break;
	            case '2':
	                $('#adult1').show();
	                $('#adult2').show();
	                $('#adult3').hide();
               		$('#adult4').hide();
               		$('#adult3Error').hide();
               		$('#adult4Error').hide();
               		$('#adult3MealError').hide();
               		$('#adult4MealError').hide();
	                break;
	            case '3':
	               	$('#adult1').show();
	                $('#adult2').show();
	                $('#adult3').show();
	                $('#adult4').hide();
	                $('#adult4Error').hide();
               		$('#adult4MealError').hide();
	               	break;
	            case '4':
	               	$('#adult1').show();
	                $('#adult2').show();
	                $('#adult3').show();
	                $('#adult4').show();
	               	break;
	            
	        }
	    });
 });
 
 $(function() {
	    $('#kid').change(function() {
	        var val = $(this).val();
	        switch (val){
	        	case '0':
            		$('#kid1').hide();
            		$('#kid2').hide();
            		$('#kid3').hide();
            		$('#kid4').hide();
            		$('#kid1Error').hide();
               		$('#kid2Error').hide();
               		$('#kid3Error').hide();
               		$('#kid4Error').hide();
               		$('#kid1MealError').hide();
               		$('#kid2MealError').hide();
               		$('#kid3MealError').hide();
               		$('#kid4MealError').hide();
             	break;
	            case '1':
	                $('#kid1').show();
	                $('#kid2').hide();
	                $('#kid3').hide();
            		$('#kid4').hide();
            		$('#kid2Error').hide();
               		$('#kid3Error').hide();
               		$('#kid4Error').hide();
               		$('#kid2MealError').hide();
               		$('#kid3MealError').hide();
               		$('#kid4MealError').hide();
	                break;
	            case '2':
	                $('#kid1').show();
	                $('#kid2').show();
	                $('#kid3').hide();
            		$('#kid4').hide();
            		$('#kid3Error').hide();
               		$('#kid4Error').hide();
               		$('#kid3MealError').hide();
               		$('#kid4MealError').hide();
	                break;
	            case '3':
	               	$('#kid1').show();
	                $('#kid2').show();
	                $('#kid3').show();
	                $('#kid4').hide();
	                $('#kid4Error').hide();
               		$('#kid4MealError').hide();
	               	break;
	            case '4':
	               	$('#kid1').show();
	                $('#kid2').show();
	                $('#kid3').show();
	                $('#kid4').show();
	               	break;
	            
	        }
	    });
});
 
	$(document).ready(function(){
	    $('#absent').click(function() {
	    	$('.toHide').hide();
	    	$('#adult').val("0");
    		$('#kid').val("0");
    		$('.plus').val("");
    		$('.meal').val("");
    		$('textarea').val("");
	    });
		
 });
	    	
	 $(document).ready(function() {
		 $('#attend').click(function() {
	     	$('.toShow').show();
	     	showAdultPlusOnes();
	     	showKidPlusOnes();
		   });		
});

$(document).ready(function(){
	showAdultPlusOnes() 
	showKidPlusOnes()
	
});

function showAdultPlusOnes(){
	if($('.adults').length == 1){
		var adult1 = document.getElementsByClassName('adults')[0].value;
				$('#adultName1').val(adult1);
				$('#adult1').show();
				$('#adult').val('1');
			}
			
			if($('.adults').length == 2){
				var adult1 = document.getElementsByClassName('adults')[0].value;
				var adult2 = document.getElementsByClassName('adults')[1].value;
				$('#adultName1').val(adult1);
				$('#adultName2').val(adult2);
				$('#adult1').show();
				$('#adult2').show();
				$('#adult').val('2');
			}
			
			if($('.adults').length == 3){
				var adult1 = document.getElementsByClassName('adults')[0].value;
				var adult2 = document.getElementsByClassName('adults')[1].value;
				var adult3 = document.getElementsByClassName('adults')[2].value;
				$('#adultName1').val(adult1);
				$('#adultName2').val(adult2);
				$('#adultName3').val(adult3);
				$('#adult1').show();
				$('#adult2').show();
				$('#adult3').show();
				$('#adult').val('3');
			}
			
			if($('.adults').length == 4){
				var adult1 = document.getElementsByClassName('adults')[0].value;
				var adult2 = document.getElementsByClassName('adults')[1].value;
				var adult3 = document.getElementsByClassName('adults')[2].value;
				var adult4 = document.getElementsByClassName('adults')[3].value;
				$('#adultName1').val(adult1);
				$('#adultName2').val(adult2);
				$('#adultName3').val(adult3);
				$('#adultName4').val(adult4);
				$('#adult1').show();
				$('#adult2').show();
				$('#adult3').show();
				$('#adult4').show();
				$('#adult').val('4');
			}
		}
		
	function showKidPlusOnes(){
			if($('.kids').length == 1){
				var kid1 = document.getElementsByClassName('kids')[0].value;
				$('#kidName1').val(kid1);
				$('#kid1').show();
				$('#kid').val('1');
			}
			
			if($('.kids').length == 2){
				var kid1 = document.getElementsByClassName('kids')[0].value;
				var kid2 = document.getElementsByClassName('kids')[1].value;
				$('#kidName1').val(kid1);
				$('#kidName2').val(kid2);
				$('#kid1').show();
				$('#kid2').show();
				$('#kid').val('2');
			}
			
			if($('.kids').length == 3){
				var kid1 = document.getElementsByClassName('kids')[0].value;
				var kid2 = document.getElementsByClassName('kids')[1].value;
				var kid3 = document.getElementsByClassName('kids')[2].value;
				$('#kidName1').val(kid1);
				$('#kidName2').val(kid2);
				$('#kidName3').val(kid3);
				$('#kid1').show();
				$('#kid2').show();
				$('#kid3').show();
				$('#kid').val('3');
			}
			
			if($('.kids').length == 4){
				var kid1 = document.getElementsByClassName('kids')[0].value;
				var kid2 = document.getElementsByClassName('kids')[1].value;
				var kid3 = document.getElementsByClassName('kids')[2].value;
				var kid4 = document.getElementsByClassName('kids')[3].value;
				$('#kidName1').val(kid1);
				$('#kidName2').val(kid2);
				$('#kidName3').val(kid3);
				$('#kidName4').val(kid4);
				$('#kid1').show();
				$('#kid2').show();
				$('#kid3').show();
				$('#kid4').show();
				$('#kid').val('4');
			}
		}

$(document).ready(function(){
	$('#closeAdult1').click(function(){
		$('#adult1').hide();
		$('#adultName1').val('');
		$('#adultMeal1').val('');
		if($('#adult').val() == 1)
			$('#adult').val('0');
		else if($('#adult').val() == 2)
			$('#adult').val('1');
		else if($('#adult').val() == 3)
			$('#adult').val('2');
		else
			$('#adult').val('3');
	});
});

$(document).ready(function(){
	$('#closeAdult2').click(function(){
		$('#adult2').hide();
		$('#adultName2').val('');
		$('#adultMeal2').val('');
		if($('#adult').val() == 1)
			$('#adult').val('0');
		else if($('#adult').val() == 2)
			$('#adult').val('1');
		else if($('#adult').val() == 3)
			$('#adult').val('2');
		else
			$('#adult').val('3');
	});
});

$(document).ready(function(){
	$('#closeAdult3').click(function(){
		$('#adult3').hide();
		$('#adultName3').val('');
		$('#adultMeal3').val('');
		if($('#adult').val() == 1)
			$('#adult').val('0');
		else if($('#adult').val() == 2)
			$('#adult').val('1');
		else if($('#adult').val() == 3)
			$('#adult').val('2');
		else
			$('#adult').val('3');
	});
});

$(document).ready(function(){
	$('#closeAdult4').click(function(){
		$('#adult4').hide();
		$('#adultName4').val('');
		$('#adultMeal4').val('');
		if($('#adult').val() == 1)
			$('#adult').val('0');
		else if($('#adult').val() == 2)
			$('#adult').val('1');
		else if($('#adult').val() == 3)
			$('#adult').val('2');
		else
			$('#adult').val('3');
	});
});

$(document).ready(function(){
	$('#closeKid1').click(function(){
		$('#kid1').hide();
		$('#kidName1').val('');
		$('#kidMeal1').val('');
		if($('#kid').val() == 1)
			$('#kid').val('0');
		else if($('#kid').val() == 2)
			$('#kid').val('1');
		else if($('#kid').val() == 3)
			$('#kid').val('2');
		else
			$('#kid').val('3');
	});
});

$(document).ready(function(){
	$('#closeKid2').click(function(){
		$('#kid2').hide();
		$('#kidName2').val('');
		$('#kidMeal2').val('');
		if($('#kid').val() == 1)
			$('#kid').val('0');
		else if($('#kid').val() == 2)
			$('#kid').val('1');
		else if($('#kid').val() == 3)
			$('#kid').val('2');
		else
			$('#kid').val('3');
	});
});

$(document).ready(function(){
	$('#closeKid3').click(function(){
		$('#kid3').hide();
		$('#kidName3').val('');
		$('#kidMeal3').val('');
		if($('#kid').val() == 1)
			$('#kid').val('0');
		else if($('#kid').val() == 2)
			$('#kid').val('1');
		else if($('#kid').val() == 3)
			$('#kid').val('2');
		else
			$('#kid').val('3');
	});
});

$(document).ready(function(){
	$('#closeKid4').click(function(){
		$('#kid4').hide();
		$('#kidName4').val('');
		$('#kidMeal4').val('');
		if($('#kid').val() == 1)
			$('#kid').val('0');
		else if($('#kid').val() == 2)
			$('#kid').val('1');
		else if($('#kid').val() == 3)
			$('#kid').val('2');
		else
			$('#kid').val('3');
	});
});