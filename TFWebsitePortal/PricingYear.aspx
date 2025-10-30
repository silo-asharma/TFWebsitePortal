<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PricingYear.aspx.cs" Inherits="Extuent.PricingYear" %>

<%@ Register Src="~/UCWebsite/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/UCWebsite/headrerweb.ascx" TagPrefix="uc1" TagName="headrerweb" %>
<%@ Register Src="~/UCWebsite/footer_inner.ascx" TagPrefix="uc1" TagName="footer_inner" %>
<%@ Register Src="~/UCWebsite/footweb.ascx" TagPrefix="uc1" TagName="footweb" %>
<%@ Register Src="~/UCWebsite/UCPricing.ascx" TagPrefix="uc1" TagName="UCPricing" %>






<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <uc1:head runat="server" ID="head" />
    <uc1:UCPricing runat="server" id="UCPricing" />
     <style>
             .pricing-plans .plan .plan-header h3 .figure .amount:after {
                            position: relative;
                            top: -6px;
                            content: "/YEAR";
                            letter-spacing: normal;
                            font-weight: 400;
                            vertical-align: bottom;
                            font-size: 0.8rem;
                            text-transform: uppercase;
                        }

                  .divvisiable {

                display:block;

            }
        .Mobiledivvisiable {
              display:none;
        }
        @media (max-width: 450px) {

            .divvisiable {

                display:none;

            }
              .Mobiledivvisiable {
              display:block;
        }
        }
           @media (max-width: 767.98px) {

            .divvisiable {

                display:none;

            }
              .Mobiledivvisiable {
              display:block;
        }
        }
     </style>
