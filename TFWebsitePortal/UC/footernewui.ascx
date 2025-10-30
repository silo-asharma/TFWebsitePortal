<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="footernewui.ascx.cs" Inherits="Extuent.UC.footernewui" %>
 
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script> 
<script src="./vendor/global/global.min.js"></script> 
<script src="./vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script> 
<script src="./vendor/chart.js/Chart.bundle.min.js"></script> 
<script src="./js/custom.min.js"></script> 
<script src="./js/deznav-init.js"></script> 
<script src="./vendor/owl-carousel/owl.carousel.js"></script> 

<!-- Chart piety plugin files --> 
<script src="./vendor/peity/jquery.peity.min.js"></script> 

<!-- Apex Chart --> 
<script src="./vendor/apexchart/apexchart.js"></script> 

<!-- Dashboard 1 --> 
<script src="./js/dashboard/dashboard-1.js"></script> 
<!-- Form Steps --> 
<script src="./vendor/jquery-smartwizard/dist/js/jquery.smartWizard.js"></script> 
<!-- Daterangepicker --> 
<!-- momment js is must --> 
<script src="./vendor/moment/moment.min.js"></script> 
<script src="./vendor/bootstrap-daterangepicker/daterangepicker.js"></script> 
<!-- clockpicker --> 
<script src="./vendor/clockpicker/js/bootstrap-clockpicker.min.js"></script> 
<!-- asColorPicker --> 
<script src="./vendor/jquery-asColor/jquery-asColor.min.js"></script> 
<script src="./vendor/jquery-asGradient/jquery-asGradient.min.js"></script> 
<script src="./vendor/jquery-asColorPicker/js/jquery-asColorPicker.min.js"></script> 
<!-- Material color picker --> 
<script src="./vendor/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"></script> 
<!-- pickdate --> 
<script src="./vendor/pickadate/picker.js"></script> 
<script src="./vendor/pickadate/picker.time.js"></script> 
<script src="./vendor/pickadate/picker.date.js"></script> 

<!-- Daterangepicker --> 
<script src="./js/plugins-init/bs-daterange-picker-init.js"></script> 
<!-- Clockpicker init --> 
<script src="./js/plugins-init/clock-picker-init.js"></script> 
<!-- asColorPicker init --> 
<script src="./js/plugins-init/jquery-asColorPicker.init.js"></script> 
<!-- Material color picker init --> 
<script src="./js/plugins-init/material-date-picker-init.js"></script> 
<!-- Pickdate --> 
<script src="./js/plugins-init/pickadate-init.js"></script> 
<script>
		$(document).ready(function(){
			// SmartWizard initialize
			$('#smartwizard').smartWizard();
		});
    </script> 
<script>
        function carouselReview() {
            /*  event-bx one function by = owl.carousel.js */
            jQuery('.event-bx').owlCarousel({
                loop: true,
                margin: 30,
                nav: true,
                center: true,
                autoplaySpeed: 3000,
                navSpeed: 3000,
                paginationSpeed: 3000,
                slideSpeed: 3000,
                smartSpeed: 3000,
                autoplay: false,
                navText: ['<i class="fa fa-caret-left" aria-hidden="true"></i>', '<i class="fa fa-caret-right" aria-hidden="true"></i>'],
                dots: true,
                responsive: {
                    0: {
                        items: 1
                    },
                    720: {
                        items: 2
                    },

                    1150: {
                        items: 3
                    },

                    1200: {
                        items: 2
                    },
                    1749: {
                        items: 3
                    }
                }
            })
        }
        jQuery(window).on('load', function () {
            setTimeout(function () {
                carouselReview();
            }, 1000);
        });

/*  [SHOW UPLOADED IMAGE] */
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#imageResult')
                .attr('src', e.target.result);
        };
        reader.readAsDataURL(input.files[0]);
    }
}

$(function () {
    $('#upload').on('change', function () {
        readURL(input);
    });
});
/*  [/SHOW UPLOADED IMAGE] */
    </script>


