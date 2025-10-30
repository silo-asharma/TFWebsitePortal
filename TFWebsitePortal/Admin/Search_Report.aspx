<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search_Report.aspx.cs" Inherits="Extuent.Admin.Search_Report" EnableEventValidation="false"%>
<%@ Register Src="~/Admin/UC/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/Admin/UC/foot.ascx" TagPrefix="uc1" TagName="foot" %>
<%@ Register Src="~/Admin/UC/header.ascx" TagPrefix="uc1" TagName="header" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <script src="assets/js/jquery.js"></script>
   
    <script src="assets/js/chart-project.js"></script>
    <uc1:header runat="server" id="header" />

       <link href="../vendor/datatables/css/jquery.dataTables.min.css" rel="stylesheet">
    <script>
        $('#txtFromDate').datetimepicker({
        format: 'yyyy-mm-dd'
       
        });
      
    $(document).ready(function () {
        if ($('#date1').prop('type') != 'date') $('#date1').datepicker();
    });
</script>
      <style>
          .btnClassnew {
              background-image:url(images/button3.png);
              width:180px;
               border-color: white; 
               background-color:white;
                color: white; 
                border-radius: 24px;
                 height: 40px;
          }
      </style>
</head>
<body>
   <form id="form1" runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server">

    </asp:ScriptManager>
        <uc1:head runat="server" ID="head" />

        <div class="content-body">
            <div class="container-fluid">
				<!-- Add Order -->
				
                <span>&nbsp;  </span><hr />
                <!-- row -->
                <div class="row">
                    <div class="col-xl-12 col-xxl-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Reports</h4>
                            </div>
                            <div class="card-body">
							
                                                

                                                <div class="row">

                                                       
                                                    <table style="width: 100%">

                                                        <tr>


                                                            <td style="width: 50%;padding:2px;">
                                                                <asp:DropDownList ID="ddlCategory" runat="server" class="form-control">
                                         
                                            
                                        </asp:DropDownList>
                                                                <asp:TextBox ID="txtName" runat="server" Text=""  class="form-control" placeholder="Name" Visible="false"></asp:TextBox>
                                                                </td>
                                                             <td style="width: 50%;padding:2px;">
                                                                 <asp:DropDownList ID="ddlAllJob" runat="server" class="form-control" placeholder="">
                                          
                                               
                                        </asp:DropDownList>
                                                                       </td>
                                                            </tr>
                                                         <tr>


                                                            <td style="width: 50%;padding:2px;">  
                                                                 <asp:DropDownList ID="ddlResult" runat="server" class="form-control">
                                             <asp:ListItem Value="0">Select Application Status</asp:ListItem>
                                               <asp:ListItem Value="Completed">Completed</asp:ListItem>
                                               <asp:ListItem Value="Pending">In Process</asp:ListItem>
                                         
                                           
                                        </asp:DropDownList>
                                                                  
                                                                
                                                                 <asp:TextBox ID="txtEmail" runat="server" Text=""  class="form-control" placeholder="Email" Visible="false"></asp:TextBox>
                                                         
                                                                   
                                                                </td>
                                                             <td style="width: 50%;padding:2px;">
                                                                 <asp:DropDownList ID="ddlDescStatus" runat="server" class="form-control">
                                             <asp:ListItem Value="0">Select Decision Status</asp:ListItem>
                                          <asp:ListItem Value="Pending">Pending</asp:ListItem>
                                          <asp:ListItem Value="Pass">Pass</asp:ListItem>
                                               <asp:ListItem Value="Hold">On Hold</asp:ListItem>
                                               <asp:ListItem Value="Reject">Reject</asp:ListItem>
                                        <asp:ListItem Value="Hired">Hired</asp:ListItem>
                                        </asp:DropDownList>
                                                                </td>
                                                             </tr>
                                                        <tr>


                                                            <td style="width: 50%;padding:2px;">
                                                                <asp:TextBox ID="txtPhone" runat="server" Text="" class="form-control" placeholder="Phone No" Visible="false"></asp:TextBox>
									
                                                                </td>
                                                             <td style="width: 50%;padding:2px;">
                                                                 	
									
                                                                </td>
                                                             </tr>
                                                        <tr>


                                                            <td style="width: 50%;padding:2px;">
                                                                  <asp:DropDownList ID="ddljobType" runat="server" Width="400px" Visible="false">
                                           <asp:ListItem Value="">Select</asp:ListItem>
                                               <asp:ListItem Value="">Full-Time</asp:ListItem>
                                               <asp:ListItem Value="">Part-Time</asp:ListItem>
                                               <asp:ListItem Value="">Remote</asp:ListItem>
                                        </asp:DropDownList>
                                                                </td>
                                                             <td style="width: 50%;padding:2px;">

                                                                </td>
                                                             </tr>
                                                        <tr>


                                                            <td style="width: 50%;padding:2px;">
                                                                 <input class="custom-date form-control" id="date1" type="date" runat="server" placeholder="From Date">
                                                                </td>
                                                             <td style="width: 50%;padding:2px;">
                                                                   <input class="custom-date form-control" id="date2" type="date" runat="server" placeholder="To Date">
                                                                </td>
                                                             </tr>
                                                        <tr>
                                                            <td style="width: 50%;padding:2px;">

                                                            </td>
                                                            <td style="width: 50%;padding:2px;text-align:right;">
                                                                <asp:Button ID="btnAdd" runat="server" Text="Search" class="bg-orange" style="width:200px; border-color: #FF7416; color: white; border-radius: 12px; height: 35px;"  usesubmitbehavior="false" OnClick="btnAdd_Click" />
                           
                                                            </td>
                                                        </tr>
                                                        </table>

                                           <div class="col-sm-6">
                                               	<div class="form-group m-0">
										  
                                               &nbsp;
                                              </div>
                                               	<div class="form-group m-0">
										       
                                 
                                              </div>

                                               </div>
                                            <div class="col-sm-6">
                                               	<div class="form-group m-0">
										
                                           
                                         
                                           

                                              </div>
                                               	<div class="form-group m-0">
										     
                                            
                                              </div>

                                               </div>
                                          <div class="col-sm-6">
										<div class="form-group m-0">
										      
                                                      &nbsp; 
									</div>
									
                                              </div>
                                          <div class="col-sm-6">
										<div class="form-group m-0">
										
								
									</div>
									<div class="form-group m-0" >
										
                                        
                                       
										
									</div>
                                              </div>
                                      
                                              <div class="col-sm-6">
                                                  
                                                  <div class="form-group m-0" >
                                 
                                             
										

										
									</div>
                                                  </div>
                                                         
                                          </div>


                                <div class="row">
												<div class="col-12">
                                                     <div class="card">

                                                    <div class="card-body">
                                                        <div class="col-sm-12" style="text-align:right;">
									<div class="form-group m-0">
						
								
                                                      &nbsp;&nbsp;&nbsp;          &nbsp;   
                                       
									</div>
									
									
                                    
									
								                       <asp:Button ID="Button1" runat="server" CssClass="btnClassnew"  Text="" ValidationGroup="V1"   OnClick="Button9_Click"   />
                                              
