<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test2.aspx.cs" Inherits="Extuent.test2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Extuent</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="./images/favicon.png">
<link rel="stylesheet" href="./vendor/chartist/css/chartist.min.css">
<link href="./vendor/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet">
<link href="./vendor/owl-carousel/owl.carousel.css" rel="stylesheet">
<link href="./css/style.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&family=Roboto:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link href="assets/css/update-style.css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
    
<!--*******************
        Preloader start
    ********************-->
<div id="preloader">
  <div class="sk-three-bounce">
    <div class="sk-child sk-bounce1"></div>
    <div class="sk-child sk-bounce2"></div>
    <div class="sk-child sk-bounce3"></div>
  </div>
</div>
<!--*******************
        Preloader end
    ********************--> 

<!-- [Header] -->
<header>
    <div class="container-fluid">
        <div class="header-wrap">
            <div class="logo"> <a href="index.html"> <img class="logo-compact img-fluid" src="./images/logo.png" alt=""> </a> </div>
            <div class="menu-wrap">
              <nav class="navbar navbar-expand-md navbar-light" aria-label="Primary Menu">
                <div class="container-fluid">
                  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#primaryNav" aria-controls="primaryNav" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
                  <div class="collapse navbar-collapse" id="primaryNav">
                    <ul class="navbar-nav me-auto mb-2 mb-md-0">
                      <li class="nav-item"> <a class="nav-link" href="#">Features</a> </li>
                      <li class="nav-item"> <a class="nav-link" href="#">Clients</a> </li>
                      <li class="nav-item"> <a class="nav-link" href="#">Login</a> </li>
                      <li class="nav-item"> <a class="nav-link" href="#">Pricing</a> </li>
                      <li class="nav-item"> <a class="nav-link" href="#">Get Demo</a> </li>
                    </ul>
                  </div>
                </div>
              </nav>
            </div>
          </div>
    </div>
</header>
<!-- [/Header] --> 

<!--**********************************
        Main wrapper start
    ***********************************-->
