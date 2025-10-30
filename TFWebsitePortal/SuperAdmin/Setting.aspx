<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Setting.aspx.cs" Inherits="Extuent.SuperAdmin.Setting" %>
<%@ Register Src="~/SuperAdmin/UC/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/SuperAdmin/UC/foot.ascx" TagPrefix="uc1" TagName="foot" %>
<%@ Register Src="~/SuperAdmin/UC/header.ascx" TagPrefix="uc1" TagName="header" %>
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

        <div class="content-body">
            <div class="container-fluid">
				<!-- Add Order -->
				
                <span>&nbsp;User Management</span><hr />
                <!-- row -->
                <div class="row">
                    <div class="col-xl-12 col-xxl-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Users </h4>
                            </div>
                            <div class="card-body">
							
                                                

                                                <div>
                                                    
                                                    <table style="width: 100%;padding:5px;">
                                                        <tr>
                                                            <td style="padding:5px;">
                                                                <input type="text" class="form-control" id="txtname" placeholder="Company Name" runat="server" required></td>
                                                             <td style="padding:5px;">&nbsp;</td>
                                                            <td style="padding:5px;">
                                                                <input type="text" class="form-control" id="txtemail" placeholder="Company Email" runat="server" required></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="padding:5px;">
                                                                <input type="text" class="form-control" id="txtuserid" placeholder="User Id" runat="server" required></td>
                                                              <td style="padding:5px;">&nbsp;</td>
                                                             <td style="padding:5px;">
                                                                <input type="Password" class="form-control" id="txtpassword" placeholder="Password" runat="server" required></td>
                                                        </tr>
                                                        <tr>


                                                            <td style="width: 45%;padding:5px;">
                                                                <asp:DropDownList ID="ddlRole" runat="server" class="form-control default-select" Visible="false">
                                                                </asp:DropDownList>

                                                          </td>
                                                            <td style="width: 10%;padding:5px;">&nbsp;</td>
                                                            <td style="width: 45%;padding:5px;">
                                                                <asp:CheckBox ID="rdoemail" runat="server" Text=" Is Email Used For Notification" Visible="false"/>

                                                                <asp:Button ID="btnAdd" runat="server" Text="Save" class="bg-orange" Style="width: 80px; border-color: #FF7416; color: white; border-radius: 12px; height: 35px" UseSubmitBehavior="false" OnClick="btnAdd_Click" />
                                                                <asp:Button ID="btnUpdate" runat="server" Text="Update" class="bg-orange" Style="width: 80px; border-color: #FF7416; color: white; border-radius: 12px; height: 35px" UseSubmitBehavior="false" Visible="false" OnClick="btnUpdate_Click1" />




                                                            </td>
                                                        </tr>

                                                    </table>
                                                  
                                                    
                                                    
                                                    
												
												
												
                                        </div>
										

											<div class="row">
												<div class="col-12">
													<div class="skip-email text-center">
														<table class="table mb-0">
                                    <thead>
                                    <tr>
                                        <th>S.No.</th>
                                        <td>Customer Id</td>
                                        <td>Company Name</td>
                                        <td>Email</td>
                                        <th></th>
                                       
                                 
                                      
                                    </tr>
                                    </thead>
                                    <tbody>
                                      <%
                                          int j=0;
                                          int g = -1;
                                          for (int k = 0; k < usrloginlist.Count; k++)
                                          {
                                              j = j + 1;
                                           
                                              {  %>
                                    <tr>
                                        <td><%= j %></td>
                                        <td><%= usrloginlist[k].login_id %></td>
                                           <td><%= usrloginlist[k].company_name %></td>
                                         <td><%= usrloginlist[k].comapny_email %></td>
                                      
                                         <td> 
                                                         <a href="User-Setting?Edit=<%= usrloginlist[k].rec_id %>"> <i class="fa fa-edit" aria-hidden="true"></i> </a> 
                                       <a href="User-Setting?Del=<%= usrloginlist[k].rec_id %>"> <i class="fa fa-trash" aria-hidden="true"></i> </a>   
                                          
</td>
                                    </tr>

                                        <%}
    } %>
                                    
                                      
                                    </tbody>
                                </table>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
                            </div>
                        </div>
                    </div>

  

                <uc1:foot runat="server" id="foot" />
    </form>
</body>
</html>
