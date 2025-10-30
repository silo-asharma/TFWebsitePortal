<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="workplace.aspx.cs" Inherits="exportimportbidcp.workplace" %>
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
 <div class="col-sm-6 col-xl-6"><div class="page-title">My Work Place</div></div>
  <div class="col-sm-6 col-xl-6"><div class="breadcrumb"></div></div>
 </div>
 </div>
 <div class="row">
 
  <div class="col-lg-12 col-xl-13">
  <div class="card" style="height:400px">
  <div class="card-body">
  <div class="card-title"><span class="badge badge-success"></span> <div class="year-box">

  </div></div>
    <center>  <a href="history" alt="History"><img src="assets/images/folder-icon.png" width="200px" height="200px" alt="History"/> </a>

      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <a href="my-wallet" alt="Wallet"><img src="assets/images/folder-icon.png" width="200px" height="200px" alt="Wallet"/> </a>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <a href="invoice-list" alt="Invocie">  <img src="assets/images/folder-icon.png" width="200px" height="200px" alt="Invoice"/> <//a>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   
        </center>
  </div>
  
  </div>
  </div>
 </div>
 
 </div>
 </main>

        <uc1:foot runat="server" id="foot" />
    </form>
</body>
</html>
