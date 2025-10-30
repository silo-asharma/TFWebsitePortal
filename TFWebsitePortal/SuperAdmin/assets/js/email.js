 $(document).ready(function() {
     $('.right-panel .body').slimScroll({
        height: '523px',
		size: '5px',
		alwaysVisible: true,
    });
	//Mobile compose list
    $('.mailbox .left-panel .menu-list .head').on("click", function() {
		$(this).toggleClass('rotate');
     $(this).next().slideToggle();
   });
 
	//Check all
	$('input[name="checkall"]').on("click", function() {
	    
		if ($(this).prop('checked')) {
           	$('input[name="singleemail"]').next().addClass('sed');
			$('input[name="singleemail"]').prop('checked', true);
			
        }
        else {
           // do what you need here         
          $('input[name="singleemail"]').next().removeClass('sed');
		  $('input[name="singleemail"]').prop('checked', false);
        }
		
   });
   //
 });