<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="Extuent.ContactUs" %>

<%@ Register Src="~/UCWebsite/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/UCWebsite/headrerweb.ascx" TagPrefix="uc1" TagName="headrerweb" %>
<%@ Register Src="~/UCWebsite/footer_inner.ascx" TagPrefix="uc1" TagName="footer_inner" %>
<%@ Register Src="~/UCWebsite/footweb.ascx" TagPrefix="uc1" TagName="footweb" %>
<%@ Register Src="~/UCWebsite/UCPricing.ascx" TagPrefix="uc1" TagName="UCPricing" %>






<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <uc1:head runat="server" ID="head" />
    <uc1:UCPricing runat="server" ID="UCPricing" />
    <style>
        .marginsetfortext {
           padding-left:20%!important;
           padding-right:20%!important;
        }
        .elementor-backgroundnew {
            background-image:url(images/contactus.png);
            
            width:100%;
            height:100%;
            
        }
        .lblstyle {
            font-family: "Roboto", sans-serif;
            font-size:16px;
            color:black;
            text-align:left;
           

        }
        .lblstylestar {
             font-family: "Roboto", sans-serif;
            font-size:16px;
            color:red;
            text-align:left;
        }
        .leftpadd {
            border-radius: 10px!important;
            padding-left:60px!important;
            padding-right:60px!important;
        }
        .leftmargin {

          margin-left: 0px!important; 
          margin-top: 20px!important;
        }
        @media (max-width: 767.98px) {
             .leftpadd {
                border-radius: 10px!important;
                padding-left:5px!important;
                 padding-right:5px!important;
            }
               .leftmargin {

          margin-left: 0px!important; 
          margin-top: 20px!important;
        }
        }
        @media (max-width: 450px) {

            
            .leftpadd {
                border-radius: 10px!important;
                padding-left:5px!important;
                 padding-right:5px!important;
            }
              .leftmargin {

          margin-left: 0px!important; 
          margin-top: 20px!important;
        }
        }

    </style>
      <link rel="stylesheet" type="text/css" href="css_ext/style.css">
