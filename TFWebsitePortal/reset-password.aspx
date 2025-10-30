<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reset-password.aspx.cs" Inherits="Extuent.reset_password" %>

<%@ Register Src="~/UCWebsite/headerPortal.ascx" TagPrefix="uc1" TagName="headerPortal" %>
<%@ Register Src="~/UCWebsite/footerPortal.ascx" TagPrefix="uc1" TagName="footerPortal" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Extuent</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="stylesheet" type="text/css" href="css_ext/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript">
        $( document ).ready(function() {

            /* Menu */
            $(".menu-link").click(function() {
                $(".navigation").slideToggle();
                return false;
            });

        });
    </script>
    <style>
         .login-text {

                background: url(../images/img-lock2.jpg) no-repeat center center  !important;
   
                background-size: contain;
                  background-repeat: no-repeat;
           }
       
</style>
    </style>
</head>
<body>
   <form id="form1" runat="server">
        <%--<uc1:header runat="server" ID="header" />--%>

   <%--     <uc1:headernewui runat="server" ID="headernewui" />--%>
        <!-- start header -->
       <uc1:headerPortal runat="server" ID="headerPortal" />
<!-- end header -->
<!-- start main-container -->
<div class="main-container">
    <div class="container">
        <!-- start signup -->
        <div class="signup">
            <div class="row">
                <div class="col-lg-5">
                    <div class="login-text">
                        <div class="txtb">
                           
                          <%--  <a href="login" title="Login" class="btn">Login</a>--%>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="form-box" id="divmain" runat="server" visible="true">
                        <!-- start logo -->
                        <div class="logo">
                            <a href="index" title="Extuent"><img src="images/logo.png" width="241" height="42" alt="Extuent"></a>
                        </div>
                        <!-- end logo -->
                        <h1>Welcome Back!</h1>
                        <h2><span>Reset Password</span></h2>
                        <div class="social-link">
                       <%--     <a href="#" title="Linkedin"><img src="images/icon_linkedin2.png" width="63" height="63" alt="Linkedin"></a>
                            <a href="#" title="Gmail"><img src="images/icon_gmail.png" width="63" height="63" alt="Gmail"></a>
                            <a href="#" title="Facebook"><img src="images/icon_facebook.png" width="63" height="63" alt="facebook"></a>--%>
                        </div>
                        <div class="form-group">
                   <input type="text" class="form-control"  runat="server" id="txtusernameInput" placeholder="Enter Your Email" required visible="false">
                        </div>
                        <div class="form-group">
                          <input type="password" class="form-control" runat="server" id="txtpasswordInput" placeholder="Enter Your New Password" required visible="false">
                        </div>
                       
                        <div class="form-group">
                              <asp:Button ID="btnlogin" runat="server" Text="Reset Password"  OnClick="btnlogin_Click" class="btn" Visible="false"/>
                              <asp:Button ID="btnreset" runat="server" Text="Save Password"  OnClick="btnreset_Click" class="btn" Visible="false"/>
                        </div>
                      
                    </div>
                    <div class="form-box" id="divSuccess" runat="server" visible="true" style="margin-top:10%">
                             <center><img src="images/email2.png" width="130px"  height="100px"/></center>
                             <br />
                        <br />
                              <span style="text-align:left;font-weight:bold;font-size:18px;">
                               You have entered as the email address for 
your Extuent.AI account. Please check your email to 
reset your password. </span>
                             </div>
                    <div class="form-box" id="divresetpassword" runat="server" visible="false" style="margin-top:10%">
                             <center><img src="images/passwordupdated.png"/></center>
                             <br />
                        <br />
                              <span style="text-align:left;font-weight:bold">
                               After password has been reset go directly to <br />
next slide to login with new password. No need 
for this page. 
</span>
                             </div>
                </div>
            </div>
        </div>
        <!-- end signup -->
    </div>
</div>
<!-- end main-container -->
<!-- start footer -->
       <uc1:footerPortal runat="server" ID="footerPortal" />
<!-- end footer -->





        
     
   <%--     <uc1:footerinner runat="server" ID="footerinner" />
        <uc1:footer runat="server" ID="footer" />--%>
    </form>
</body>
</html>
