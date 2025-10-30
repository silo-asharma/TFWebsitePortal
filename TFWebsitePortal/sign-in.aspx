<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sign-in.aspx.cs" Inherits="Extuent.sign_in" EnableEventValidation="false"%>

<%@ Register Src="~/UC/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/UC/header.ascx" TagPrefix="uc1" TagName="header" %>
<%@ Register Src="~/UC/footer.ascx" TagPrefix="uc1" TagName="footer" %>
<%@ Register Src="~/UC/headnewui.ascx" TagPrefix="uc1" TagName="headnewui" %>
<%@ Register Src="~/UC/headernewui.ascx" TagPrefix="uc1" TagName="headernewui" %>
<%@ Register Src="~/UC/footer-inner.ascx" TagPrefix="uc1" TagName="footerinner" %>
<%@ Register Src="~/UCWebsite/headerPortal.ascx" TagPrefix="uc1" TagName="headerPortal" %>
<%@ Register Src="~/UCWebsite/footerPortal.ascx" TagPrefix="uc1" TagName="footerPortal" %>









<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    
    <link rel="stylesheet" type="text/css" href="css_ext/style.css">
     
     <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="https://getbootstrap.com/docs/4.6/dist/js/bootstrap.bundle.min.js"></script>

  
    
       <style>
          .img-modal{
            height:250px;
        }

        .img-modal img{
            height: 100%;
    object-fit: cover;
    width: 100%;
    border-top-left-radius: 1.25rem;
    border-bottom-left-radius: 1.25rem;
        }

        .input-field{
            background: #95d0e259;
        }

        .send-button{
            color: #fff;
    background-color: #95d0e2;
    border-color: #95d0e2;
        }

        .content-box .form-control {
    height: 35px;
}

        .close-modal-btn{
            position: absolute;
    right: 30px;
    top: 5px;
    background: #eee;
    border-radius: 50%;
    width: 30px;
    border: none;
    height: 30px;
}
 .login-text {

                background: url(../images/img-login.jpg) no-repeat  !important;
                background-size: cover;
                  background-repeat: no-repeat;
                   
           }
       .signup .form-box .logo img {
        height: 50px;
    }
</style>
    
    <script>

        function ShowPopup(title, body) {
           // alert('hello');


            $("#exampleModalCenter .modal-title").html(title);
            $("#exampleModalCenter .content-desc").html(body);
            $("#exampleModalCenter").modal("show");
        }


           
       

   </script>
 

<%--    <uc1:headnewui runat="server" id="headnewui" />--%>
</head>
<body>
    <form id="form1" runat="server">
        <%--<uc1:header runat="server" ID="header" />--%>

   <%--     <uc1:headernewui runat="server" ID="headernewui" />--%>
        <!-- start header -->

        <uc1:headerPortal runat="server" id="headerPortal" />

<!-- end header -->
<!-- start main-container -->
<div class="main-container">
    <div class="container">
        <!-- start signup -->
        <div class="signup">
            <div class="row">
                <div class="col-lg-5" >
                    <div class="login-text">
                        <div class="txtb">
                            <br/>

                            <h2 id="lblwel" runat="server" visible="false"></h2>
                            <p id="lblwel2" runat="server" visible="false"></p>
                            <%--<a href="create-account" title="Sign Up" class="btn" id="btnsignup" runat="server" visible="false">Sign Up</a>--%>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="form-box">
                        <!-- start logo -->
                        <div class="logo">
                            <a href="index" title="Extuent"><img src="images/logo.png" width="241" height="42" alt="Extuent"></a>
                        </div>
                        <!-- end logo -->
                        <h1>Let’s Get Started</h1>
                        <h2><span>Login In Account</span></h2>
                        <div class="social-link">
                       <%--     <a href="#" title="Linkedin"><img src="images/icon_linkedin2.png" width="63" height="63" alt="Linkedin"></a>
                            <a href="#" title="Gmail"><img src="images/icon_gmail.png" width="63" height="63" alt="Gmail"></a>
                            <a href="#" title="Facebook"><img src="images/icon_facebook.png" width="63" height="63" alt="facebook"></a>--%>
                        </div>
                        <div class="form-group">
                   <input type="text" class="form-control"  runat="server" id="usernameInput" placeholder="Enter Phone No" required>
                        </div>
                        <div class="form-group">
                          <input type="password" class="form-control" runat="server" id="passwordInput" placeholder="Enter OTP" required>
                        </div>
                       
                        <div class="form-group">
                              <asp:Button ID="btnlogin" runat="server" Text="Login"  OnClick="btnlogin_Click" class="btn"/>
                     
                        </div>
<div style="margin-top: 20px;margin-left:50px; font-size: 13px; color: #333; font-family: Arial, sans-serif; max-width: 400px;">
    <!-- First line: Account creation -->
    <div style="margin-bottom: 10px;">
        <span>New to Trade Fabric? </span>
        <a href="/register" style="color: #007BFF; text-decoration: none;">Create an account</a>
    </div>

    <!-- Second line: Checkbox with label -->
    <div style=" align-items: flex-start;">
       
        <label for="chkid" style="font-size: 12px; color: black; line-height: 1.4;">
            I agree to the 
            <a href="/terms" target="_blank" style="color: #007BFF; text-decoration: none;">Terms & Conditions</a> 
            and 
            <a href="/privacy" target="_blank" style="color: #007BFF; text-decoration: none;">Privacy Policy</a>.
        </label>
    </div>
</div>


                    </div>
                </div>
            </div>
        </div>
        <!-- end signup -->
    </div>
    <asp:CheckBox 
    runat="server" 
    ID="chkid" 
    Text="" 
    style="margin-top: 2px;" Visible="false" />
     <a href="forgot-password?email=sendemail" target="_blank" title="Forgot Password" style="visibility:hidden">Forgot Password?</a> 
</div>
<!-- end main-container -->
<!-- start footer -->
        <uc1:footerPortal runat="server" id="footerPortal" />
<!-- end footer -->





        
     
   <%--     <uc1:footerinner runat="server" ID="footerinner" />
        <uc1:footer runat="server" ID="footer" />--%>



        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        
          <div class="modal-body p-0">
            <div class="row">
                <div class="col-4 pr-0">
                    <div class="img-modal">
                        <img src="images/alertimagesuccess.png" alt="" class="">
                    </div>
                </div>
                <div class="col-8 pl-0 d-flex align-items-center justify-content-center">
                    
                    <div class="content-box p-3 text-center">

                        <h6 class="modal-title">Success!</h6>
                        <h6 class="content-desc">Question Deleted.</h6>
                        
                        
                          <button type="button" class="btn close-btn mt-3" data-dismiss="modal" style="background:#ff8029">Close</button>
                        
                    </div>
                </div>
            </div>
          </div>
       
      </div>
    </div>
  </div>

    </form>

    
        


    <script type="text/javascript">
        $( document ).ready(function() {
            
            /* Menu */
            $(".menu-link").click(function() {
                $(".navigation").slideToggle();
                return false;
            

            });  
        });
    </script>
     </body>
</html>