</head>
<body class="page-template page-template-elementor_header_footer page page-id-2020 jkit-color-scheme elementor-default elementor-template-full-width elementor-kit-7 elementor-page elementor-page-2020">
    <form id="form1" runat="server">
        <uc1:headrerweb runat="server" ID="headrerweb" />
      
       <div class="elementor-backgroundnew">
                <!--<div class="elementor-background-overlay"></div>-->
                <div>
                    <center><br />   
                    <br /> <h2 style="color:#fff;font-family: Roboto, sans-serif;">Contact Us</h2></center>
                    </div>
                <div class="elementor-container marginsetfortext">
                    
                    <center>
                        <br />
                        <span class="section-heading text-center my-4" style="color:white">
                        Get ready to simplify, streamline and transform your recruitment process and candidate experience.
                        </span>
                        <br />
                      
                    </center>
                    </div>
                    <section class="elementor-section elementor-inner-section elementor-element elementor-element-116e4a0c elementor-section-boxed elementor-section-height-default elementor-section-height-default" data-id="116e4a0c" data-element_type="section">
                            <div class="elementor-container elementor-column-gap-no">
                                <div class="elementor-column elementor-col-33 elementor-inner-column elementor-element elementor-element-d01ecb1" data-id="d01ecb1" data-element_type="column">
                                    <div class="elementor-widget-wrap elementor-element-populated">
                                        <div class="elementor-element elementor-element-528448e8 jkit-equal-height-disable elementor-widget elementor-widget-jkit_icon_box" data-id="528448e8" data-element_type="widget" data-widget_type="jkit_icon_box.default">
                                            <div class="elementor-widget-container">
                                                <div class="jeg-elementor-kit jkit-icon-box icon-position- elementor-animation- jeg_module_2509_1_648764e737311">
                                                    <div class="jkit-icon-box-wrapper hover-from-left" style="border:none;">
                                                        <div class="icon-box icon-box-header elementor-animation-">
                                                            <div class="icon style-color"><i aria-hidden="true" class="jki jki-map-marker1-light" style="color:#ff6700"></i></div>
                                                        </div>
                                                        <div class="icon-box icon-box-body">
                                                            <h3 class="title" style="color:#fff">Office Location</h3>
                                                            <p class="icon-box-description" style="color:#fff">
                                                                Wilmington, Delaware 19801<br />
                                                            </p>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="elementor-column elementor-col-33 elementor-inner-column elementor-element elementor-element-640507ca" data-id="640507ca" data-element_type="column">
                                    <div class="elementor-widget-wrap elementor-element-populated">
                                        <div class="elementor-element elementor-element-3b696aa3 jkit-equal-height-disable elementor-widget elementor-widget-jkit_icon_box" data-id="3b696aa3" data-element_type="widget" data-widget_type="jkit_icon_box.default">
                                            <div class="elementor-widget-container">
                                                <div class="jeg-elementor-kit jkit-icon-box icon-position- elementor-animation- jeg_module_2509_2_648764e74d6eb">
                                                    <div class="jkit-icon-box-wrapper hover-from-left" style="border:none;">
                                                        <div class="icon-box icon-box-header elementor-animation-">
                                                            <div class="icon style-color"><i aria-hidden="true" class="jki jki-phone-handset-light" style="color:#ff6700"></i></div>
                                                        </div>
                                                        <div class="icon-box icon-box-body">
                                                            <h3 class="title" style="color:#fff">Phone Number</h3>
                                                            <p class="icon-box-description" style="color:#fff">
                                                                (+1)917 900 9760<br />
                                                            </p>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="elementor-column elementor-col-33 elementor-inner-column elementor-element elementor-element-2e24fbce" data-id="2e24fbce" data-element_type="column">
                                    <div class="elementor-widget-wrap elementor-element-populated">
                                        <div class="elementor-element elementor-element-2de8b9db jkit-equal-height-disable elementor-widget elementor-widget-jkit_icon_box" data-id="2de8b9db" data-element_type="widget" data-widget_type="jkit_icon_box.default">
                                            <div class="elementor-widget-container">
                                                <div class="jeg-elementor-kit jkit-icon-box icon-position- elementor-animation- jeg_module_2509_3_648764e76a040">
                                                    <div class="jkit-icon-box-wrapper hover-from-left" style="border:none;">
                                                        <div class="icon-box icon-box-header elementor-animation-">
                                                            <div class="icon style-color"><i aria-hidden="true" class="jki jki-envelope2-light" style="color:#ff6700"></i></div>
                                                        </div>
                                                        <div class="icon-box icon-box-body">
                                                            <h3 class="title" style="color:#fff">Email Address</h3>
                                                            <p class="icon-box-description" style="color:#fff">
                                                             sales@extuent.ai   <br />
                                                            </p>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                               
                            </div>
                        </section>
                 
                </div>
        <div class="main-container" >
            <div class="container" >
                <!-- start signup -->

                <div class="signup leftpadd">

                    <div class="row">
                        <div class="col-sm-12 my-4 leftmargin" >
                      
                         <center>  <h5 style="font-family: Roboto, sans-serif; font-size: 16px; color: green;" id="lblmessage" runat="server"></h5>
                            </center> 
                          

                        </div>
                        <div class="col-sm-12 my-4 leftmargin" style="margin-top: 40px;">
                            <h2 style="font-family: Roboto, sans-serif; font-size: 22px;">Your Details</h2>
                            <h5 style="font-family: Roboto, sans-serif; font-size: 16px; color: gray;">Let us know how to get back to you.</h5>

                            <hr />

                        </div>
                       </div>

                       <div class="row my-4">
                        <div class="col-sm" style="text-align: left;">
                           
                                    <span class="lblstyle">First Name <span class="lblstylestar">*</span> </span>
                                    <input tabindex="1" type="text" style="border-radius: 3px; margin-top: 10px; background-color:#F6F7FA;border-style: solid;border-width: 1px 1px 1px 1px; border-color: #EAECF1;" runat="server" id="txtFirstName" required>
                                </div>
                                <div class="col-sm" style="text-align: left;">
                                    <span class="lblstyle" style="text-align: left;">Last Name <span class="lblstylestar">*</span> </span>
                                    <input type="text" tabindex="2" style="border-radius: 3px; margin-top: 10px; background-color:#F6F7FA;border-style: solid;border-width: 1px 1px 1px 1px; border-color: #EAECF1;" runat="server" id="txtLastName" required>
                                </div>
                         </div>
                     
                               <div class="row my-4">
                           
                               <div class="col-sm" style="text-align: left;">
                                
                                    <span class="lblstyle">Email Address <span class="lblstylestar">*</span> </span>
                                    <input type="text" tabindex="3" style="border-radius: 3px; margin-top: 10px; background-color:#F6F7FA;border-style: solid;border-width: 1px 1px 1px 1px; border-color: #EAECF1;" runat="server" id="txtEmailAddress" required>
                                    <span style="color: lightgray">Example: user@website.com</span>
                                </div>
                                    <div class="col-sm" style="text-align: left;">
                                
                                    <span class="lblstyle" style="text-align: left;">Company Name <span class="lblstylestar">*</span> </span>
                                    <input type="text" tabindex="4" style="border-radius: 3px; margin-top: 10px; background-color:#F6F7FA;border-style: solid;border-width: 1px 1px 1px 1px; border-color: #EAECF1;" runat="server" id="txtCompanyName" required>
                                </div>
                         </div>
                                
                                <div class="row my-4">
                                       <div class="col-sm" style="text-align: left;">
                                
                                    <span class="lblstyle">Number of Recruiters <span class="lblstylestar">*</span> </span>
                                    <input type="text" tabindex="5" style="border-radius: 3px; margin-top: 10px; background-color:#F6F7FA;border-style: solid;border-width: 1px 1px 1px 1px; border-color: #EAECF1;" runat="server" id="txtNoofReq" required>
                                </div>
                                <div class="col-sm" style="text-align: left;">
                             
                                    <span class="lblstyle">Average Hiring Requirement Per Month <span class="lblstylestar">*</span> </span>
                                    <input type="text" tabindex="6" style="border-radius: 3px; margin-top: 10px; background-color:#F6F7FA;border-style: solid;border-width: 1px 1px 1px 1px; border-color: #EAECF1;" runat="server" id="txtAvgHire" required>
                                </div>
                                    </div>
                                       
                           
                     
                          <div class="row">
                        <div class="col-sm-12 leftmargin" style="margin-top: 0px;">
                            <h2 style="font-family: Roboto, sans-serif; font-size: 22px;">How can we help?</h2>
                            <h5 style="font-family: Roboto, sans-serif; font-size: 16px; color: gray;">Feel free to ask a question or simply leave a comment</h5>

                            <div class="form-group" style="text-align: left;">
                                <br />
                                <br />
                                <span class="lblstyle" style="text-align: left;">Comments / Questions  <span class="lblstylestar">*</span> </span>
                                <textarea rows="10" tabindex="7" style="border-radius: 3px; margin-top: 10px; background-color:#F6F7FA;border-style: solid;border-width: 1px 1px 1px 1px; border-color: #EAECF1;" placeholder="Add text" runat="server" id="txtComments" required></textarea>
                            </div>

                        </div>

                        <div class="form-group">
                            <center>  <asp:Button ID="btnlogin" tabindex="8" runat="server" Text="Send Message" OnClick="btnlogin_Click"  class="btn" />
                                    </center>

                        </div>
                    </div>
                    </div>
                    <div class="row">
                        <div class="form-box" id="divSuccess" runat="server" visible="false">
                            <center><img src="images/signedup.png"/></center>
                            <br />
                            <span style="text-align: left; font-weight: bold">Thank You! Your sign up is complete…<br />
                                <br />
                                Check your email to verify the account details and enjoy the Extuent Recruitment Experience!</span>
                        </div>
                    </div>
         
                <!-- end signup -->
            </div>
</div>
				
        
                            <div class="form-box" id="mdiv" runat="server" visible="false">
                                   </div>


                                
                              
                                


                         

                        
        <uc1:footer_inner runat="server" ID="footer_inner" />
    </form>
    <uc1:footweb runat="server" ID="footweb" />
</body>
</html>