<div id="main-wrapper">
  <section class="pt-5 pb-5">
    <div class="container-fluid"> 
              <!-- <div class="col-sm-8 col-xs-12 p-0 wizard-form-right-box"> -->
      <!-- [form Section Right] -->
      <div id="smartwizard" class="form-wizard order-create">
        <ul class="nav nav-wizard p-0 m-0">
          <li> <a class="nav-link p-0" href="#wizard_Service"> </a> </li>
          <li> <a class="nav-link p-0" href="#wizard_Time"> </a> </li>
          <li> <a class="nav-link p-0" href="#wizard_Details"> </a> </li>
          <li> <a class="nav-link p-0" href="#wizard_Payment"> </a> </li>
        </ul>
        <div class="tab-content">
          <!-- [Form Step 1] -->
          <div id="wizard_Service" class="tab-pane" role="tabpanel">
            <div class="row m-0">
              <!-- [Left Banner Image Box] -->
            <div class="col-sm-4 col-xs-12 banner-wrap p-0"> 
              <picture>
                <source media="(max-width:767px)" srcset="images/banner-mob.jpg">
                <img class="img-fluid" src="images/banner-web.jpg" alt=""> </picture>
            </div>
            <!-- [/Left Banner Image Box] -->

            <!-- [Right Form Box] -->
            <div class="col-sm-8 col-xs-12 wizard-form-right-box">
              <div class="col-lg-9 ml-auto mb-3 mt-3 form-steps-progress">
                <p>0 of 3 Completed</p>
                <div class="progress">
                    <div class="progress-bar" role="progressbar" aria-label="Basic example" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
              </div>
              <div class="form-box-inner">
                <div class="col-lg-3 col-sm-4 col-xs-12 profile-img"> 
                    <img class="img-fluid" src="./images/pro1.jpg"  /> 
                    <p><a class="btn btn-outline-primary profile-img-btn" data-toggle="modal" data-target="#profileImageModal">Upload Profile Picture</a></p>
                </div>
                <div class="col-lg-9 col-sm-8 col-xs-12 mb-2">
                  <div class="row">
                    <div class="col-lg-12 mb-3">
                      <h4 class="form-heading"> Personal Info </h4>
                    </div>
                    <div class="col-lg-6 mb-2">
                      <div class="form-group">
                        <input type="text" name="firstName" class="form-control" placeholder="First Name" required>
                      </div>
                    </div>
                    <div class="col-lg-6 mb-2">
                      <div class="form-group">
                        <input type="text" name="lastName" class="form-control" placeholder="Last Name" required>
                      </div>
                    </div>
                    <div class="col-lg-12 mb-2">
                      <div class="form-group">
                        <input type="email" class="form-control" id="inputGroupPrepend2" aria-describedby="inputGroupPrepend2" placeholder="email Address" required>
                      </div>
                    </div>
                    <div class="col-lg-6 mb-2">
                      <div class="form-group">
                        <input type="text" name="phoneNumber" class="form-control" placeholder="Phone" required>
                      </div>
                    </div>
                    <div class="col-lg-6 mb-2">
                      <div class="form-group">
                        <input type="text" name="City" class="form-control" placeholder="City" required>
                      </div>
                    </div>
                    <div class="col-lg-12 mb-3">
                      <div class="form-group">
                        <label class="text-label">Drag or Upload Resume <br />
                          (File accepted :.pdf, .doc/.docx- max file size : 150 kb for demo limit)</label>
                        <div class="input-group">
                          <div class="custom-file" data-toggle="tooltip" data-placement="top" title="Tooltip on top">
                            <input type="file" class="custom-file-input" id="resume-upload">
                            <label for="resume-upload" class="custom-file-label">
                               No File Choosen
                            </label>
                          </div>
                        </div>
                      </div>
                    </div>

                  </div>
                </div>
              </div>
            </div>
              <!-- [/Right Form Box] -->
            </div>
            
          </div>
          <!-- [/Form Step 1] -->

          <!-- [Form Step 2] -->
          <div id="wizard_Time" class="tab-pane" role="tabpanel">
            <div class="row m-0">
              <!-- [Left Banner Image Box] -->
            <div class="col-sm-4 col-xs-12 banner-wrap p-0"> 
              <picture>
                <source media="(max-width:767px)" srcset="images/banner-mob.jpg">
                <img class="img-fluid" src="images/banner-web.jpg" alt=""> </picture>
            </div>
            <!-- [/Left Banner Image Box] -->

            <!-- [Right Form Box] -->
            <div class="col-sm-8 col-xs-12 wizard-form-right-box">
              <div class="col-lg-8 col-sm-10 col-xs-12 form-box-inner mx-auto">
                <div class="row">
                  <div class="col-lg-12 mb-2">
                    <div class="col-lg-12 mb-3 form-steps-progress p-0">
                        <p>1 of 3 Completed</p>
                        <div class="progress">
                            <div class="progress-bar" role="progressbar" style="width: 33%" aria-valuenow="33" aria-valuemin="0" aria-valuemax="100"></div>
                          </div>
                    </div>
                  </div>
                  <div class="col-lg-12 mb-3">
                    <h4 class="form-heading"> Select Skills </h4>
                  </div>
                  <div class="col-lg-12 mb-2">
                    <div class="form-group">
                      <div class="form-group">
                        <select class="form-control form-control-lg default-select " multiple="multiple">
                          <option>HTML</option>
                          <option>XML</option>
                          <option>FIREFOX</option>
                        </select>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-12 mb-2">
                    <div class="form-group">
                      <label>Other Skills(Separated By Commas)</label>
                      <input type="text" name="lastName" class="form-control" placeholder="" required>
                    </div>
                  </div>
                  <div class="col-lg-6 mb-2">
                    <div class="form-group">
                      <label>Salary Details</label>
                      <input type="email" class="form-control" id="inputGroupPrepend2" aria-describedby="inputGroupPrepend2" placeholder="Current Month Salary" required>
                    </div>
                  </div>
                  <div class="col-lg-6 mb-2">
                    <div class="form-group">
                      <label>&nbsp;</label>
                      <input type="text" name="phoneNumber" class="form-control" placeholder="Expected Month Salary" required>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            <!-- [/Right Form Box] -->
            </div>
              
          </div>
          <!-- [/Form Step 2] -->

          <!-- [Form Step 3] -->
          <div id="wizard_Details" class="tab-pane" role="tabpanel">
            <div class="row m-0">
              <!-- [Left Banner Image Box] -->
            <div class="col-sm-4 col-xs-12 banner-wrap p-0"> 
              <picture>
                <source media="(max-width:767px)" srcset="images/banner-mob.jpg">
                <img class="img-fluid" src="images/banner-web.jpg" alt=""> </picture>
            </div>
            <!-- [/Left Banner Image Box] -->

            <!-- [Right Form Box] -->
            <div class="col-sm-8 col-xs-12 wizard-form-right-box">
              <div class="col-sm-10 col-xs-12 form-box-inner mx-auto">
                <div class="row">
                    <div class="col-lg-12 mb-2">
                        <div class="col-lg-10 mb-3 form-steps-progress p-0">
                            <p>2 of 3 Completed</p>
                            <div class="progress">
                                <div class="progress-bar" role="progressbar" style="width: 66%" aria-valuenow="66" aria-valuemin="0" aria-valuemax="100"></div>
                              </div>
                        </div>
                      </div>
                      <div class="col-lg-12 mb-3">
                        <h4 class="form-heading">Education & Experience</h4>
                      </div>
                  <div class="col-lg-12 mb-2">
                    <div class="form-group">
                      <div class="form-group">
                        <select class="form-control form-control-lg default-select ">
                          <option selected disabled>Select Highest Education</option>
                          <option>Master</option>
                          <option>Bachlors</option>
                          <option>High School</option>
                          <option>Others</option>
                        </select>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-12 mb-2">
                    <div class="form-group">
                      <input type="text" name="lastName" class="form-control" placeholder="Other" required>
                    </div>
                  </div>
                  <div class="col-lg-12 mb-2">
                    <div class="form-group">
                      <select class="form-control form-control-lg default-select ">
                        <option selected disabled>Notice Period</option>
                        <option>Immediate</option>
                        <option>30 days</option>
                        <option>90 days</option>
                      </select>
                    </div>
                  </div>
                  <div class="col-lg-12 mb-2">
                    <h5> Professional Experience </h5>
                  </div>
                  <div class="col-lg-12 mb-12">
                    <!-- [Professional Experience 1] -->
                    <div class="exp-row form-inline">
                        <div class="form-group mb-2 date-from">
                          <label for="from" class="sr-only">From</label>
                          <input type="date" class="form-control" id="from" placeholder="From">
                        </div>
                        <div class="form-group mb-2 date-to">
                            <label for="to" class="sr-only">To</label>
                            <input type="date" class="form-control" id="to" placeholder="To">
                          </div>
                          <div class="form-group mb-2">
                            <label for="title" class="sr-only">Title</label>
                            <input type="text" class="form-control" id="title" placeholder="Title">
                          </div>
                          <div class="form-group mb-2">
                            <label for="company" class="sr-only">Company</label>
                            <input type="text" class="form-control" id="company" placeholder="Company">
                          </div>
                    </div>
                    <!-- [/Professional Experience 1] -->

                    <!-- [Professional Experience 2] -->
                    <div class="exp-row form-inline">
                        <div class="form-group mb-2 date-from">
                          <label for="from" class="sr-only">From</label>
                          <input type="date" class="form-control" id="from" placeholder="From">
                        </div>
                        <div class="form-group mb-2 date-to">
                            <label for="to" class="sr-only">To</label>
                            <input type="date" class="form-control" id="to" placeholder="To">
                          </div>
                          <div class="form-group mb-2">
                            <label for="title" class="sr-only">Title</label>
                            <input type="text" class="form-control" id="title" placeholder="Title">
                          </div>
                          <div class="form-group mb-2">
                            <label for="company" class="sr-only">Company</label>
                            <input type="text" class="form-control" id="company" placeholder="Company">
                          </div>
                    </div>
                    <!-- [/Professional Experience 2] -->
                    <div class="col-lg-12 mb-12">
                        <a href="">+Add More</a>
                    </div>
                   </div>
                  <div class="col-lg-6 mb-2">
                    <div class="form-group"> </div>
                  </div>
                </div>
              </div>
              </div>
            </div>
          </div>
          <!-- [/Form Step 3] -->

          <!-- [Form Step 4] -->
          <div id="wizard_Payment" class="tab-pane" role="tabpanel">
            <div class="row m-0">
              <!-- [Left Banner Image Box] -->
            <div class="col-sm-4 col-xs-12 banner-wrap p-0"> 
              <picture>
                <source media="(max-width:767px)" srcset="images/banner-mob.jpg">
                <img class="img-fluid" src="images/banner-web.jpg" alt=""> </picture>
            </div>
            <!-- [/Left Banner Image Box] -->

            <!-- [Right Form Box] -->
            <div class="col-sm-8 col-xs-12 wizard-form-right-box">
              <div class="col-sm-10 col-xs-12 form-box-inner mx-auto">
                <div class="row">
                        <div class="col-lg-12 mb-3 form-steps-progress p-0">
                            <p>3 of 3 Completed</p>
                            <div class="progress">
                                <div class="progress-bar" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                              </div>
                        </div>
                      <div class="col-lg-12 mb-3">
                        <h4 class="form-heading"></h4>
                      </div>
                  <div class="col-lg-12 mb-2">
                    <div class="confirm-msg">
                        Confirmation Message Here
                    </div>
                  </div>
                  <div class="col-lg-12 mb-12">
                    <div class="custom-control custom-checkbox mb-3 checkbox-warning">
                      <input type="checkbox" class="custom-control-input" checked id="customCheckBox4" required>
                      <label class="custom-control-label" for="customCheckBox4">Please accept our <a href="" class="color-primary">Terms and conditions</a> before Submit</label>
                      <hr />
                    </div>
                                        
                  </div>
                </div>
              </div>
            </div>
            <!-- [/Right Form Box] -->
            </div>
              
            </div>
            <!-- [/Form Step 4] -->
        </div>
      </div>
      <!-- [form Section] --> 

    </div>
  </section>
    <!-- Add Order -->
    <div class="modal fade" id="addOrderModalside">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Add Event</h5>
            <button type="button" class="close" data-dismiss="modal"> <span>&times;</span> </button>
          </div>
          <div class="modal-body">
            <form>
              <div class="form-group">
                <label class="text-black font-w500">Event Name</label>
                <input type="text" class="form-control">
              </div>
              <div class="form-group">
                <label class="text-black font-w500">Event Date</label>
                <input type="date" class="form-control">
              </div>
              <div class="form-group">
                <label class="text-black font-w500">Description</label>
                <input type="text" class="form-control">
              </div>
              <div class="form-group">
                <button type="button" class="btn btn-primary">Create</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    <footer>
      <div class="container-fluid">
        <div class="footer-content d-flex">
          <nav class="foot-nav">
            <ul>
              <li><a href="" style="margin-left:15px;">Terms of Use</a></li>
              <li><a href="" style="margin-left:15px;">Privacy Policy</a></li>
              <li><a href="" style="margin-left:15px;">Help Articles</a></li>
              <li><a href="" style="margin-left:15px;">Accessibility</a></li>
              <li><a href="" style="margin-left:15px;">Contact Us</a></li>
            </ul>
          </nav>
          <div class="footer-logo">
            <a href="index.html" class="brand-logo"> 
              <img class="logo-compact" src="./images/powerdby.png" alt=""> </a>
          </div>
        </div>
      </div>
    </footer>
</div>

<!--**********************************
        Main wrapper end
    ***********************************--> 

    <!-- [Profile Image Modal] -->
<div class="modal fade" id="profileImageModal" tabindex="-1" aria-labelledby="profileImageModal" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title fs-5" id="profileImageModalLabel">Upload Profile Picture</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="photoupload">
          <!-- Upload image input-->
          <div class="input-group mb-3 px-2 py-2">
          <input id="upload" type="file" onchange="readURL(this);" class="form-control border-0">
          <div class="input-group-append">
          <label for="upload" class="btn btn-upload"><span>+</span></label>
          </div>
          <p class="uploadtext">Add Your Profile Picture</p>
          </div>
          <!-- Uploaded image area-->
          <div class="image-area"><img id="imageResult" src="#" alt="" class="img-fluid rounded shadow-sm mx-auto d-block"></div>
          
          </div>
      </div>
    </div>
  </div>
</div>
<!-- [/Profile Image Modal] -->

<!--**********************************
        Scripts
    ***********************************--> 
<!-- Required vendors --> 

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
    </form>
</body>
</html>
