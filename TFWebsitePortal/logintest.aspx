<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="logintest.aspx.cs" Inherits="Extuent.logintest" %>

<%@ Register Src="~/UCWebsite/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/UCWebsite/headrerweb.ascx" TagPrefix="uc1" TagName="headrerweb" %>
<%@ Register Src="~/UCWebsite/footer_inner.ascx" TagPrefix="uc1" TagName="footer_inner" %>
<%@ Register Src="~/UCWebsite/footweb.ascx" TagPrefix="uc1" TagName="footweb" %>





<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <uc1:head runat="server" ID="head" />
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
</head>
<body>
    <form id="form1" runat="server">
        <uc1:headrerweb runat="server" ID="headrerweb" />
        <div class="main-container">
    <div class="container">
        <!-- start signup -->
        <div class="signup">
            <div class="row">
                <div class="col-lg-5" >
                    <div class="login-text">
                        <div class="txtb">
                            <h2 id="lblwel" runat="server"></h2>
                            <p id="lblwel2" runat="server"></p>
                            <a href="create-account" title="Sign Up" class="btn" id="btnsignup" runat="server">Sign Up</a>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="form-box">
                        <!-- start logo -->
                        <div class="logo">
                            <a href="index.html" title="Extuent"><img src="images/logo.png" width="241" height="42" alt="Extuent"></a>
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
                   <input type="text" class="form-control"  runat="server" id="usernameInput" placeholder="Enter Your Email" required>
                        </div>
                        <div class="form-group">
                          <input type="password" class="form-control" runat="server" id="passwordInput" placeholder="Enter Your Password" required>
                        </div>
                       
                        <div class="form-group">
                              <asp:Button ID="btnlogin" runat="server" Text="Login"   class="btn"/>
                     
                        </div>
                        <label for="agree">
                         
                        <a href="forgot-password?email=sendemail" target="_blank" title="Forgot Password">Forgot Password?</a> 
                        </label>
                      <asp:CheckBox runat="server" ID="chkid" Text=" &nbsp;&nbsp;I Agree to the Terms of Use and Privacy Policy " style="font-size:12px;text-align:center;color:black;" Visible="false"/>
                    </div>
                </div>
            </div>
        </div>
        <!-- end signup -->
    </div>
</div>

        <uc1:footer_inner runat="server" ID="footer_inner" />
    </form>
    <uc1:footweb runat="server" ID="footweb" />
</body>
</html>
