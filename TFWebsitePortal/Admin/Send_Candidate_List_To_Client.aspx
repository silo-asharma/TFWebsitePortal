<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Send_Candidate_List_To_Client.aspx.cs" Inherits="Extuent.Admin.Send_Candidate_List_To_Client" EnableEventValidation="false"%>
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
  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
     <script>

         function showpanel()
         {
             //alert();
             document.getElementById('<%= hdnCheckRecId.ClientID %>').value = "";
             document.getElementById('<%= hdnCheckRecId.ClientID %>').innerText="";
             var checkboxes = document.querySelectorAll('input[type="checkbox"]:checked');
             for (var checkbox of checkboxes) {
                 document.body.append(checkbox.value + ' ');
             
                 
                 document.getElementById('<%= hdnCheckRecId.ClientID %>').value = document.getElementById('<%= hdnCheckRecId.ClientID %>').value + '-' + checkbox.value;
             }
           // alert(checkbox.value);
           //  alert(document.getElementById('<%= hdnCheckRecId.ClientID %>').innerText);
             //var url = "http://localhost:60242/admin/Email-Send?emailhidden=" +document.getElementById('<%= hdnCheckRecId.ClientID %>').innerText + "";
             //alert(url);
          //   url_redirect(url);
             // document.getElementById('<%= btnHdf.ClientID %>').click();
           //  return false;
             
         }
         
         </script>
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
                                          <div class="col-sm-6">
										<div class="form-group m-0">
										<label for="exampleFormControlSelect1"> </label>
                                         
                                               
									
									</div>
									<div class="form-group m-0" >
										<label for="exampleFormControlSelect1"></label>
                                           &nbsp;&nbsp;&nbsp;
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
                                                  <div class="form-group m-0" >
                                                <label for="exampleFormControlSelect1"> From Date</label>
                                              <input class="custom-date form-control" id="date1" type="date" runat="server">
										

										
									</div>
									<div class="form-group m-0">
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
									<div class="form-group m-0" >
											 <label for="exampleFormControlSelect1">Status</label>
                                           &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;     &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 
                                          <asp:DropDownList ID="DropDownList1" class="custom-select form-control" runat="server" Width="400px" >
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
                                    <a href="" id="lnknew"></a>
                                 
                                             <asp:Button ID="btnSendProfile" runat="server" Text="Send Profile To Client" class="theme btn btn-primary"  usesubmitbehavior="false" OnClick="btnSendProfile_Click"  />  
                                             
                                    <div class="table-responsive">
                                <table class="table mb-0">
                                    <thead>
                                    <tr>
                                        <th></th>
                                        <th>S.No.</th>
                                        <td>Name</td>
                                        <th>Category Type</th>
                                        <th class="text-center">Date</th>
                                    <%--    <th class="text-center">Video</th>--%>
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
                                        <td><input id="chkReviewded1" type="checkbox" onclick="showpanel()"  value="<%= canloginList[k].rec_id %>" /></td>
                                        <td><%= j %></td>
                                        <td><%= canloginList[k].name %></td>
                                        <td>
                                           <%= getJobTypeName(canloginList[k].available_for_job_type)%>
                                        </td>
                                        <td class="text-center"><%= canloginList[k].doc %></td>
                                        
                                        <td class="text-center">
                                         <div class="status-box">
                                            <div class="text-primary status-title"><%= canloginList[k].status %></div>    
                                            <div class="progress">                                                 
                                                    <div class="progress-bar bg-success" style="width: 100%;"></div>
                                                </div>
                                             
                                        </div>        
                                        </td>
                                        <td> 
                                         <i class="fa fa-eye" aria-hidden="true"></i>   <a href="profile-for-company?vid=<%= canloginList[k].rec_id %>">View</a>
                                               <i class="fa fa-envelope" aria-hidden="true"></i>  <a href="Email-Send?email=<%= canloginList[k].rec_id %>">Send Profile</a>   
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
          <div  style="display: none;">
                <asp:Button ID="btnHdf" runat="server" Text="submit" OnClick="btnEdit_Click" usesubmitbehavior="false"/>
        <asp:HiddenField ID="hdnCheckRecId" runat="server" />
              </div>
        <uc1:foot runat="server" id="foot" />
    </form>
</body>
</html>
