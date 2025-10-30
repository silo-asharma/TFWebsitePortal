<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Company_signup.aspx.cs" Inherits="Extuent.Company_signup" EnableEventValidation="false" %>

<%@ Register Src="~/UCWebsite/headerPortal.ascx" TagPrefix="uc1" TagName="headerPortal" %>
<%@ Register Src="~/UCWebsite/footerPortal.ascx" TagPrefix="uc1" TagName="footerPortal" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta charSet="utf-8" />
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

                background: url(../images/img-signup.jpg) no-repeat center center !important;
           }
    </style>
</head>
<body>
    <form id="form1" runat="server">
  
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
                            <h2></h2>
                            <br/>


                     <%--       <a href="login" title="Login" class="btn">Login</a>--%>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="form-box" id="mdiv" runat="server" visible="true">
                        <!-- start logo -->
                        <div class="logo">
                            <a href="index" title="Extuent"><img src="images/logo.png" width="241" height="42" alt="Extuent"></a>
                        </div>
                        <!-- end logo -->
                        <h1>Let’s Get Started</h1>
                        <h2><span>Create An Account</span></h2>
                        <div class="social-link">
                          <%--  <a href="#" title="Linkedin"><img src="images/icon_linkedin2.png" width="63" height="63" alt="Linkedin"></a>
                            <a href="#" title="Gmail"><img src="images/icon_gmail.png" width="63" height="63" alt="Gmail"></a>
                            <a href="#" title="Facebook"><img src="images/icon_facebook.png" width="63" height="63" alt="facebook"></a>--%>
                        </div>
                         <div class="form-group">
                            <input type="text" class="form-control" placeholder="Company Name" runat="server" id="txtCompanyName" required>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Full Name" runat="server" id="txtfullName" required>
                        </div>
                         <div class="form-group">
                            <input type="tel" minlength="10" maxlength="10" onkeypress="return (event.charCode !=8 && event.charCode ==0 || (event.charCode >= 48 && event.charCode <= 57))" class="form-control" placeholder="Contact Number" runat="server" id="txtcontactNumber" required>
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-control" placeholder="Email" runat="server" id="txtemail" required>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" placeholder="Password" runat="server" id="txtpassword" required>
                        </div>
                           <label for="agree">
                            <input type="checkbox" name="agree" id="agree" required>
                            I Agree to <a href="terms-and-conditions" target="_blank" title="Terms and conditions">Terms of Use and Privacy Policy</a> 
                        </label>
                        <div class="form-group">
                             <asp:Button ID="btnlogin" runat="server" Text="Sign Up"  OnClick="btnlogin_Click" class="btn" />
                                      
                          <%--  <button type="submit" class="btn">Sign Up</button>--%>
                        </div>
                     
                    </div>
                         <div class="form-box" id="divSuccess" runat="server" visible="false">
                             <center><img src="images/signedup.png"/></center>
                             <br />
                              <span style="text-align:left;font-weight:bold;font-size:14px">Thank You! Your sign up is complete…<br /><br />
You have entered <email> as the email address <%= emailid %> for your Extuent.AI account. <br />Check your email to verify 
the account details and enjoy the Extuent.AI experience.
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
    </form>
</body>
</html>
