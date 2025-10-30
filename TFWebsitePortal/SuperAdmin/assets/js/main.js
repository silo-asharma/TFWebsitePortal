//Preloader
$(window).on("load", function() {
"use strict";
$('.preloader').fadeOut();	
});

$(document).ready(function() {
"use strict";
//Submenu height
var height = $(window). height() ;
var menuheight = height-160;
if ($(".main-menu").length > 0) {

$('.submenu .list-box').slimScroll({
        height: ''+menuheight+'',
		size: '5px',
    });
}
//Login background slider	
$('.form-bg-slider').owlCarousel({
    loop:true,
    nav:false,
	
    items:1
})

// Member slider
 $('.recent-member').owlCarousel({
    loop:true,
    nav:false,
	dots:false,
responsive:{
        0:{
            items:1
        },
        600:{
            items:3
        },
        1000:{
            items:4
        }
    }
})
//Chat panel
$('#chat').on("click", function() {
    $('.chat-panel').addClass('open');
});
$('.chat-member').slimScroll({
        height: '500px',
		size: '5px',
    });
$('.chat-box .body').slimScroll({
        height: '500px',
		size: '5px',
    });	
//Header chat count	
setTimeout(function(){
    $('.chat-count').addClass('pulse-animation');
	 $('.chat-count').text('3');
	
},5000);
//Right panel close
$('.right-panel .close').on("click", function() {
    $(this).parent().removeClass('open');
});
//Full screen
var elem = document.documentElement;
$('#fullscreen').on("click", function() {
  if ($('#fullscreen').hasClass('active'))
  {
      if (document.exitFullscreen) {
    document.exitFullscreen();
  } else if (document.mozCancelFullScreen) {
    document.mozCancelFullScreen();
  } else if (document.webkitExitFullscreen) {
    document.webkitExitFullscreen();
  } else if (document.msExitFullscreen) {
    document.msExitFullscreen();
  }
  }
  else
  {
	  if (elem.requestFullscreen) {
    elem.requestFullscreen();
  } else if (elem.mozRequestFullScreen) { /* Firefox */
    elem.mozRequestFullScreen();
  } else if (elem.webkitRequestFullscreen) { /* Chrome, Safari & Opera */
    elem.webkitRequestFullscreen();
  } else if (elem.msRequestFullscreen) { /* IE/Edge */
    elem.msRequestFullscreen();
  }
  }
});

document.addEventListener("fullscreenchange", function() {
	$('#fullscreen').toggleClass('active');
});
/* Firefox */
document.addEventListener("mozfullscreenchange", function() {
$('#fullscreen').toggleClass('active');
});

/* Chrome, Safari and Opera */
document.addEventListener("webkitfullscreenchange", function() {
$('#fullscreen').toggleClass('active');
});

/* IE / Edge */
document.addEventListener("msfullscreenchange", function() {
$('#fullscreen').toggleClass('active');
}); 
//Main menu
$('.sub-menu .close').on("click", function() {
    $(this).parent().removeClass('open');
});
$('.main-menu a').on("click", function() {
    $('.sub-menu').addClass('open');
	$(this).addClass('active');
	$('.main-menu a').not(this).removeClass('active');
	var name = $(this).attr('name');
	$('.'+name).addClass('active');
	$('.sub-menu .submenu').not('.'+name).removeClass('active');
});

$('.list-box .nav-link').on("click", function() {
  
	if($(this).next().hasClass('show'))
	{
		$(this).removeClass('rotate');
		
	}
	else
	{
		$(this).addClass('rotate');
				
	}
	$(this).parent().addClass('show');
	$('.list-box li a').not(this).parent().removeClass('show');
	  $("li.show").siblings().find('.collapse.show').collapse('hide');
	  $("li.show").siblings().find('.nav-link').removeClass('rotate');
});
//Mobile search
$('.search i').on('click', function(){
	var windowwidth = $(window).width();
	if(windowwidth < 576)
	{
		$('.search-box').slideToggle();
	}
});
 
//Profile Menu
$('.main-menu .profile-pic').on("click", function() {
        $('.sub-menu').addClass('open');
		$('.profile').addClass('active');
		$('.sub-menu .submenu').not('.profile').removeClass('active');
});
// checkbox tick
if ($(".theme-control").length > 0) {
    $('.theme-control').checks();
 } 
//Custom accordian
 $(".accordion.custom a").on('click',function() {
	 $(this).toggleClass('rotate');
 });
// Flipbox 
if ($(".flip-content-box").length > 0) {
  $('.flip-content-box').slimScroll({
        height: '300px',
		size: '5px',
    });
}
	
    // initializing bootstrap tooltip
    $('[data-toggle="tooltip"]').tooltip();

    // initialize clipboard plugin
    if ($('.btn-clipboard').length) {
      var clipboard = new ClipboardJS('.btn-clipboard');

      // Enabling tooltip to all clipboard buttons
      $('.btn-clipboard').attr('data-toggle', 'tooltip').attr('title', 'Copy to clipboard');

      // initializing bootstrap tooltip
      $('[data-toggle="tooltip"]').tooltip();

      // initially hide btn-clipboard and show after copy
      clipboard.on('success', function(e) {
        e.trigger.classList.value = 'btn btn-clipboard btn-current'
        $('.btn-current').tooltip('hide');
        e.trigger.dataset.originalTitle = 'Copied';
        $('.btn-current').tooltip('show');
        setTimeout(function(){
            $('.btn-current').tooltip('hide');
            e.trigger.dataset.originalTitle = 'Copy to clipboard';
            e.trigger.classList.value = 'btn btn-clipboard'
        },1000);
        e.clearSelection();
      });
    }
	//Code click
$('.card-title .icon-list a').on('click',function(event){
	event.preventDefault()
	$(this).addClass('active');
	$(this).parents('.card-body').addClass('cardactive');
	$('.card-body').not($(this).parents('.card-body')).removeClass('cardactive');
	var name = $(this).attr('name');
	$('.card-title .icon-list a').not(this).removeClass('active');
	if(name=='open')
	{
	$('.cardactive').find('.flip-card').addClass('flipshow');
	}
	else
	{
			$('.cardactive').find('.flip-card').removeClass('flipshow');
			
	}
});
//Popover
  $('[data-toggle="popover"]').popover();  

//Toasts
  $('.toast').toast('show');   	
//Theme button
   $('footer').append('<div class="theme-change"><a href="../dark/index.html"> <i class="fas fa-cog fa-spin mr-1"></i> Dark Theme</a></div>');
});