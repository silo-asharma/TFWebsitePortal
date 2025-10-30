<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Extuent.index" %>

<%@ Register Src="~/UCWebsite/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/UCWebsite/footer_inner.ascx" TagPrefix="uc1" TagName="footer_inner" %>
<%@ Register Src="~/UCWebsite/footweb.ascx" TagPrefix="uc1" TagName="footweb" %>
<%@ Register Src="~/UCWebsite/headrerweb.ascx" TagPrefix="uc1" TagName="headrerweb" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <uc1:head runat="server" id="head" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        .margclass {
                    
                    margin-top:-25px!important;

            }
           .imgdis1 {
                    display:block;
                }
               
            
              @media (max-width: 767.98px) {

            .slider,
            .slide {
                height: 60vh;
            }
            .slide .slide__img {
                width: 100%;
                height: auto;
                overflow: hidden;
            }
              .slide .slide__content--headings {
            text-align: left;
            color: #FFF;
            font-size: 1.3rem;
        }
              .slide .slide__content--headings h2 {
                font-size: 2rem;
                margin: 15px 0;
                font-weight: 700;
            }

        .slide__content--headings p {
            font-weight: 700;
            font-size: 22px;
        }

         .slide .slide__content {
            position: absolute;
            top: 50%;
            left: 20%;
            transform: translate(-20%, -50%);
        }
         .margclass {
                    
                    margin-top:-14px!important;
            }
         .fontsi1{
                    font-size:25px;
                }

            .imgdis1 {
                    display:none !important;
                }
               
        }
             @media (max-width: 450px) {

            .slider,
            .slide {
                height: 40vh;
            }
            .slide .slide__img {
                width: 100%;
                height: auto;
                overflow: hidden;
            }
              .slide .slide__content--headings {
            text-align: left;
            color: #FFF;
            font-size: 1.3rem;
        }
              .slide .slide__content--headings h2 {
                font-size: 2rem;
                margin: 15px 0;
                font-weight: 700;
            }

        .slide__content--headings p {
            font-weight: 700;
            font-size: 22px;
        }

         .slide .slide__content {
            position: absolute;
            top: 40%;
            left: 20%;
            transform: translate(-20%, -50%);
        }
         .margclass {
                    
                    margin-top:-14px!important;
            }

                .fontsi1 {
                    font-size:25px;
                }
                .imgdis1 {
                    display:none !important;
                }
               
        }
    </style>

