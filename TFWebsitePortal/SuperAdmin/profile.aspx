<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="exportimportbidcp.app.profile" %>

<%@ Register Src="~/UC/header.ascx" TagPrefix="uc1" TagName="header" %>
<%@ Register Src="~/UC/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/UC/footer.ascx" TagPrefix="uc1" TagName="footer" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp"%>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <uc1:header runat="server" ID="header" />
    <script src="assets/js/jquery.js"></script>

       <script>
           function insertData() {


               var aboutnew = $("#txtabout").val();
               var phonenew = $("#lblmobile").val();
               var emailnew = $("#lblemail").val();
               var addressnew = $("#lbladdress").val();

               if (aboutnew == "")
                   alert("Please enter Name !!!");
               else if (phonenew == "")
                   alert("Please enter new phone no!!!");
               else if (emailnew == "")
                   alert("Please enter email id!!!");
               else if (addressnew == "")
                   alert("Please enter address!!!");
               else {
                   window.location.href = "http://localhost:14034/profile?aboutnew=" + aboutnew + "&phonenew=" + phonenew + "&emailnew=" + emailnew + "&addressnew=" + addressnew;
               }
           }
    </script>
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
 <div class="col-12 col-sm-6 col-xl-6"><div class="page-title">Profile</div></div>
  <div class="col-12 col-sm-6 col-xl-6 "><div class="breadcrumb"><a href="dashboard">Dashboard</a> <span><i class="fas fa-angle-right"></i></span> Profile</div></div>
 </div>
 </div>
 <div class="profile-box">
 <div class="header">
 <div class="overlay"></div>
 <div class="edit-btn"><a href="profile?type=edit"><i class="fas fa-pencil-alt"></i></a></div>
 <div class="follower-box">
 <div> 0  <span>Download Points</span></div>
  <%--<div> 10  <span>Following</span></div>--%>
 </div>
 </div>
 <div class="body">
 <div class="row">
 <div class="col-xl-10 col-lg-10 pr-3">
 <div class="left-panel">
 <div class="profile-info-box">
 <div class="profile-pic">
 <img src="assets/images/user1.png" class="w-100" />
 
 </div>
 <div class="name" id="divname" runat="server">Rakhi</div>
