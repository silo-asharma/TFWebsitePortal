<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Multiple_Candidate_List_For_Client.aspx.cs" Inherits="Extuent.Admin.Multiple_Candidate_List_For_Client" %>
<%@ Register Src="~/Admin/UC/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/Admin/UC/foot.ascx" TagPrefix="uc1" TagName="foot" %>
<%@ Register Src="~/Admin/UC/header.ascx" TagPrefix="uc1" TagName="header" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Extuent</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="stylesheet" type="text/css" href="../css_ext/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../js/circle-progress.js"></script>
    <script type="text/javascript">
        $( document ).ready(function() {

            /* Menu */
            $(".menu-link").click(function() {
                $(".navigation").slideToggle();
                return false;
            });

            $('.circle').circleProgress({
                startAngle: 4.6,
                reverse: false,
                size: "115",
                thickness: "10",
                fill: {
                    color: "#f06000"
                }
            });

        });
    </script>

<%--    <script src="assets/js/jquery.js"></script>
   
    <script src="assets/js/chart-project.js"></script>
    <uc1:header runat="server" id="header" />--%>
</head>
<body>
    <form id="form1" runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server">

    </asp:ScriptManager>
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
                 <%--   <img src="images/menu.svg" width="30" height="30" alt="menu">--%>
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
<div class="main-container" >
    <div class="container">
        <!-- start page-heading -->
        <div class="page-heading">
            <h1>Candidate Profiles</h1>
        </div>
        <!-- end page-heading -->
        <!-- start candidate-profiles -->
        <div class="candidate-profiles">
            <div class="row">
                  <%
                      int j=0;
                      int g = -1;
                      string imageURL = "";
                      string ratting = "0";
                      string cirval="0";
                      string res = "Pending";
                      string stat = "Pending";
                      for (int k = 0; k < canloginList.Count; k++)
                      {
                          j = j + 1;

                          {


                              imageURL =ImageDisplay+canloginList[k].candidate_profile_pic_url ;

                              ratting = calculaterating(canloginList[k].rec_id.ToString());
                              cirval = Convert.ToString((Convert.ToDouble(ratting)*2)/10);
                              if (canloginList[k].result == "" || canloginList[k].result == null)
                              {
                                  res = "Pending";
                              }
                              else
                                  res = canloginList[k].result;

                              if (canloginList[k].status == "Pending")
                                  stat = "In Process";
                              else
                                  stat= canloginList[k].status;

                    
                                                     %>




                <div class="col-md-2 col-xl-3">
               
                    <!-- start column -->
                    <div class="candidate-column candidate-list6" style="background-image:url(../images/bgnew.png); background-repeat: no-repeat;  background-size: cover;">
                        <div class="row">
                            <div class="col-auto">
                             <div class="imgb">
                                <img src="<%= imageURL %>" width="399" height="189" alt="candidate">
                                </div>        
                            </div>
                            <div class="col padding-left-none">
                               <div class="txtn">
                                    <h4><%= canloginList[k].name %></h4>
                                    <p style="color:black;"><%= getJobName(canloginList[k].job_apply_id.ToString()) %></p>
                                   <div>
                                    <p>Pricing: USD <%= canloginList[k].salary_for_customer %></p>
                                     <p>Availability: <%= canloginList[k].notice_period %></p>
                                       </div>
                                  <%--  <p>Application Status: <span class="status"><%= stat %></span></p>--%>
                                </div>                             </div>
                        </div>
                        <!-- start bottom-bar -->
                        <div class="bottom-bar" style="padding:0px">
                            <div class="row align-items-center">
                                <div class="col-auto">
                                    <br />
                                    <!-- start progress-bar -->
                                   <div class="profile-progress">
                                        <div class="circle" data-value="<%= cirval %> ">
                                            <p><%= ratting %> </p>
                                        </div>
                                    </div>
                                    <!-- end progress-bar -->
                                 <%--   <span class="progress-status"><%= res %></span>--%>
                                </div>
                                <div class="col padding-left-none">
                                    <% if (Request.QueryString["Ex"] != null || Request.QueryString["Pr"] != null){ %>

                                    <a href="admin/profile-for-company?vid=<%= objadmin.Encryptnew(canloginList[k].rec_id.ToString()) %>&&urlnew=<%=urlthis %>&&newupdate=true" title="Watch" class="btn-outline">Watch</a>
                                    <%} else{ %>
                                    <a href="profile-for-company?vid=<%= objadmin.Encryptnew(canloginList[k].rec_id.ToString()) %>&&urlnew=<%=urlthis %>&&newupdate=true" title="Watch" class="btn-outline">Watch</a>
                                    <%} %>
                                 <%--   <span><%= Convert.ToDateTime(canloginList[k].doc).ToString("MMMM dd, yyyy") %></span>--%>
                                    <div class="txt">
                                      <%--  <p><%= canloginList[k].email %></p>--%>
                               <%--         <p><%= canloginList[k].mobile_no %></p>--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end bottom-bar -->
                    </div>
                    <!-- start column -->
                 
                    <!-- end column -->
                </div>

                   <%}} %>
                                        



              
            </div>
        </div>
        <!-- end candidate-profiles -->
        <!-- start page-pagination -->
    <%--    <div class="page-pagination">
            <ul class="pagination">
                <li class="page-item disabled">
                    <a class="page-link">
                        <img src="../images/icon_previous.svg" width="24" height="24" alt="previous">
                    </a>
                </li>
                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                    <a class="page-link" href="#">
                        <img src="../images/icon_next.svg" width="24" height="24" alt="Next">
                    </a>
                </li>
            </ul>
        </div>--%>
        <!-- end page-pagination -->
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
                    <%--    <li><a href="#" title="Terms of Use">Terms of Use</a></li>
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
       <%-- <uc1:head runat="server" ID="head" />--%>
    
     <!-- Main content end here -->

<%--       <uc1:foot runat="server" id="foot" />--%>
    </form>
</body>
</html>
