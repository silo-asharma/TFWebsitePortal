<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="header.ascx.cs" Inherits="exportimportbidcp.Dashboard.UC.header" %>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Video Intro</title>
    <!-- Favicon icon -->
<%--    <link rel="icon" type="image/png" sizes="16x16" href="./images/favicon.png">--%>
    <!-- Form step -->
    <link href="./vendor/jquery-smartwizard/dist/css/smart_wizard.min.css" rel="stylesheet">
    <!-- Custom Stylesheet -->
<%--	<link href="./vendor/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet">--%>
    <link href="./css/style.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&family=Roboto:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<style>
.content-body {
    padding-top: 60px !important;
}

@media only screen and (min-width: 1200px) and (max-width: 1400px){
.content-body {
    margin-left: 17rem !important;
}

.deznav {
    width: 17rem !important;
}
.header {
    padding-left: 18rem !Important;
}

.nav-header .hamburger .line {
    background: #FE634E !important;
}



.header .header-content {
    height: 100%;
    padding-left: 5.3125rem;
    padding-right: 2.4rem;
    align-items: center;
    display: flex;
}
.nav-control{
    display: block !Important;
}

.nav-header .hamburger {
    display: block !important;
}

.deznav .metismenu > li a > i {
    font-size: 1.4rem;
    display: inline-block;
    vertical-align: middle;
    position: relative;
    top: 0;
    height: auto;
    width: auto;
    border-radius: 1.25rem;
    line-height: 1;
    text-align: center;
    -webkit-transition: all 0.5s;
    -ms-transition: all 0.5s;
    transition: all 0.5s;
    margin-right: 15px;
    color: #FE634E;
}
[data-sidebar-style="full"][data-layout="vertical"] .deznav .metismenu > li .has-arrow:after {
    right: 1.5rem;
}

[data-sidebar-style="mini"][data-layout="vertical"] .deznav .metismenu > li.mm-active > a {
     background: unset; 
     color: unset; 
    border-radius: 1.25rem;
}
[data-sidebar-style="mini"] .deznav .nav-text {
     display: block !important;
}


[data-sidebar-style="mini"] .deznav .metismenu li a {
    /* padding: 0.813rem 0.875rem; */
    padding: 20px 30px;
    font-size: 15px;
    display: flex;
    
}

 .deznav .metismenu > li > a:before {
    position: absolute;
    height: 100%;
    width: 11px;
    top: 0;
    border-radius: 0px 10px 10px 0;
    left: -11px;
    content: "";
    background: #FE634E;
    -webkit-transition: all 0.5s;
    -ms-transition: all 0.5s;
    transition: all 0.5s;
}

.deznav .metismenu > li.mm-active > a:before {
    position: absolute !important;
    height: 100% !important;
    width: 11px !important;
    top: 0 !important;
    border-radius: 0px 10px 10px 0 !important;
    left: 0px !important;
    content: "" !important;
    background: #FE634E !important;
    -webkit-transition: all 0.5s;
    -ms-transition: all 0.5s;
    transition: all 0.5s;
}

.deznav .metismenu > li {
   padding: unset !important; 
}

.deznav .metismenu > li:hover > a {
   background: none !important;
    color: #FE634E !important;
    border-radius: 1.25rem;
    position: unset;
}

.metismenu .has-arrow:after {
    position: absolute;
    content: "";
    width: 0.5em;
    height: 0.5em;
    border-width: 1px 0 0 1px;
    border-style: solid;
    border-color: initial;
    right: 1em;
    -webkit-transform: rotate(-45deg) translateY(-50%);
    transform: rotate(-45deg) translateY(-50%);
    -webkit-transform-origin: top;
    transform-origin: top;
    top: 50%;
    transition: all .3s ease-out;
}

.deznav .metismenu .has-arrow:after {
    width: 0.5rem;
    height: 0.5rem;
    right: 1.875rem;
    top: 48%;
    border-color: inherit;
    -webkit-transform: rotate(-225deg) translateY(-50%);
    transform: rotate(-225deg) translateY(-50%);
}

.nav-header .brand-title {
    display: block !important;
}

.nav-header .brand-title {
    margin-left: 150px !important;
    max-width: 120px;
    margin-top: 0px;
} 

}

.orangeline{
     border: 1px solid #fe634e;
    width: 100%;
    -webkit-box-shadow: 0px 1px 1px #de1dde;
    -moz-box-shadow:0px 1px 1px #de1dde;
    box-shadow: 0px 1px 1px #fe634e;

}



.candidate-profiles .icon-list .icon input[type='checkbox']:checked:after {
    width: 100%;
    height: 100%;
    display: block;
    content: "\f00c";
    font-family: 'FontAwesome';
    color: #fff;
    font-weight: 100;
    font-size: 15px;
    line-height: 22px;
    text-align: center;
    border-radius: 3px;
    background: var(--primary-color);
}

select {
    -webkit-appearance: none;
    appearance: none;
}

.pagination .page-item .page-link {
   
    background: #fff;
    font-weight:600;
   
}

.pagination .page-item .page-link:hover {
    
    color: #fff !important;
   
}

.pagination {
    margin-bottom:0px;
}
.profile-card{
Position: relative;
}
.vdolink {
Position: absolute ;
Bottom: 0;
}

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

</style>

<script>

    function ShowPopup(title, body) {
            title = "Success!";
            $("#exampleModalCenter .modal-title").html(title);
            $("#exampleModalCenter .content-desc").html(body);
            $("#exampleModalCenter").modal("show");
    }

   </script>