</head>
<body class="page-template page-template-elementor_header_footer page page-id-2020 jkit-color-scheme elementor-default elementor-template-full-width elementor-kit-7 elementor-page elementor-page-2020">
    <form id="form1" runat="server">
    <div>
        <uc1:headrerweb runat="server" id="headrerweb" />




        <div class="slider stick-dots position-relative">

            <div class="slide" style="border-radius: 100px">
                <div class="slide__img">
                    <img src="" alt="" data-lazy="images/slide3a.jpg" class="full-image animated"
                        data-animation-in="zoomInImage" />
                </div>
                <div class="slide__content">
                    <div class="slide__content--headings">
                        <h2 class="animated" data-animation-in="fadeInLeft" style="color: #fff">Extuent AI</h2>
                        <p class="animated mb-0" data-animation-in="fadeInLeft" data-delay-in="0.3">
                            Hiring Simplified
                        </p>
                        <p  class="animated mb-0 margclass" data-animation-in="fadeInLeft"
                            data-delay-in="0.3">
                            Interview Streamlined

                        </p>
                        <p  class="animated margclass" data-animation-in="fadeInLeft" data-delay-in="0.3">
                            Candidate Experience Transformed
                        </p>
                    </div>

                    <a class="popup-youtube"
                        href="https://extuent.ai/bg/extuent_ai_intro.mp4">
                        <div class="play-button d-flex align-items-center">
                            <div class=" play position-relative">
                                <i class="jki jki-play" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);"></i>
                            </div>
                            <div class="ml-2 watch">Watch Now</div>

                        </div>
                    </a>
                </div>


            </div>
            <div class="slide" style="border-radius: 100px">
                <div class="slide__img">
                    <img src="" alt="" data-lazy="images/slide-1.jpg" class="full-image animated"
                        data-animation-in="zoomInImage" />
                </div>
                <div class="slide__content">
                    <div class="slide__content--headings">
                        <h2 class="animated" data-animation-in="fadeInLeft" style="color: #fff">Extuent AI</h2>
                        <p class="animated mb-0" data-animation-in="fadeInLeft" data-delay-in="0.3">
                            Hiring Simplified
                        </p>
                        <p  class="animated mb-0 margclass" data-animation-in="fadeInLeft"
                            data-delay-in="0.3">
                            Interview Streamlined

                        </p>
                        <p  class="animated margclass" data-animation-in="fadeInLeft" data-delay-in="0.3">
                            Candidate Experience Transformed
                        </p>
                    </div>
                    <a class="popup-youtube"
                        href="https://extuent.ai/bg/extuent_ai_intro.mp4">
                        <div class="play-button d-flex align-items-center">
                            <div class=" play position-relative">
                                <i class="jki jki-play" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);"></i>
                            </div>
                            <div class="ml-2 watch">Watch Now</div>

                        </div>
                    </a>
                </div>
            </div>
        </div>

        <section class="elementor-section elementor-top-section elementor-element elementor-element-c9d2f58 elementor-section-boxed elementor-section-height-default elementor-section-height-default mheight" data-id="c9d2f58" data-element_type="section" data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
            <div class="elementor-container elementor-column-gap-default">
                <div class="elementor-column elementor-col-100 elementor-top-column elementor-element elementor-element-1a0f9d4" data-id="1a0f9d4" data-element_type="column">
                    <div class="elementor-widget-wrap elementor-element-populated">
                        <div class="elementor-element elementor-element-420ead2 elementor-widget__width-auto animated-slow elementor-invisible elementor-widget elementor-widget-jkit_heading" data-id="420ead2" data-element_type="widget" data-settings="{&quot;_animation&quot;:&quot;fadeInUp&quot;}" data-widget_type="jkit_heading.default">
                            <div class="elementor-widget-container">
                                <div class="jeg-elementor-kit jkit-heading  align-left align-tablet- align-mobile- jeg_module_2020_3_648762fd0c3e1">
                                    <div class="heading-section-separator">
                                        <div class="separator-wrapper style-solid"></div>
                                    </div>
                                    <div class="heading-section-title  display-inline-block">
                                        <h5 class="heading-title fontsi1">Key Features</h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <section class="elementor-section elementor-inner-section elementor-element elementor-element-6ac9520 elementor-section-boxed elementor-section-height-default elementor-section-height-default" data-id="6ac9520" data-element_type="section">
                            <div class="elementor-container elementor-column-gap-no">
                                <div class="elementor-column elementor-col-20 elementor-inner-column elementor-element elementor-element-0bc3604 animated-slow elementor-invisible" data-id="0bc3604" data-element_type="column" data-settings="{&quot;animation&quot;:&quot;fadeInLeft&quot;}">
                                    <div class="elementor-widget-wrap elementor-element-populated">
                                        <div class="elementor-element elementor-element-e225323 elementor-position-left elementor-vertical-align-top elementor-widget elementor-widget-image-box" data-id="e225323" data-element_type="widget" data-widget_type="image-box.default">
                                            <div class="elementor-widget-container">
                                                <style>
                                                    /*! elementor - v3.12.1 - 02-04-2023 */
                                                    .elementor-widget-image-box .elementor-image-box-content {
                                                        width: 100%;
                                                    }

                                                    @media (min-width:768px) {
                                                        .elementor-widget-image-box.elementor-position-left .elementor-image-box-wrapper, .elementor-widget-image-box.elementor-position-right .elementor-image-box-wrapper {
                                                            display: flex;
                                                        }

                                                        .elementor-widget-image-box.elementor-position-right .elementor-image-box-wrapper {
                                                            text-align: right;
                                                            flex-direction: row-reverse;
                                                        }

                                                        .elementor-widget-image-box.elementor-position-left .elementor-image-box-wrapper {
                                                            text-align: left;
                                                            flex-direction: row;
                                                        }

                                                        .elementor-widget-image-box.elementor-position-top .elementor-image-box-img {
                                                            margin: auto;
                                                        }

                                                        .elementor-widget-image-box.elementor-vertical-align-top .elementor-image-box-wrapper {
                                                            align-items: flex-start;
                                                        }

                                                        .elementor-widget-image-box.elementor-vertical-align-middle .elementor-image-box-wrapper {
                                                            align-items: center;
                                                        }

                                                        .elementor-widget-image-box.elementor-vertical-align-bottom .elementor-image-box-wrapper {
                                                            align-items: flex-end;
                                                        }
                                                    }

                                                    @media (max-width:767px) {
                                                        .elementor-widget-image-box .elementor-image-box-img {
                                                            margin-left: auto !important;
                                                            margin-right: auto !important;
                                                            margin-bottom: 15px;
                                                        }
                                                    }

                                                    .elementor-widget-image-box .elementor-image-box-img {
                                                        display: inline-block;
                                                    }

                                                    .elementor-widget-image-box .elementor-image-box-title a {
                                                        color: inherit;
                                                    }

                                                    .elementor-widget-image-box .elementor-image-box-wrapper {
                                                        text-align: center;
                                                    }

                                                    .elementor-widget-image-box .elementor-image-box-description {
                                                        margin: 0;
                                                    }
                                                </style>
                                                <div class="elementor-image-box-wrapper">
                                                    <figure class="elementor-image-box-img">
                                                        <img width="125" height="83" src="wp-content//uploads/2023/04/icon-int-builder.png" class="attachment-full size-full wp-image-2071" alt="" decoding="async" loading="lazy" /></figure>
                                                    <div class="elementor-image-box-content">
                                                        <h3 class="elementor-image-box-title">Custom </h3>
                                                        <p class="elementor-image-box-description">library</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="elementor-element elementor-element-c9a35de jkit-equal-height-disable elementor-widget elementor-widget-jkit_icon_box" data-id="c9a35de" data-element_type="widget" data-widget_type="jkit_icon_box.default">
                                            <div class="elementor-widget-container">
                                                <div class="jeg-elementor-kit jkit-icon-box icon-position- elementor-animation- jeg_module_2020_4_648762fd2ff28">
                                                    <div class="jkit-icon-box-wrapper hover-from-left">
                                                        <div class="icon-box icon-box-body">
                                                            <p class="icon-box-description">You can create your own library of questions you wish your applicants to answer and also define the evaluation criteria for the reviewers as well.</p>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="elementor-column elementor-col-20 elementor-inner-column elementor-element elementor-element-1727441 animated-slow elementor-invisible" data-id="1727441" data-element_type="column" data-settings="{&quot;animation&quot;:&quot;fadeInLeft&quot;,&quot;animation_delay&quot;:20}">
                                    <div class="elementor-widget-wrap elementor-element-populated">
                                        <div class="elementor-element elementor-element-548d3f6 elementor-position-left elementor-vertical-align-top elementor-widget elementor-widget-image-box" data-id="548d3f6" data-element_type="widget" data-widget_type="image-box.default">
                                            <div class="elementor-widget-container">
                                                <div class="elementor-image-box-wrapper">
                                                    <figure class="elementor-image-box-img">
                                                        <img width="125" height="83" src="wp-content//uploads/2023/04/icon-int-builder.png" class="attachment-full size-full wp-image-2071" alt="" decoding="async" loading="lazy" /></figure>
                                                    <div class="elementor-image-box-content">
                                                        <h3 class="elementor-image-box-title">Share</h3>
                                                        <p class="elementor-image-box-description">Profiles</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="elementor-element elementor-element-8755a51 jkit-equal-height-disable elementor-widget elementor-widget-jkit_icon_box" data-id="8755a51" data-element_type="widget" data-widget_type="jkit_icon_box.default">
                                            <div class="elementor-widget-container">
                                                <div class="jeg-elementor-kit jkit-icon-box icon-position- elementor-animation- jeg_module_2020_5_648762fd4417a">
                                                    <div class="jkit-icon-box-wrapper hover-from-left">
                                                        <div class="icon-box icon-box-body">
                                                            <p class="icon-box-description">No hassle of downloading recordings or sharing cover letters or resumes separately on emails, share candidate profiles including cover letter or resume and recording.</p>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="elementor-column elementor-col-20 elementor-inner-column elementor-element elementor-element-f6f3bae animated-slow elementor-invisible" data-id="f6f3bae" data-element_type="column" data-settings="{&quot;animation&quot;:&quot;fadeInLeft&quot;,&quot;animation_delay&quot;:40}">
                                    <div class="elementor-widget-wrap elementor-element-populated">
                                        <div class="elementor-element elementor-element-8e3aa04 elementor-position-left elementor-vertical-align-top elementor-widget elementor-widget-image-box" data-id="8e3aa04" data-element_type="widget" data-widget_type="image-box.default">
                                            <div class="elementor-widget-container">
                                                <div class="elementor-image-box-wrapper">
                                                    <figure class="elementor-image-box-img">
                                                        <img width="125" height="83" src="wp-content//uploads/2023/04/icon-int-builder.png" class="attachment-full size-full wp-image-2071" alt="" decoding="async" loading="lazy" /></figure>
                                                    <div class="elementor-image-box-content">
                                                        <h3 class="elementor-image-box-title">Job</h3>
                                                        <p class="elementor-image-box-description">Links</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="elementor-element elementor-element-4e53c18 jkit-equal-height-disable elementor-widget elementor-widget-jkit_icon_box" data-id="4e53c18" data-element_type="widget" data-widget_type="jkit_icon_box.default">
                                            <div class="elementor-widget-container">
                                                <div class="jeg-elementor-kit jkit-icon-box icon-position- elementor-animation- jeg_module_2020_6_648762fd67a15">
                                                    <div class="jkit-icon-box-wrapper hover-from-left">
                                                        <div class="icon-box icon-box-body">
                                                            <p class="icon-box-description">Create a unique link and directly share with applicants or candidates or post on your website or third-party sites.</p>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="elementor-column elementor-col-20 elementor-inner-column elementor-element elementor-element-9599614 animated-slow elementor-invisible" data-id="9599614" data-element_type="column" data-settings="{&quot;animation&quot;:&quot;fadeInLeft&quot;,&quot;animation_delay&quot;:40}">
                                    <div class="elementor-widget-wrap elementor-element-populated">
                                        <div class="elementor-element elementor-element-ab3d7ea elementor-position-left elementor-vertical-align-top elementor-widget elementor-widget-image-box" data-id="ab3d7ea" data-element_type="widget" data-widget_type="image-box.default">
                                            <div class="elementor-widget-container">
                                                <div class="elementor-image-box-wrapper">
                                                    <figure class="elementor-image-box-img">
                                                        <img width="125" height="83" src="wp-content//uploads/2023/04/icon-int-builder.png" class="attachment-full size-full wp-image-2071" alt="" decoding="async" loading="lazy" /></figure>
                                                    <div class="elementor-image-box-content">
                                                        <h3 class="elementor-image-box-title">Review </h3>
                                                        <p class="elementor-image-box-description">Retake</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="elementor-element elementor-element-7b84490 jkit-equal-height-disable elementor-widget elementor-widget-jkit_icon_box" data-id="7b84490" data-element_type="widget" data-widget_type="jkit_icon_box.default">
                                            <div class="elementor-widget-container">
                                                <div class="jeg-elementor-kit jkit-icon-box icon-position- elementor-animation- jeg_module_2020_7_648762fd87724">
                                                    <div class="jkit-icon-box-wrapper hover-from-left">
                                                        <div class="icon-box icon-box-body">
                                                            <p class="icon-box-description">Applicants can use the Review and Retake feature to assess their answers and retake if they are not satisfied with the answer.</p>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="elementor-column elementor-col-20 elementor-inner-column elementor-element elementor-element-d67b551 animated-slow elementor-invisible" data-id="d67b551" data-element_type="column" data-settings="{&quot;animation&quot;:&quot;fadeInLeft&quot;,&quot;animation_delay&quot;:40}">
                                    <div class="elementor-widget-wrap elementor-element-populated">
                                        <div class="elementor-element elementor-element-9f21e10 elementor-position-left elementor-vertical-align-top elementor-widget elementor-widget-image-box" data-id="9f21e10" data-element_type="widget" data-widget_type="image-box.default">
                                            <div class="elementor-widget-container">
                                                <div class="elementor-image-box-wrapper">
                                                    <figure class="elementor-image-box-img">
                                                        <img width="125" height="83" src="wp-content//uploads/2023/04/icon-int-builder.png" class="attachment-full size-full wp-image-2071" alt="" decoding="async" loading="lazy" /></figure>
                                                    <div class="elementor-image-box-content">
                                                        <h3 class="elementor-image-box-title">One Page</h3>
                                                        <p class="elementor-image-box-description">Review</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="elementor-element elementor-element-a9c93bc jkit-equal-height-disable elementor-widget elementor-widget-jkit_icon_box" data-id="a9c93bc" data-element_type="widget" data-widget_type="jkit_icon_box.default">
                                            <div class="elementor-widget-container">
                                                <div class="jeg-elementor-kit jkit-icon-box icon-position- elementor-animation- jeg_module_2020_8_648762fdae27c">
                                                    <div class="jkit-icon-box-wrapper hover-from-left">
                                                        <div class="icon-box icon-box-body">
                                                            <p class="icon-box-description">With Extuent AI there is no need to toggle between screens ! All candidate information,  evaluation criteria and AI based ratings are all on a single page view.</p>
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
                </div>
            </div>
        </section>
        <section class="elementor-section elementor-inner-section elementor-element elementor-element-313861cc elementor-section-boxed elementor-section-height-default elementor-section-height-default" data-id="313861cc" data-element_type="section">
            <div class="elementor-container elementor-column-gap-no">
                <div class="elementor-column elementor-col-33 elementor-inner-column elementor-element elementor-element-7737c0c4" data-id="7737c0c4" data-element_type="column">
                    <div class="elementor-widget-wrap elementor-element-populated">
                        <div class="elementor-element elementor-element-28d08654 elementor-widget elementor-widget-jkit_fun_fact" data-id="28d08654" data-element_type="widget" data-widget_type="jkit_fun_fact.default">
                            <div class="elementor-widget-container">
                                <div class="jeg-elementor-kit jkit-fun-fact align-center hover-from-left elementor-animation- jeg_module_2020_9_648762fdde6be">
                                    <div class="fun-fact-inner">
                                        <div class="icon elementor-animation-"><i aria-hidden="true" class="jki jki-user-cog-solid"></i></div>
                                        <div class="content">
                                            <div class="number-wrapper">
                                                <span class="prefix"></span>
                                                <span class="number" data-value="45" data-animation-duration="3500">0</span>
                                                <span class="suffix"></span>
                                            </div>
                                            <span class="title">Hiring Managers</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="elementor-column elementor-col-33 elementor-inner-column elementor-element elementor-element-ba88d0d" data-id="ba88d0d" data-element_type="column">
                    <div class="elementor-widget-wrap elementor-element-populated">
                        <div class="elementor-element elementor-element-44f7954a elementor-widget elementor-widget-jkit_fun_fact" data-id="44f7954a" data-element_type="widget" data-widget_type="jkit_fun_fact.default">
                            <div class="elementor-widget-container">
                                <div class="jeg-elementor-kit jkit-fun-fact align-center hover-from-left elementor-animation- jeg_module_2020_10_648762fdf1e48">
                                    <div class="fun-fact-inner">
                                        <div class="icon elementor-animation-"><i aria-hidden="true" class="jki jki-Profile-light"></i></div>
                                        <div class="content">
                                            <div class="number-wrapper">
                                                <span class="prefix"></span>
                                                <span class="number" data-value="17865" data-animation-duration="3500">0</span>
                                                <span class="suffix"></span>
                                            </div>
                                            <h5 class="title">Interviews Processed</h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="elementor-column elementor-col-33 elementor-inner-column elementor-element elementor-element-783fb9f2" data-id="783fb9f2" data-element_type="column">
                    <div class="elementor-widget-wrap elementor-element-populated">
                        <div class="elementor-element elementor-element-3adae859 elementor-widget elementor-widget-jkit_fun_fact" data-id="3adae859" data-element_type="widget" data-widget_type="jkit_fun_fact.default">
                            <div class="elementor-widget-container">
                                <div class="jeg-elementor-kit jkit-fun-fact align-center hover-from-left elementor-animation- jeg_module_2020_11_648762fe0b985">
                                    <div class="fun-fact-inner">
                                        <div class="icon elementor-animation-"><i aria-hidden="true" class="jki jki-badge"></i></div>
                                        <div class="content">
                                            <div class="number-wrapper">
                                                <span class="prefix"></span>
                                                <span class="number" data-value="150" data-animation-duration="3500">0</span>
                                                <span class="suffix"></span>
                                            </div>
                                            <h5 class="title">Positions Fulfilled</h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="elementor-section elementor-top-section elementor-element elementor-element-d346f74 elementor-section-boxed elementor-section-height-default elementor-section-height-default" data-id="d346f74" data-element_type="section">
            <div class="elementor-container elementor-column-gap-default">
                <div class="elementor-column elementor-col-50 elementor-top-column elementor-element elementor-element-334344c" data-id="334344c" data-element_type="column">
                    <div class="elementor-widget-wrap elementor-element-populated">
                        <div class="elementor-element elementor-element-7624d1e elementor-widget__width-initial elementor-widget elementor-widget-image" data-id="7624d1e" data-element_type="widget" data-widget_type="image.default">
                            <div class="elementor-widget-container">
                                <img width="1920" height="1197" src="wp-content//uploads/2023/05/ai1-1.jpg" class="attachment-full size-full wp-image-2548" alt="" decoding="async" loading="lazy" srcset="wp-content//uploads/2023/05/ai1-1.jpg 1920w, ../.wp-content/uploads/2023/05/ai1-1-300x187.jpg 300w, wp-content//uploads/2023/05/ai1-1-1024x638.jpg 1024w, wp-content//uploads/2023/05/ai1-1-768x479.jpg 768w, wp-content//uploads/2023/05/ai1-1-1536x958.jpg 1536w" sizes="(max-width: 1920px) 100vw, 1920px" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="elementor-column elementor-col-50 elementor-top-column elementor-element elementor-element-42b1829" data-id="42b1829" data-element_type="column">
                    <div class="elementor-widget-wrap elementor-element-populated">
                        <div class="elementor-element elementor-element-08d7e27 elementor-widget elementor-widget-image" data-id="08d7e27" data-element_type="widget" data-widget_type="image.default">
                            <div class="elementor-widget-container imgdis1">
                                <img width="408" height="600" src="wp-content//uploads/2023/05/new3.jpg" class="attachment-large size-large wp-image-2478" alt="" decoding="async" loading="lazy" srcset="wp-content//uploads/2023/05/new3.jpg 408w, wp-content//uploads/2023/05/new3-204x300.jpg 204w" sizes="(max-width: 408px) 100vw, 408px" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="elementor-section elementor-top-section elementor-element elementor-element-2e128dd elementor-section-boxed elementor-section-height-default elementor-section-height-default" data-id="2e128dd" data-element_type="section">
            <div class="elementor-container elementor-column-gap-default">
                <div class="elementor-column elementor-col-50 elementor-top-column elementor-element elementor-element-ee4e18a" data-id="ee4e18a" data-element_type="column">
                    <div class="elementor-widget-wrap elementor-element-populated">
                        <div class="elementor-element elementor-element-b70d092 elementor-widget elementor-widget-image" data-id="b70d092" data-element_type="widget" data-widget_type="image.default">
                            <div class="elementor-widget-container imgdis1">
                                <img width="408" height="600" src="wp-content//uploads/2023/05/img4-1.jpg" class="attachment-large size-large wp-image-2486" alt="" decoding="async" loading="lazy" srcset="wp-content//uploads/2023/05/img4-1.jpg 408w, wp-content//uploads/2023/05/img4-1-204x300.jpg 204w" sizes="(max-width: 408px) 100vw, 408px" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="elementor-column elementor-col-50 elementor-top-column elementor-element elementor-element-f46c69c" data-id="f46c69c" data-element_type="column">
                    <div class="elementor-widget-wrap elementor-element-populated">
                        <div class="elementor-element elementor-element-aaeda14 elementor-widget__width-initial elementor-widget elementor-widget-image" data-id="aaeda14" data-element_type="widget" data-widget_type="image.default">
                            <div class="elementor-widget-container">
                                <img width="1920" height="1197" src="wp-content//uploads/2023/05/ai2.jpg" class="attachment-full size-full wp-image-2552" alt="" decoding="async" loading="lazy" srcset="wp-content//uploads/2023/05/ai2.jpg 1920w, wp-content//uploads/2023/05/ai2-300x187.jpg 300w, wp-content//uploads/2023/05/ai2-1024x638.jpg 1024w, wp-content//uploads/2023/05/ai2-768x479.jpg 768w, wp-content//uploads/2023/05/ai2-1536x958.jpg 1536w" sizes="(max-width: 1920px) 100vw, 1920px" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="elementor-section elementor-top-section elementor-element elementor-element-33b7f13e elementor-section-content-middle elementor-section-boxed elementor-section-height-default elementor-section-height-default" data-id="33b7f13e" data-element_type="section" data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
            <div class="elementor-background-overlay"></div>
            <div class="elementor-container elementor-column-gap-default">
                <div class="elementor-column elementor-col-100 elementor-top-column elementor-element elementor-element-a07d437" data-id="a07d437" data-element_type="column">
                    <div class="elementor-widget-wrap elementor-element-populated">
                        <section class="elementor-section elementor-inner-section elementor-element elementor-element-79367938 elementor-section-content-middle elementor-section-boxed elementor-section-height-default elementor-section-height-default" data-id="79367938" data-element_type="section">
                            <div class="elementor-container elementor-column-gap-no">
                                <div class="elementor-column elementor-col-33 elementor-inner-column elementor-element elementor-element-29178217" data-id="29178217" data-element_type="column">
                                    <div class="elementor-widget-wrap elementor-element-populated">
                                        <div class="elementor-element elementor-element-d87f4da jkit-equal-height-disable elementor-widget elementor-widget-jkit_icon_box" data-id="d87f4da" data-element_type="widget" data-widget_type="jkit_icon_box.default">
                                            <div class="elementor-widget-container">
                                                <div class="jeg-elementor-kit jkit-icon-box icon-position- elementor-animation- jeg_module_2020_12_648762fe44e7d">
                                                    <div class="jkit-icon-box-wrapper hover-from-left">
                                                        <div class="icon-box icon-box-header elementor-animation-">
                                                            <div class="icon style-color"></div>
                                                        </div>
                                                        <div class="icon-box icon-box-body">
                                                            <h2 class="title">AI Background</h2>
                                                            <p class="icon-box-description">Candidates don’t need to clean up or find the best spot anymore and your clients or hiring managers don’t need to get distracted by the backgrounds either. Our Smart Background feature automatically changes the interviewers’ backdrop with a tasteful background with your company logo. </p>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="elementor-column elementor-col-33 elementor-inner-column elementor-element elementor-element-6e685eb1" data-id="6e685eb1" data-element_type="column">
                                    <div class="elementor-widget-wrap elementor-element-populated">
                                        <div class="elementor-element elementor-element-72f84a6e elementor-widget elementor-widget-spacer" data-id="72f84a6e" data-element_type="widget" data-widget_type="spacer.default">
                                            <div class="elementor-widget-container">
                                                <style>
                                                    /*! elementor - v3.12.1 - 02-04-2023 */
                                                    .elementor-column .elementor-spacer-inner {
                                                        height: var(--spacer-size);
                                                    }

                                                    .e-con {
                                                        --container-widget-width:100%;
                                                    }

                                                        .e-con-inner > .elementor-widget-spacer, .e-con > .elementor-widget-spacer {
                                                            width: var(--container-widget-width,var(--spacer-size));
                                                            --align-self:var(--container-widget-align-self,initial);
                                                            --flex-shrink:0;
                                                        }.e-con-inner>.elementor-widget-spacer>.elementor-widget-container,.e-con-inner>.elementor-widget-spacer>.elementor-widget-container>.elementor-spacer,.e-con>.elementor-widget-spacer>.elementor-widget-container,.e-con>.elementor-widget-spacer>.elementor-widget-container>.elementor-spacer{height:100%}.e-con-inner>.elementor-widget-spacer>.elementor-widget-container>.elementor-spacer>.elementor-spacer-inner,.e-con>.elementor-widget-spacer>.elementor-widget-container>.elementor-spacer>.elementor-spacer-inner{height:var(--container-widget-height,var(--spacer-size))}</style>
                                                <div class="elementor-spacer">
                                                    <div class="elementor-spacer-inner"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="elementor-element elementor-element-46ba19d8 jkit-equal-height-disable elementor-widget elementor-widget-jkit_icon_box" data-id="46ba19d8" data-element_type="widget" data-widget_type="jkit_icon_box.default">
                                            <div class="elementor-widget-container">
                                                <div class="jeg-elementor-kit jkit-icon-box icon-position- elementor-animation- jeg_module_2020_13_648762fe5e554">
                                                    <div class="jkit-icon-box-wrapper hover-from-left">
                                                        <div class="icon-box icon-box-body">
                                                            <h2 class="title">AI Shortlist (Coming Soon)</h2>
                                                            <p class="icon-box-description">Use the Skill Match feature to automatically shortlist candidates based on the minimum skills and other parameters to speed up the screening process. Recruiters and Hiring Managers save time as this cuts the screening time by at least 50%.</p>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="elementor-column elementor-col-33 elementor-inner-column elementor-element elementor-element-4f95fa4b" data-id="4f95fa4b" data-element_type="column">
                                    <div class="elementor-widget-wrap elementor-element-populated">
                                        <div class="elementor-element elementor-element-537a7a01 jkit-equal-height-disable elementor-widget elementor-widget-jkit_icon_box" data-id="537a7a01" data-element_type="widget" data-widget_type="jkit_icon_box.default">
                                            <div class="elementor-widget-container">
                                                <div class="jeg-elementor-kit jkit-icon-box icon-position- elementor-animation- jeg_module_2020_14_648762fe72dfc">
                                                    <div class="jkit-icon-box-wrapper hover-from-left">
                                                        <div class="icon-box icon-box-header elementor-animation-">
                                                            <div class="icon style-color"><i aria-hidden="true" class="icon icon-open-book1"></i></div>
                                                        </div>
                                                        <div class="icon-box icon-box-body">
                                                            <h2 class="title">AI Guide (Coming Soon)</h2>
                                                            <p class="icon-box-description">Tiered of asking good potential hires to re-record interviews due to voice disturbance, poor video quality or lack of lighting and risk losing precious time or even the candidate!? You don’t need to worry about that anymore. Our Smart Guide feature alerts the candidates and guides them to record the most professional and clear video. </p>
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
                </div>
            </div>
        </section>
        <section class="elementor-section elementor-top-section elementor-element elementor-element-331540c0 elementor-section-boxed elementor-section-height-default elementor-section-height-default" data-id="331540c0" data-element_type="section" data-settings="{&quot;background_background&quot;:&quot;classic&quot;}">
            <div class="elementor-background-overlay"></div>
            <div class="elementor-container elementor-column-gap-default">
                <div class="elementor-column elementor-col-100 elementor-top-column elementor-element elementor-element-7292958a" data-id="7292958a" data-element_type="column">
                    <div class="elementor-widget-wrap elementor-element-populated">
                        <div class="elementor-element elementor-element-63390574 elementor-widget elementor-widget-heading" data-id="63390574" data-element_type="widget" data-widget_type="heading.default">
                            <div class="elementor-widget-container">
                                <h2 class="elementor-heading-title elementor-size-default">Contact Us</h2>
                            </div>
                        </div>
                        <div class="elementor-element elementor-element-7b20c60 elementor-widget elementor-widget-text-editor" data-id="7b20c60" data-element_type="widget" data-widget_type="text-editor.default">
                            <div class="elementor-widget-container">
                                <style>/*! elementor - v3.12.1 - 02-04-2023 */
