<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Notification_List.aspx.cs" Inherits="Extuent.Admin.Notification_List" %>
<%@ Register Src="~/Admin/UC/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/Admin/UC/foot.ascx" TagPrefix="uc1" TagName="foot" %>
<%@ Register Src="~/Admin/UC/header.ascx" TagPrefix="uc1" TagName="header" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="assets/js/jquery.js"></script>
   
    <script src="assets/js/chart-project.js"></script>
    <uc1:header runat="server" id="header" />
</head>
<body>
    <form id="form1" runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server">

    </asp:ScriptManager>
        <uc1:head runat="server" ID="head" />
    <main>
        <div class="wrapper" ng-controller="myController">
            <div class="row">
                <div class="col-md-12">
                    <div class="page-wrapper">
                      <div class="preloader">
                                        <img src="../images/loader.gif" />
                                    </div>
                        <div class="row">
                            <div class="col-md-12 col-lg-12">
                                <div class="card bg-light no-shadow">
                                    <!-- Nav tabs -->
 <div class="row margin-top-30">
 <div class="col-xl-12">
 <div class="card" style="height:300px">
  <div class="card-body">
  <div class="card-title">Interview List <a href="#" class="action-btn">View All</a></div>
  <div class="task-list">
  <div class="task-box">
<div class="check-box d-inline-block">
     <label>
            <input type="checkbox" name="task" class="theme-control"/>
        </label>
		</div>
  <div class="content d-inline-block">
  <div class="task-title">UX designer </div>
  <div class="projectname">Uit </div>
  </div>
  <div class="deadline">
  <div class="name">Deadline</div>
  <div class="date text-danger">23 Sep 2022</div>
  </div>
  </div>
  <div class="task-box">
  <div class="check-box d-inline-block">
     <label>
            <input type="checkbox" name="task" class="theme-control"/>
        </label>
		</div>
  <div class="content d-inline-block">
  <div class="task-title">UI developer </div>
  <div class="projectname">Testo Development</div>
  </div>
  <div class="deadline">
  <div class="name">Deadline</div>
  <div class="date text-success">25 OCt 2022</div>
  </div>
  </div>
  <div class="task-box">
  <div class="check-box d-inline-block">
     <label>
            <input type="checkbox" name="task" class="theme-control"/>
        </label>
		</div>
  <div class="content d-inline-block">
  <div class="task-title">SEO </div>
  <div class="projectname">Band </div>
  </div>
  <div class="deadline">
  <div class="name">Deadline</div>
  <div class="date text-success">30 Nov 2022</div>
  </div>
  </div>
  </div>
  </div>
  </div>
 </div>


 </div>
                                                           
                                    
                            </div>
                        </div></div>
                  
                        
                        </div>
                    </div>
                </div>
            </div>
        </div>


        </main>
     <!-- Main content end here -->

        <uc1:foot runat="server" id="foot" />
    </form>
</body>
</html>
