<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCPricing.ascx.cs" Inherits="Extuent.UCWebsite.UCPricing" %>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.2/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.2/css/bootstrap.min.css"></script> -->

    <style>
        @import url("https://fonts.googleapis.com/css?family=Roboto:400,400i,700");

        body {
            background-color: #fff;
            color: #3c464b;
        }

        .pricing-plans {
            font-family: "Roboto", sans-serif;
            position: relative;
            margin: 0 auto;
            max-width: 100%;
        }

            .pricing-plans .plan {
                width: 90%;
                margin: 0 auto;
                min-width: 0;
                -webkit-box-shadow: 0 3px 0px 0 rgba(0, 0, 0, 0.08);
                box-shadow: 0 3px 0px 0 rgba(0, 0, 0, 0.08);
                transition: all 0.3s ease-in-out;
                padding: 2.25rem 0;
                position: relative;
                will-change: transform;
                text-align: center;
            }

                .pricing-plans .plan:before {
                    position: relative;
                    content: "";
                    border: 1px solid transparent;
                    width: 100%;
                    display: block;
                    padding: 0.5rem;
                    height: 42px;
                }

        @media only screen and (min-width: 1200px) {
            .pricing-plans .plan {
                width: 25%;
            }
        }

        .pricing-plans .plan.options {
            font-size: 0.75rem;
        }

        .pricing-plans .plan.popular:before {
            background-color: #56bdb9;
            content: "MOST POPULAR";
            border-color: #56bdb9;
            color: #fff;
        }

        .pricing-plans .plan .plan-header {
            border: 1px solid #ddd;
            border-right-color: transparent;
            border-bottom-color: transparent;
            background-color: RGB(221, 221, 221, 0.2);
            display: flex;
            flex-direction: column;
            align-content: center;
            vertical-align: top;
            position: relative;
            min-height: 185px;
            padding: 1.5rem;
        }

            .pricing-plans .plan .plan-header.first {
                border-color: transparent;
                background-color: transparent;
            }

            .pricing-plans .plan .plan-header.last {
                border-right: 1px solid #ddd;
            }

            .pricing-plans .plan .plan-header h3 {
                font-size: 2rem;
                margin: 0;
                text-align: center;
            }

                .pricing-plans .plan .plan-header h3 .label {
                    display: block;
                    font-size: 1rem;
                    letter-spacing: 1px;
                    margin: 0 auto 0px;
                    text-transform: uppercase;
                    font-weight: 700;
                }

                .pricing-plans .plan .plan-header h3 .figure {
                    padding: 5px 0 5px;
                    position: relative;
                }

                    .pricing-plans .plan .plan-header h3 .figure span {
                        display: inline-block;
                    }

                    .pricing-plans .plan .plan-header h3 .figure .amount {
                        font-size: 4rem;
                        font-weight: 700;
                        letter-spacing: -3px;
                        line-height: 1;
                    }

                        .pricing-plans .plan .plan-header h3 .figure .amount:before {
                            content: "$";
                            font-size: 1.3rem;
                            font-weight: 400;
                            vertical-align: top;
                            letter-spacing: normal;
                        }

                        .pricing-plans .plan .plan-header h3 .figure .amount:after {
                            position: relative;
                            top: -6px;
                            content: "/MONTH";
                            letter-spacing: normal;
                            font-weight: 400;
                            vertical-align: bottom;
                            font-size: 0.8rem;
                            text-transform: uppercase;
                        }

                .pricing-plans .plan .plan-header h3 .foreword {
                    display: block;
                    font-size: 0.8rem;
                    text-transform: uppercase;
                    padding: 0;
                }

                .pricing-plans .plan .plan-header h3 .afterword {
                    font-size: 0.7rem;
                    text-transform: uppercase;
                    padding: 0;
                    white-space: nowrap;
                    color: #84949c;
                    letter-spacing: 0px;
                }

                .pricing-plans .plan .plan-header h3 .text {
                    font-size: 1rem;
                    line-height: 1.5;
                    margin: 0px;
                    text-align: left;
                }

            .pricing-plans .plan .plan-header .button {
                margin-top: auto;
                display: block;
            }

        .pricing-plans .plan .plan-info .list-group .list-group-item {
            border-radius: 0px;
            border-width: 1px;
            border-right-color: transparent;
            font-weight: 700;
        }

        @media only screen and (min-width: 1200px) {
            .pricing-plans .plan .plan-info .list-group.first {
                margin-top: 11.75rem;
            }
        }

        .pricing-plans .plan .plan-info .list-group.first .list-group-item {
            border-color: transparent;
            padding: 0.9rem 1rem;
        }

        .pricing-plans .plan .plan-info .list-group.last .list-group-item {
            border-right-color: #ddd;
        }

        .plan .gold {
            background-color: #56bdb9 !important;
        }

        .list-group .list-group-item {
            background-color: #efefef;
        }

        .leftlifont {
            font-size: 16px;
        }

        .active {
            background: #30525e;
            color: #fff;
        }

        .btn-default {
            border: 1px solid #30525e;
        }
        .elementor-backgroundnew {
            background-image:url(images/backpricing.png);
            width:100%;
            height:100%;
            
        }

        .elementor-background-overlay {
            background-color: #000000 !important;
            opacity: 0.7 !important;
            transition: background 0.3s, border-radius 0.3s, opacity 0.3s !important;
             width:100%;
            height:100px;
        }
       
        .elementor-container {
            display: flex;
            margin-right: auto;
            margin-left: auto;
            position: relative;
   

        }
        .elementor-widget-wrap  {
            position: relative;
    width: 100%;
    flex-wrap: wrap;
    align-content: flex-start;
}
        .marginsetfortext {
          padding-left:25%!important;
           padding-right:25%!important;
        }

        @media (max-width: 767.98px) {

        
.marginsetfortext {
           padding-left:2%!important;
           padding-right:2%!important;
        }
        }


        
    </style>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA==" crossorigin="anonymous" referrerpolicy="no-referrer" />