</head>
<body class="page-template page-template-elementor_header_footer page page-id-2020 jkit-color-scheme elementor-default elementor-template-full-width elementor-kit-7 elementor-page elementor-page-2020">
    <form id="form1" runat="server">
        <uc1:headrerweb runat="server" ID="headrerweb" />

        <div class="elementor-backgroundnew">
                <!--<div class="elementor-background-overlay"></div>-->
                <div>
                    <center><br />   
                    <br /> <h2 style="color:#fff;font-family: Roboto, sans-serif;">Pricing</h2></center>
                    </div>
                <div class="elementor-container marginsetfortext">
                    
                    <center>
                        <br />
                        <span class="section-heading text-center my-4" style="color:white">
                            Transforming your interview process was never
                            this easy and cost effective. Select the plan that
                            suits your needs and experience the most
                            affordable and efficient video interview tool.
                        </span>
                        <br />
                        <br />
                    </center>
                    </div>
                </div>
            



			
						
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-heading text-center my-4">
                            <h3 style="color:#011633">Sign Up Today and get First 3 Months Free!</h3>
                            <!--<h6 style="color:#ff6700"></h6>-->
                        </div>
                        <div class="text-center">
                            <div class="button-group">
                                <a href="pricingyear"><button type="button" class="btn btn-default active" style="border-top-right-radius: 0px;border-bottom-right-radius: 0px;">Yearly</button></a>
                                <a href="pricing"> <button type="button" class="btn btn-default" style="background-color:lightgray;color:#011633;margin-left:-5px;border-top-left-radius: 0px;border-bottom-left-radius: 0px;">Monthly</button></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 divvisiable">
                        <div class="pricing-plans d-flex flex-column flex-lg-row my-auto">
                            <div class="plan options">
                                <div class="plan-info">
                                    <ul class="list-group first text-left">
                                        <li class="list-group-item leftlifont">Recording Minutes</li>
                                        <li class="list-group-item leftlifont"><strong>Unlimited Jobs</strong> </li>

                                        <li class="list-group-item leftlifont">Multiple Admins</li>
                                        <li class="list-group-item leftlifont">Unlimited Users</li>
                                        <li class="list-group-item leftlifont">Customised Email Template</li>
                                        <li class="list-group-item leftlifont">Branding</li>
                                        <li class="list-group-item leftlifont">AI Based Assesments</li>
                                        <li class="list-group-item leftlifont">24/7 Suppport</li>
                                    </ul>
                                </div>
                            </div>

                            <div class="plan">
                                <div class="plan-header silver">
                                    <h3 class="panel-heading">
                                        <span class="label">Basic</span>
                                        <div class="figure">
                                            <span class="amount">99</span>
                                        </div>
                                    </h3>
                                </div>
                                <div class="plan-info">
                                    <ul class="list-group">
                                        <li class="list-group-item">2400 minutes</li>
                                        <li class="list-group-item"><i class="fas fa-check text-success fa-lg"></i></li>

                                        <li class="list-group-item"><i class="fas fa-check text-success fa-lg"></i></li>
                                        <li class="list-group-item"><i class="fas fa-times text-danger fa-lg"></i></li>
                                        <li class="list-group-item"><i class="fas fa-times text-danger fa-lg"></i></li>
                                        <li class="list-group-item"><i class="fas fa-times text-danger fa-lg"></i></li>
                                        <li class="list-group-item"><i class="fas fa-times text-danger fa-lg"></i></li>
                                        <li class="list-group-item"><i class="fas fa-times text-danger fa-lg"></i></li>
                                        <li class="list-group-item">
                                            <a href="create-account?p=planBasicYearly" class="elementor-button-link elementor-button elementor-size-sm" role="button">
                                                <span class="elementor-button-content-wrapper">
                                                    <span class="elementor-button-text">Sign up</span>
                                                </span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="plan popular">
                                <div class="plan-header gold">
                                    <h3 class="panel-heading">
                                        <span class="label">Standard</span>
                                        <div class="figure">
                                            <span class="amount">199</span>
                                        </div>
                                    </h3>
                                </div>
                                <div class="plan-info">
                                    <ul class="list-group">
                                        <li class="list-group-item">6000 minutes</li>
                                        <li class="list-group-item"><i class="fas fa-check text-success fa-lg"></i></li>

                                        <li class="list-group-item"><i class="fas fa-check text-success fa-lg"></i></li>
                                        <li class="list-group-item"><i class="fas fa-check text-success fa-lg"></i></li>
                                        <li class="list-group-item"><i class="fas fa-check text-success fa-lg"></i></li>
                                        <li class="list-group-item"><i class="fas fa-times text-danger fa-lg"></i></li>
                                        <li class="list-group-item"><i class="fas fa-times text-danger fa-lg"></i></li>
                                        <li class="list-group-item"><i class="fas fa-times text-danger fa-lg"></i></li>
                                        <li class="list-group-item">
                                            <a href="create-account?p=planStandardYearly" class="elementor-button-link elementor-button elementor-size-sm" role="button">
                                                <span class="elementor-button-content-wrapper">
                                                    <span class="elementor-button-text">Sign up</span>
                                                </span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="plan">
                                <div class="plan-header platinum">
                                    <h3 class="panel-heading">
                                        <span class="label">Premium</span>
                                        <div class="figure">
                                            <span class="amount">399</span>
                                        </div>
                                    </h3>
                                </div>
                                <div class="plan-info">
                                    <ul class="list-group">
                                        <li class="list-group-item">12000 minutes</li>
                                        <li class="list-group-item">  <i class="fas fa-check text-success fa-lg"></i> </li>
                                        <li class="list-group-item"><i class="fas fa-check text-success fa-lg"></i></li>
                                        <li class="list-group-item"><i class="fas fa-check text-success fa-lg"></i></li>
                                        <li class="list-group-item"><i class="fas fa-check text-success fa-lg"></i></li>
                                        <li class="list-group-item"><i class="fas fa-check text-success fa-lg"></i></li>
                                        <li class="list-group-item"><i class="fas fa-check text-success fa-lg"></i></li>
                                        <li class="list-group-item"><i class="fas fa-check text-success fa-lg"></i></li>
                                        <li class="list-group-item">
                                            <a href="create-account?p=planPremiumYearly" class="elementor-button-link elementor-button elementor-size-sm" role="button">
                                                <span class="elementor-button-content-wrapper">
                                                    <span class="elementor-button-text">Sign up</span>
                                                </span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="col-sm-12 Mobiledivvisiable">
                        <div class="pricing-plans d-flex flex-column flex-lg-row my-auto">
                        

                            <div class="plan">
                                <div class="plan-header silver">
                                    <h3 class="panel-heading">
                                        <span class="label">Basic</span>
                                        <div class="figure">
                                            <span class="amount">99</span>
                                        </div>
                                    </h3>
                                </div>
                                <div class="plan-info">
                                    <ul class="list-group">
                                        <li class="list-group-item">2400 Recording minutes</li>
                                        <li class="list-group-item"><i class="fas fa-check text-success fa-lg"></i> Unlimited Jobs</li>

                                        <li class="list-group-item"><i class="fas fa-check text-success fa-lg"></i> Multiple Admins</li>
                                        <li class="list-group-item"><i class="fas fa-times text-danger fa-lg"></i> Unlimited Users</li>
                                        <li class="list-group-item"><i class="fas fa-times text-danger fa-lg"></i> Customised Email Template</li>
                                        <li class="list-group-item"><i class="fas fa-times text-danger fa-lg"></i> Branding</li>
                                        <li class="list-group-item"><i class="fas fa-times text-danger fa-lg"></i> AI Based Assesments</li>
                                        <li class="list-group-item"><i class="fas fa-times text-danger fa-lg"></i> 24/7 Suppport</li>
                                        <li class="list-group-item">
                                            <a href="create-account?p=planBasicYearly" class="elementor-button-link elementor-button elementor-size-sm" role="button">
                                                <span class="elementor-button-content-wrapper">
                                                    <span class="elementor-button-text">Sign up</span>
                                                </span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="plan popular">
                                <div class="plan-header gold">
                                    <h3 class="panel-heading">
                                        <span class="label">Standard</span>
                                        <div class="figure">
                                            <span class="amount">199</span>
                                        </div>
                                    </h3>
                                </div>
                                <div class="plan-info">
                                    <ul class="list-group">
                                        <li class="list-group-item">6000 Recording minutes</li>
                                        <li class="list-group-item"><i class="fas fa-check text-success fa-lg"></i>Unlimited Jobs</li>

                                        <li class="list-group-item"><i class="fas fa-check text-success fa-lg"> </i>Multiple Admins</li>
                                        <li class="list-group-item"><i class="fas fa-check text-success fa-lg"></i> Unlimited Users</li>
                                        <li class="list-group-item"><i class="fas fa-check text-success fa-lg"></i> Customised Email Template</li>
                                        <li class="list-group-item"><i class="fas fa-times text-danger fa-lg"></i> Branding</li>
                                        <li class="list-group-item"><i class="fas fa-times text-danger fa-lg"></i> AI Based Assesments</li>
                                        <li class="list-group-item"><i class="fas fa-times text-danger fa-lg"></i>24/7 Suppport</li> 
                                        <li class="list-group-item">
                                            <a href="create-account?p=planStandardYearly" class="elementor-button-link elementor-button elementor-size-sm" role="button">
                                                <span class="elementor-button-content-wrapper">
                                                    <span class="elementor-button-text">Sign up</span>
                                                </span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="plan">
                                <div class="plan-header platinum">
                                    <h3 class="panel-heading">
                                        <span class="label">Premium</span>
                                        <div class="figure">
                                            <span class="amount">399</span>
                                        </div>
                                    </h3>
                                </div>
                                <div class="plan-info">
                                    <ul class="list-group">
                                        <li class="list-group-item">12000 Recording minutes</li>
                                        <li class="list-group-item">  <i class="fas fa-check text-success fa-lg"></i> Unlimited Jobs </li>
                                        <li class="list-group-item"><i class="fas fa-check text-success fa-lg"></i> Multiple Admins</li>
                                        <li class="list-group-item"><i class="fas fa-check text-success fa-lg"></i> Unlimited Users</li>
                                        <li class="list-group-item"><i class="fas fa-check text-success fa-lg"></i> Customised Email Template</li>
                                        <li class="list-group-item"><i class="fas fa-check text-success fa-lg"></i> Branding</li>
                                        <li class="list-group-item"><i class="fas fa-check text-success fa-lg"></i> AI Based Assesments</li>
                                        <li class="list-group-item"><i class="fas fa-check text-success fa-lg"></i> 24/7 Suppport</li>
                                        <li class="list-group-item">
                                            <a href="create-account?p=planPremiumYearly" class="elementor-button-link elementor-button elementor-size-sm" role="button">
                                                <span class="elementor-button-content-wrapper">
                                                    <span class="elementor-button-text">Sign up</span>
                                                </span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                </section>
            </div>


    <uc1:footer_inner runat="server" ID="footer_inner" />
    </form>
    <uc1:footweb runat="server" ID="footweb" />
</body>
</html>
