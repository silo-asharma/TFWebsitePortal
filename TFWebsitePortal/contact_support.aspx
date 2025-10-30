<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contact_support.aspx.cs" Inherits="Extuent.contact_support" %>

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
</head>
<body>
    <form id="form1" runat="server">
   <div class="header">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-auto">
                <!-- start logo -->
                <div class="logo">
                    <a href="" title="Extuent"><img src="images/logo.png" width="241" height="42" alt="Extuent"></a>
                </div>
                <!-- end logo -->
            </div>
            <div class="col">
                <div class="menu-link">
                    <img src="images/menu.svg" width="30" height="30" alt="menu">
                </div>
                <!-- start navigation -->
                <div class="navigation">
                    <ul style="list-style: none;">
                     <%--   <li><a href="#" title="Features">Features</a></li>
                        <li><a href="#" title="Clients">Clients</a></li>
                        <li><a href="#" title="Login">Login</a></li>
                        <li><a href="#" title="Pricing">Pricing</a></li>
                        <li><a href="#" title="Get Demo">Get Demo</a></li>--%>
                    </ul>
                </div>
                <!-- end navigation -->
            </div>
        </div>
    </div>
</div>
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
                            <h2>Share your Feedback!</h2>
                            <p>Stay connected with us</p>
                       <%--     <a href="login" title="Login" class="btn">Login</a>--%>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="form-box" id="mdiv" runat="server" visible="true">
                        <!-- start logo -->
                        <div class="logo">
                            <a href="" title="Extuent"><img src="images/logo.png" width="241" height="42" alt="Extuent"></a>
                        </div>
                        <!-- end logo -->
                        <h1>Let’s Get Started</h1>
                        <h2><span>Share Your Feedback</span></h2>
                        <div class="social-link">
                          <%--  <a href="#" title="Linkedin"><img src="images/icon_linkedin2.png" width="63" height="63" alt="Linkedin"></a>
                            <a href="#" title="Gmail"><img src="images/icon_gmail.png" width="63" height="63" alt="Gmail"></a>
                            <a href="#" title="Facebook"><img src="images/icon_facebook.png" width="63" height="63" alt="facebook"></a>--%>
                        </div>
                         <%--<div class="form-group">
                            <input type="text" class="form-control" placeholder="Company Name" runat="server" id="txtCompanyName" required>
                        </div>--%>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Full Name" runat="server" id="txtfullName" required>
                        </div>
                         <div class="form-group">
                            <input type="text" class="form-control" placeholder="Contact Number" runat="server" id="txtcontactNumber" required>
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-control" placeholder="Email" runat="server" id="txtemail" required>
                        </div>
                         <div class="form-group">
                            <textarea type="text" class="form-control" placeholder="Details" runat="server" id="details" rows="4" cols="50" required></textarea>
                        </div>
                      <%--  <div class="form-group">
                            <input type="password" class="form-control" placeholder="Password" runat="server" id="txtpassword" required>
                        </div>--%>
                         <%--  <label for="agree">
                            <input type="checkbox" name="agree" id="agree" required>
                            I Agree to <a href="terms-and-conditions" target="_blank" title="Terms and conditions">Terms of Use and Privacy Policy</a> 
                        </label>--%>
                        <div class="form-group">
                             <asp:Button ID="btnlogin" runat="server" Text="Send To Support Team"  OnClick="btnlogin_Click" class="btn" />
                                      
                          <%--  <button type="submit" class="btn">Sign Up</button>--%>
                        </div>
                     
                    </div>
                         <div class="form-box" id="divSuccess" runat="server" visible="false">
                             <center><img src="images/feedback.png"/></center>
                             <br />
                              <span style="text-align:left;font-weight:bold">Thank you for sharing your feedback.<br /><br />
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
<div class="footer">
    <div class="container">
        <div class="row align-items-center">
            <div class="col">
                <!-- start footer-links -->
                <div class="footer-links">
                    <ul style="list-style: none;">
                     <%--   <li><a href="#" title="Terms of Use">Terms of Use</a></li>
                        <li><a href="#" title="Privacy Policy">Privacy Policy</a></li>
                        <li><a href="#" title="Help Articles">Help Articles</a></li>
                        <li><a href="#" title="Accessibility">Accessibility</a></li>
                        <li><a href="#" title="Contact Us">Contact Us</a></li>--%>
                    </ul>
                </div>
                <!-- end footer-links -->
            </div>
            <div class="col-auto">
                <div class="footer-logo">
                    <p>Powered By</p>
                    <!-- start imgb -->
                    <div class="imgb">
                        <a href="" title="Extuent"><img src="images/logo.png" width="241" height="42" alt="Extuent"></a>
                    </div>
                    <!-- end imgb -->
                </div>
            </div>
        </div>
    </div>
</div>
    </form>
</body>
</html>