<%-- <div class="position">Customer Name</div>--%>
 <ul class="list">
 <li><div class="count">0</div>
  <div class="name">Total Downloads</div>
 </li>
 <li><div class="count">0</div>
  <div class="name">Remaining Downloads Points</div>
 </li>
 <li><div class="count" id="divplanname" runat="server">Free</div>
  <div class="name">Plan</div>
 </li>
 </ul>
 </div>
     <div class="widget" id="edit" runat="server" visible="false">
 <div class="head">About </div>
 <p> <input type="text" class="form-control" id="txtabout" runat="server" value="exportimportbid"></p>
 <ul class="list">
  <li><i class="fas fa-phone-alt"></i><input type="text" class="form-control" id="lblmobile" runat="server" value=" +1 999 999 9999"></li>
  <li><i class="fas fa-envelope"></i><input type="text" class="form-control" id="lblemail" runat="server" value="aaron@exportimportbid.com"> </li>
  <li><i class="fas fa-map-marker-alt"></i>  <input type="text" class="form-control" id="lbladdress" runat="server" value="New York, USA"></li>
 </ul>
         									<button type="submit" class="theme btn btn-primary mr-2" onclick="insertData()">Submit</button>
 </div>
 <div class="widget" id="display" runat="server" visible="false">
 <div class="head">About </div>
 <p id="divabout" runat="server"> exportimportbid.</p>
 <ul class="list">
  <li id="divmobile" runat="server"><i class="fas fa-phone-alt"></i> +1 999 999 9999</li>
  <li id="divemail" runat="server"><i class="fas fa-envelope"></i> aaron@exportimportbid.com</li>
  <li id="divaddress" runat="server"><i class="fas fa-map-marker-alt"></i>  New York, USA</li>
 </ul>
 </div>
 <%--<div class="widget">
 <div class="head">Skills </div>
 <div class="skill-box">
 <div class="name">HTML</div>
 <div class="progress">                                                 
 <div class="progress-bar bg-primary" style="width: 35%;"></div>
 </div>
                                     
 </div>
 <div class="skill-box">
 <div class="name">CSS</div>
 <div class="progress">                                                 
                                                    <div class="progress-bar bg-warning" style="width: 20%;"></div>
                                                </div>
 </div>
 <div class="skill-box">
 <div class="name">Javascript</div>
  <div class="progress"> 
 <div class="progress-bar bg-success" style="width: 60%;"></div>
 </div>
 </div>
 <div class="skill-box">
 <div class="name">Jquery</div>
 <div class="progress">                                                 
                                                    <div class="progress-bar bg-danger" style="width: 50%;"></div>
                                                </div>
 </div>
 </div>--%>
 </div>
 </div>
 <%--<div class="col-xl-6 col-lg-6">
 <div class="timeline-part">
 <div class="card">
 <div class="card-body">
 <form>
 <div class="form-group">
    <textarea class="form-control" id="statustype-box" placeholder="What's on your mind?"></textarea>
  </div>
  <div class="btn-box">
     <button type="submit" class="btn btn-primary">Post</button>
     <ul class="list">
     <li><a href="#" class="active"><i class="fas fa-images"></i></a></li>
     <li><a href="#"><i class="fas fa-video"></i></a></li>
     <li><a href="#"><i class="fas fa-sticky-note"></i></a></li>
     </ul>
     </div>
 </form>
 </div>
 </div>
 <div class="card">
 <div class="card-header">
 <div class="row">
 <div class="col-9">
 <div class="profile-thumbnail"><img src="assets/images/user-profile.jpg" class="w-100" /></div>
 <div class="name">Aaron doe</div>
 <div class="time">1 min ago</div>
 </div>
 <div class="col-3 text-right"><a href="#" class="more-btn"><i class="fas fa-ellipsis-v"></i></a></div>
 </div>
 </div>
 <div class="card-body">
 <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
 <div class="post-content">
 <img src="assets/images/gallery-03.jpg" class="w-100" />
 </div>
 </div>
 <div class="card-footer">
 <ul class="list">
 <li><a href="#"><i class="far fa-heart"></i> 201 Likes</a></li>
 <li><a href="#"><i class="far fa-comment-alt"></i> 5 Comments</a></li>
 <li><a href="#"><i class="far fa-share-square"></i> 2 Share</a></li>
 </ul>
 </div>
 </div>
 </div>
 </div>--%>
 <%--<div class="col-xl-3 col-lg-3 pl-0">
 <div class="right-panel">
 <div class="widget video">
 <div class="head">Videos</div>
 <div class="video-box">
 <div class="row">
 <div class="col-4 pr-0">
 <div class="video-preview"><img src="assets/images/gallery-01.jpg" class="w-100" /> <i class="fas fa-play"></i></div>
 </div>
 <div class="col-8">
 <div class="title">Study tour video</div>
 <p>Need to watch carefully.</p>
 </div>
 </div>
 </div>
 <div class="video-box">
 <div class="row">
 <div class="col-4 pr-0">
 <div class="video-preview"><img src="assets/images/gallery-01.jpg" class="w-100" /><i class="fas fa-play"></i></div>
 </div>
 <div class="col-8">
 <div class="title">Techology update</div>
 <p>Need to watch carefully.</p>
 </div>
 </div>
 </div>
 <div class="video-box">
 <div class="row">
 <div class="col-4 pr-0">
 <div class="video-preview"><img src="assets/images/gallery-01.jpg" class="w-100" /> <i class="fas fa-play"></i></div>
 </div>
 <div class="col-8">
 <div class="title">Health issues</div>
 <p>Need to watch carefully.</p>
 </div>
 </div>
 </div>
 </div>
 <div class="widget gallery">
 <div class="head">Photos </div>
 <div class="row pt-2 pb-1">
 <div class="col-6 pr-2">
 <div class="image"><img src="assets/images/gallery-01.jpg" class="w-100"/></div>
 </div>
 <div class="col-6 pl-2"><div class="image"><img src="assets/images/gallery-02.jpg" class="w-100"/></div> </div>
 </div>
 <div class="row pt-2">
 <div class="col-6 pr-2">
 <div class="image"><img src="assets/images/gallery-03.jpg" class="w-100"/></div>
 </div>
 <div class="col-6 pl-2"><div class="image"><img src="assets/images/gallery-04.jpg" class="w-100"/></div> </div>
 </div>
 </div>
 </div>
 </div>--%>
 </div>
 </div>
 </div>
 </div> 

 </main>

        <uc1:footer runat="server" ID="footer" />
    </form>
</body>
</html>