</div>
													<div class="table-responsive">
														<table class="display dataTable" >
                                    <thead>
                                    <tr>
                                        <%--<th>S.No.</th>--%>
                                          <th></th>
                                        <th>Name</th>
                                        <th>Category</th>
                                        <th>Job Title</th>
                                        <th class="text-center">Date(DD-MM-YYYY)</th>
                                    <%--    <th class="text-center">Video</th>--%>
                                        <th class="text-center">Application Status</th>
                                        <th class="text-center">Decision Status</th>
                                      
                                      
                                    </tr>
                                    </thead>
                                    <tbody>
                                          <%
                                          int j=0;
                                          int g = -1;
                                          string st="";
                                          string re="";
                                          for (int k = 0; k < canloginList.Count; k++)
                                          {
                                              j = j + 1;

                                              if(canloginList[k].status=="Pending")
                                                  st="In Process";
                                              else
                                                 st=canloginList[k].status;

                                              if(canloginList[k].result==null)
                                                 re="Pending";
                                              else
                                                 re=canloginList[k].result;
                                           
                                              {  %>


                                    <tr>
                                       <%-- <td><%= j %></td>--%>
                                        <td> 
                                         <a href="candidate-profile?vid=<%= canloginList[k].rec_id %>&&prevnext=false">   <i class="fa fa-eye" aria-hidden="true"></i></a>
                                             <%--  <i class="fa fa-envelope" aria-hidden="true"></i>  <a href="send-profile?email=<%= canloginList[k].rec_id %>">Send Profile</a>   --%>
                                           <%--<asp:Button ID="Button9" runat="server" Visible="false"  Text="Send Back For Video Upload" ValidationGroup="V1" class="buttons1"  OnClientClick="return confirm('Are you sure you want to continue?')" />--%>
</td>
                                        <td><%= canloginList[k].name %> <%= canloginList[k].last_name %></td>
                                        <td>
                                           <%= getJobTypeName(canloginList[k].available_for_job_type) %>
                                        </td>
                                         <td class="text-center"><%= getJobName(canloginList[k].job_apply_id.ToString())%></td>
                                        <td class="text-center"><%= Convert.ToDateTime(canloginList[k].doc).ToString("dd/MM/yyyy") %></td>
                                        
                                        <td class="text-center">
                                         <div class="status-box">
                                            <div class="text-primary status-title"><%= st %></div>    
                                        
                                             
                                        </div>        
                                        </td>
                                         <td class="text-center"><%= re %></td>
                                        
                                        
                                    </tr>
                                  
                                        <%}
    } %>
                              
                                    </tbody>
                                </table>
													</div>
                                                          <div class="col-sm-12" style="text-align:right;">
									<div class="form-group m-0">
						
								
                                                      &nbsp;&nbsp;&nbsp;          &nbsp;   
                                       
									</div>
									
									
                                    
									
								                       <asp:Button ID="Button9" runat="server" CssClass="btnClassnew"  Text="" ValidationGroup="V1"   OnClick="Button9_Click"   />
                                              
</div>
                                                        </div>
                                                         </div>

												</div>
											</div>
									</div>
								</div>
                            </div>
                        </div>
                    </div>


    <!-- Main content end here -->

        <uc1:foot runat="server" id="foot" />
             <script src="../vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="../js/plugins-init/datatables.init.js"></script>
    </form>
</body>
</html>
