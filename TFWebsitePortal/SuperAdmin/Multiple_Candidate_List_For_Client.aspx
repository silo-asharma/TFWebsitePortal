<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Multiple_Candidate_List_For_Client.aspx.cs" Inherits="Extuent.Admin.Multiple_Candidate_List_For_Client" %>
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
       <%-- <uc1:head runat="server" ID="head" />--%>
    <main>
        <div class="wrapper" ng-controller="myController">
            <div class="row">
                <div class="col-md-12">
                    <div class="page-wrapper">
                      <div class="preloader">
                                        <img src="../images/loader.gif" />
                                    </div>
                         <h3 style="color:orange;text-align:center">CANDIDATE LIST</h3>
                        <div class="row">
                            <div class="col-md-12 col-lg-12">
                                <div class="card bg-light no-shadow">
                                    <!-- Nav tabs -->
                                                       
                                    <div class="table-responsive">
                                <table class="table mb-0">
                                    <thead>
                                    <tr>
                                        <th>S.No.</th>
                                        <td>Name</td>
                                        <th>Job Type</th>
                                       <%-- <th class="text-center">Date</th>--%>
                                    <%--    <th class="text-center">Video</th>--%>
                                        <th class="text-center"></th>
                                        <th></th>
                                      
                                    </tr>
                                    </thead>
                                    <tbody>
                                          <%
                                          int j=0;
                                          int g = -1;
                                          for (int k = 0; k < canloginList.Count; k++)
                                          {
                                              j = j + 1;
                                           
                                              {  %>


                                    <tr>
                                        <td><%= j %></td>
                                        <td><%= canloginList[k].name %></td>
                                        <td>
                                           <%= getJobTypeName(canloginList[k].available_for_job_type)%>
                                        </td>
                                     
                                        
                                        <td class="text-center">
                                         <div class="status-box">
                                            <div class="text-primary status-title"></div>    
                                           
                                             
                                        </div>        
                                        </td>
                                        <td> 
                                         <i class="fa fa-eye" aria-hidden="true"></i>   <a href="profile-for-company?vid=<%= canloginList[k].rec_id %>">View</a>
                                              
                                           <%--<asp:Button ID="Button9" runat="server" Visible="false"  Text="Send Back For Video Upload" ValidationGroup="V1" class="buttons1"  OnClientClick="return confirm('Are you sure you want to continue?')" />--%>
</td>
                                        
                                    </tr>
                                  
                                        <%}
    } %>
                              
                                    </tbody>
                                </table>
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
