<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="foot.ascx.cs" Inherits="exportimportbidcp.app.UC.foot" %>
  </div>
            </div>
        </div>
        <!--**********************************
            Content body end
        ***********************************-->


        <!--**********************************
            Footer start
        ***********************************-->
        <div class="footer">
            
        </div>
        <!--**********************************
            Footer end
        ***********************************-->

        <!--**********************************
           Support ticket button start
        ***********************************-->

        <!--**********************************
           Support ticket button end
        ***********************************-->

        
    </div>
    <!--**********************************
        Main wrapper end
    ***********************************-->

<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
        aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content p-0">
                <div class="modal-body p-0">
                    <div class="">
                        <div class="row">
                            <div class="col-4 pr-0">
                                <div class="img-modal">
                                    <img src="images/alertimagesuccess.png" alt="" class="">
                                </div>
                            </div>
                            <div class="col-8 pl-0 d-flex align-items-center">
                                <button type="button" class="close-modal-btn" data-dismiss="modal">&times;</button>
                                <div class="content-box p-3 text-center">

                                    <h3 class="modal-title"></h3>
                                    <p class="content-desc">
                                        
                                    </p>
                                    <%--<input type="email" name="" id="" class="form-control input-field"
                                        placeholder="Enter Email Address">--%>
                                    <% if(pageNameFooter!="#"){ %>
                                    <a href="<%= pageNameFooter %> " class="btn btn-sm send-button mt-2" style="background:#FE634E">Close</a>
                                    <%} else{ %>
                                      <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <%} %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-primary">Save changes</button>
            </div> -->
            </div>
        </div>
    </div>



    <!-- Required vendors -->
    <script src="./vendor/global/global.min.js"></script>
	<script src="./vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
    <script src="./js/custom.min.js"></script>
	<script src="./js/deznav-init.js"></script>
	
    


    <script src="./vendor/jquery-steps/build/jquery.steps.min.js"></script>
    <script src="./vendor/jquery-validation/jquery.validate.min.js"></script>
    <!-- Form validate init -->
    <script src="./js/plugins-init/jquery.validate-init.js"></script>



   <!-- Form Steps -->
	<script src="./vendor/jquery-smartwizard/dist/js/jquery.smartWizard.js"></script>
	
	<script>
		$(document).ready(function(){
			// SmartWizard initialize
			$('#smartwizard').smartWizard(); 
		});
	</script>
 <!-- Footer end here -->
 <!-- jQuery first, then Popper.js, then Bootstrap JS -->

 <script src="assets/js/popper.js"></script>
 <script src="assets/js/bootstrap.js"></script>
 <!-- Owl carousel JS -->  
 <script src="assets/js/owl.carousel.js"></script>
 <!-- Chart JS -->  
 <script src="assets/js/chart.js"></script>
 <!-- Checks JS -->  
 <script src="assets/js/checks.js"></script>
 <!-- Slimscroll JS -->  
 <script src="assets/js/slimscroll.min.js"></script>
 <!-- Counterup JS -->  
 <script src="assets/js/waypoints.min.js"></script>
 <script src="assets/js/counterup.min.js"></script>      
 <!-- Theme main JS -->  
 <script src="assets/js/main.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
  <style>
      .btn-secondary {
    color: #fff;
    background-color: #FE634E;
    border-color: #FE634E;
}
      .content-box {
          position: absolute;
          top: 50%;
          left: 50%;
          transform: translate(-50%, -50%);
          width:100%;
      }
  </style>