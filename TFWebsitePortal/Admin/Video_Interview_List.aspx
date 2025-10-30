<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Video_Interview_List.aspx.cs" Inherits="Extuent.Admin.Video_Interview_List"  EnableEventValidation="false"%>
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
                            <div class="col-sm-12 margin-top-30">
            <div class="card">
							<div class="card-body">
								<h6 class="card-title border-bottom-with-margin"Search By Filters</h6>
							
									  <div class="row">
                                          <div class="col-md-6">
									
									<div class="form-group m-0" >
										<label for="exampleFormControlSelect1"> </label>
                                        
                                         <asp:DropDownList ID="ddljobType" runat="server" Width="400px" Visible="false">
                                           <asp:ListItem Value="">Job Type</asp:ListItem>
                                               <asp:ListItem Value="">Full-Time</asp:ListItem>
                                               <asp:ListItem Value="">Part-Time</asp:ListItem>
                                               <asp:ListItem Value="">Remote</asp:ListItem>
                                        </asp:DropDownList>
										
									</div>
                                              </div>
                                          <div class="col-sm-12">
                                                      <hr />
                                                  <div class="form-group m-6" >
                                                <label for="exampleFormControlSelect1"> From Date</label>
                                              <input class="custom-date form-control" id="date1" type="date" runat="server">
										

										
									</div>
									<div class="form-group m-6">
									<label for="exampleFormControlSelect1"> To Date</label>
								  <input class="custom-date form-control" id="date2" type="date" runat="server">
                                                      &nbsp;&nbsp;&nbsp;          &nbsp;   
                                       
									</div>
                                              </div>
                                              <div class="col-sm-6">
									<div class="form-group m-0">
										<label for="exampleFormControlSelect1">Select Category</label>
									<asp:DropDownList ID="ddlCategory" class="custom-select form-control" runat="server" Width="400px">
                                           <asp:ListItem Value="">Job Type</asp:ListItem>
                                            
                                        </asp:DropDownList>
									</div>
	<div class="form-group m-0">
										<label for="exampleFormControlSelect1">Status</label>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                              <asp:DropDownList ID="DropDownList1" class="custom-select form-control" runat="server" Width="400px">
                                           <asp:ListItem Value="Job Status">Job Status</asp:ListItem>
                                               <asp:ListItem Value="Completed">Completed</asp:ListItem>
                                               <asp:ListItem Value="In-Process">In-Process</asp:ListItem>
                                               <asp:ListItem Value="Pending">Pending</asp:ListItem>
                                                  <asp:ListItem Value="Rejected">Rejected</asp:ListItem>
                                        </asp:DropDownList>
									
									</div>
									
									
                                    
									<asp:Button ID="btnAdd" runat="server" Text="submit" class="theme btn btn-primary"  usesubmitbehavior="false" OnClick="btnAdd_Click" />
						
							
									
									
</div>
                                          </div>
								
							</div>
						</div>
            </div>
                            <div class="col-md-12 col-lg-12">
                                <div class="card bg-light no-shadow">
                                    <!-- Nav tabs -->
                                                           
                                    <div class="table-responsive">
                                <table class="table mb-0">
                                    <thead>
                                    <tr>
                                        <th>S.No.</th>
                                        <td>Name</td>
                                        <th>Category Type</th>
                                         <th class="text-center">Job Name</th>
                                        <th class="text-center">Date</th>
                                       
                                        <th class="text-center">Status</th>
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
                                           <%= getJobTypeName(canloginList[k].available_for_job_type) %>
                                        </td>
                                        <td>
                                           <%= getJobName(canloginList[k].job_apply_id.ToString()) %>
                                        </td>
                                        <td class="text-center"><%= canloginList[k].doc %></td>
                                        
                                        <td class="text-center">
                                         <div class="status-box">
                                            <div class="text-primary status-title"><%= canloginList[k].status %></div>    
                                            <div class="progress">                                                 
                                                    <%--<div class="progress-bar bg-primary" style="width: 35%;">--%></div>
                                                </div>
                                             
                                        </div>        
                                        </td>
                                        <td> 
                                         <i class="fa fa-eye" aria-hidden="true"></i>   <a href="candidate-profile?vid=<%= canloginList[k].rec_id %>"">View</a>
                                               <i class="fa fa-trash" aria-hidden="true"></i>  <a href="video-interview-list?Del=<%= canloginList[k].rec_id %>">Delete</a>   
                                           <asp:Button ID="Button9" runat="server" Visible="false"  Text="Send Back For Video Upload" ValidationGroup="V1" class="buttons1"  OnClientClick="return confirm('Are you sure you want to continue?')" />
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
