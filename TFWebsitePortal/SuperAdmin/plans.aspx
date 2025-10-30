<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="plans.aspx.cs" Inherits="exportimportbidcp.plans" %>
<%@ Register Src="~/UC/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/UC/foot.ascx" TagPrefix="uc1" TagName="foot" %>
<%@ Register Src="~/UC/header.ascx" TagPrefix="uc1" TagName="header" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <uc1:header runat="server" id="header" />
    <script src="assets/js/jquery.js"></script>
</head>
<body>
   <form id="form1" runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server">

    </asp:ScriptManager>
        <uc1:head runat="server" ID="head" />
<main>
 <div class="container-fluid">
 <div class="title-box">
 <div class="row">
 <div class="col-sm-6 col-xl-6"><div class="page-title">Plans</div></div>
  <div class="col-sm-6 col-xl-6"><div class="breadcrumb"></div></div>
 </div>
 </div>

 
 
    
 
  <div class="content-box">
 <div class="card">
 <div class="card-body">
 <div class="card-title text-center pt-4 font-size-20 text-uppercase">
 Upgrade a plan<br />
     Your Selected Plan "FREE Plan-Validity-7 Days"
 </div>
 
 <p class="card-text text-center">Choose the features and functionality your team need today. Easily upgrade as your company grows.</p>
 <div class="price-container">
 <div class="row">
 <div class="col-lg-3">
 <div class="price-box">
 <div class="head">
 <div class="plan-name">StartUp</div>
 <div class="price" style="font-size: 30px;">
&#x20B9;1,000
 </div>
 <div class="per">per month</div>
 </div>
 <div class="body">
 <ul class="list">
 <li><i class="fas fa-check"></i> Export Import Data Access</li>
 <li><i class="fas fa-check"></i> For Any 1 Months</li>
 <li><i class="fas fa-check"></i> 50 Searches Per Month</span></li>
 <li><i class="fas fa-check"></i>1,000 shipments points download</span></li>
 <li><i class="fas fa-check"></i> 24/7 Support</span></li>

 </ul>
 <div class="buy-btn"><a href="#">Buy Now</a></div>
 </div>
 </div>
 </div>
 <div class="col-lg-3">
 <div class="price-box">
 <div class="head">
 <div class="plan-name">Silver</div>
 <div class="price" style="font-size: 30px;">
 &#x20B9;15,000
 </div>
 <div class="per">per 6 month</div>
 </div>
 <div class="body">
 <ul class="list">
 <li><i class="fas fa-check"></i> Export Import Data Access</li>
 <li><i class="fas fa-check"></i> From Jan 2020</li>
 <li><i class="fas fa-check"></i>50 Searches Per Month</span></li>
 <li><i class="fas fa-check"></i>20,000 shipments points download</span></li>
 <li><i class="fas fa-check"></i> 24/7 Support</span></li>
 
 </ul>
 <div class="buy-btn"><a href="#">Buy Now</a></div>
 </div>
 </div>
 </div>
 <div class="col-lg-3">
 <div class="price-box">
 <div class="head">
 <div class="plan-name">Gold</div>
 <div class="price" style="font-size: 30px;">
&#x20B9;45,000
 </div>
 <div class="per">per year</div>
 </div>
 <div class="body">
 <ul class="list">
 <li><i class="fas fa-check"></i> Export Import Data Access</li>
 <li><i class="fas fa-check"></i> From Jan 2019, 2020</li>
 <li><i class="fas fa-check"></i> 100 Searches Per Month</span></li>
 <li><i class="fas fa-check"></i> 1,00,000 shipments points download</span></li>
 <li><i class="fas fa-check"></i> 24/7 Support</span></li>
  
 </ul>
 <div class="buy-btn"><a href="#">Buy Now</a></div>
 </div>
 </div>
 </div>
     <div class="col-lg-3">
 <div class="price-box">
 <div class="head">
 <div class="plan-name">Platinum</div>
 <div class="price" style="font-size: 30px;">
 &#x20B9;60,000
 </div>
 <div class="per">per year</div>
 </div>
 <div class="body">
 <ul class="list">
 <li><i class="fas fa-check"></i>Export Import Data Access</li>
 <li><i class="fas fa-check"></i> From Jan 2018, 2019, 2020</li>
 <li><i class="fas fa-check"></i> 200 Searches Per Month</span></li>
 <li><i class="fas fa-check"></i> 2,00,000 shipments points download</span></li>
 <li><i class="fas fa-check"></i> 24/7 Support</span></li>
  
 </ul>
 <div class="buy-btn"><a href="#">Buy Now</a></div>
 </div>
 </div>
 </div>
 </div>
 </div>
 </div>
 </div>
  </div>


<%--  <div class="card-title"><span class="badge badge-success"></span> <div class="year-box">

  </div></div>--%>
     
  </div>
  
  
 </main>

        <uc1:foot runat="server" id="foot" />
    </form>
</body>
</html>
