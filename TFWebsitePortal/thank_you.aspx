<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="thank_you.aspx.cs" Inherits="Extuent.thank_you" %>

<%@ Register Src="~/UC/footer-inner.ascx" TagPrefix="uc1" TagName="footerinner" %>
<%@ Register Src="~/UC/footer.ascx" TagPrefix="uc1" TagName="footer" %>
<%@ Register Src="~/UC/header.ascx" TagPrefix="uc1" TagName="header" %>
<%@ Register Src="~/UC/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/UC/headnewui.ascx" TagPrefix="uc1" TagName="headnewui" %>
<%@ Register Src="~/UC/footernewui.ascx" TagPrefix="uc1" TagName="footernewui" %>
<%@ Register Src="~/UC/headernewui.ascx" TagPrefix="uc1" TagName="headernewui" %>




<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <uc1:headnewui runat="server" ID="headnewui1" />
     <link rel="stylesheet" type="text/css" href="css_ext/style.css">

     <script src="assets/js/jquery.js"></script>
     <script>
         var a;
         function getDeviceNameorBrowser() {
             if (navigator.userAgent.match(/iPhone/i)
             || navigator.userAgent.match(/iPad/i)
             || navigator.userAgent.match(/iPod/i)
            ) {
                 a = "iPhone";
             }
             else if (navigator.userAgent.match(/Android/i))
             {
                 a = "Android";

             }
             else {
                 a = "Others";
             }

             return a;
         }
         function fnBrowserDetect() {

             let userAgent = navigator.userAgent;
             let browserName;

             if (userAgent.match(/chrome|chromium|crios/i)) {
                 browserName = "chrome";
             } else if (userAgent.match(/firefox|fxios/i)) {
                 browserName = "firefox";
             } else if (userAgent.match(/safari/i)) {
                 browserName = "safari";
             } else if (userAgent.match(/opr\//i)) {
                 browserName = "opera";
             } else if (userAgent.match(/edg/i)) {
                 browserName = "edge";
             } else {
                 browserName = "No browser detection";
             }

             return browserName;
         }
        <%-- $(window).on("load", function () {
         
             var resDevice = getDeviceNameorBrowser();
             //alert(resDevice);
             var browserName = fnBrowserDetect();
           
             document.getElementById("hdnDeviceName").Value = resDevice;
             document.getElementById("hdnBrowserName").Value = browserName;

             alert(resDevice);
             alert(browserName);

             alert(document.getElementById("hdnDeviceName").Value);
             var candida_Id = parseInt(<%= candidate_id %>);
             alert(candida_Id);

             $.ajax({
                 type: "POST",
                 url: "thank_you.aspx/assignUrl",
                 data: '{QID: "' + resDevice + '",CandidateID:"' + candida_Id + '" }',
                 contentType: "application/json; charset=utf-8",
                 dataType: "json",
                 success: OnSuccess,
                 failure: function (response) {
                     alert(response.d);
                 }
             });

         }
         )
         --%>
        
         </script>


   
</head>
<body>
    <form id="form1" runat="server">
        <!--start page Loader -->
        <uc1:headernewui runat="server" ID="headernewui" />
       
        <div id="main-wrapper">



        <div class="content-body1">

            <!-- Add Order -->

            <div class="row">


         <div class="col-xl-12 col-xxl-12">
          
                   
              <section >
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-6">
                                    <div class="text-center">
                                           <img src="images/thankyou.png" alt="" class="img-fluid">
                                       
                                        <div class="mt-5">
                                           
                                      
                                          <%--  <!-- <h1 class="fw-bold display-1">404</h1> -->
                                            <h3 class="text-uppercase mt-3">Interview Successfully Completed </h3>
                                            <p class="text-muted" style="font-weight:bold">You have successfully completed your interview, you can exit the interview process, <br /> by clicking "Exit Interview" button below..<br />
</p>--%>
                                            <div class="mt-4">
                                                <center>
                                                    <% if (statusofinterview == "False")
                                                        { %>
                                                      <a href="https://extuent.ai/joblist/" title="Sign Up" class="btn">View More Jobs</a>
                                                
                                                    <%} %>
                                                        <%--<asp:Button ID="btnlogin" runat="server" Text="Exit Interview" style="width:200px;border-color:#FF7416;color:white;height:50px;border-radius:12px"  class="btn btn-primary"/>--%>
                               </center> 

                                                <br />
                                          <%--      <center><span>Need help with your interview? <a href="#" style="color:#FF7416">Contact Support</a> </center></span></center>
                                                 <center><br /> <a href="#" style="color:#FF7416">View Help Articles</a> </center>
                                              --%>
                                            </div>
                                        </div>

                                    </div>
                                </div><!--end col-->
                            </div><!--end row-->
                        </div><!--end container-->
                    </section>
            <!-- end main content-->

        </div>
    


                
                </div>
            </div>
            </div>
        <br />
        <br />
        <br />
     
        <!--end back-to-top-->

        <!-- JAVASCRIPT -->
       


        <uc1:footerinner runat="server" ID="footerinner" />
        <uc1:footernewui runat="server" ID="footernewui" />

        <asp:HiddenField ID="hdnDeviceName" runat="server" Value="" />
        <asp:HiddenField ID="hdnBrowserName" runat="server" Value="" />
    </form>
</body>
</html>