.elementor-widget-text-editor.elementor-drop-cap-view-stacked .elementor-drop-cap{background-color:#69727d;color:#fff}.elementor-widget-text-editor.elementor-drop-cap-view-framed .elementor-drop-cap{color:#69727d;border:3px solid;background-color:transparent}.elementor-widget-text-editor:not(.elementor-drop-cap-view-default) .elementor-drop-cap{margin-top:8px}.elementor-widget-text-editor:not(.elementor-drop-cap-view-default) .elementor-drop-cap-letter{width:1em;height:1em}.elementor-widget-text-editor .elementor-drop-cap{float:left;text-align:center;line-height:1;font-size:50px}.elementor-widget-text-editor .elementor-drop-cap-letter{display:inline-block}</style>
                                <p>
                                    Get ready to simplify, streamline and transform your
recruitment process and candidate experience.
                                </p>
                            </div>
                        </div>
                        <section class="elementor-section elementor-inner-section elementor-element elementor-element-44f15a49 elementor-section-boxed elementor-section-height-default elementor-section-height-default" data-id="44f15a49" data-element_type="section">
                            <div class="elementor-container elementor-column-gap-no">
                                <div class="elementor-column elementor-col-50 elementor-inner-column elementor-element elementor-element-4589c2df" data-id="4589c2df" data-element_type="column">
                                    <div class="elementor-widget-wrap elementor-element-populated">
                                        <div class="elementor-element elementor-element-5897980c jkit-equal-height-disable elementor-widget elementor-widget-jkit_icon_box" data-id="5897980c" data-element_type="widget" data-widget_type="jkit_icon_box.default">
                                            <div class="elementor-widget-container">
                                                <div class="jeg-elementor-kit jkit-icon-box icon-position- elementor-animation- jeg_module_2020_15_648762fe97e1e">
                                                    <div class="jkit-icon-box-wrapper hover-from-left">
                                                        <div class="icon-box icon-box-header elementor-animation-">
                                                            <div class="icon style-color"><i aria-hidden="true" class="jki jki-map-marker1-light"></i></div>
                                                        </div>
                                                        <div class="icon-box icon-box-body">
                                                            <h3 class="title">Office Location</h3>
                                                            <p class="icon-box-description">
                                                                Wilmington, Delaware 19801<br />
                                                            </p>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="elementor-column elementor-col-50 elementor-inner-column elementor-element elementor-element-7c9549a3" data-id="7c9549a3" data-element_type="column">
                                    <div class="elementor-widget-wrap elementor-element-populated">
                                        <div class="elementor-element elementor-element-733ff91a jkit-equal-height-disable elementor-widget elementor-widget-jkit_icon_box" data-id="733ff91a" data-element_type="widget" data-widget_type="jkit_icon_box.default">
                                            <div class="elementor-widget-container">
                                                <div class="jeg-elementor-kit jkit-icon-box icon-position- elementor-animation- jeg_module_2020_16_648762fea8d4d">
                                                    <div class="jkit-icon-box-wrapper hover-from-left">
                                                        <div class="icon-box icon-box-header elementor-animation-">
                                                            <div class="icon style-color"><i aria-hidden="true" class="jki jki-envelope2-light"></i></div>
                                                        </div>
                                                        <div class="icon-box icon-box-body">
                                                            <h3 class="title">Email Address</h3>
                                                            <p class="icon-box-description">
                                                                sales@extuent.ai<br />
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
                </div>
            </div>
        </section>




     
        <uc1:footer_inner runat="server" id="footer_inner" />
    </div>
        
    </form>

    <uc1:footweb runat="server" id="footweb" />

</body>
</html>
