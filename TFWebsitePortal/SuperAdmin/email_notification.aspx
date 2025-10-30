<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="email_notification.aspx.cs" Inherits="Extuent.email_notification" %>
<%@ Register Src="~/Admin/UC/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/Admin/UC/foot.ascx" TagPrefix="uc1" TagName="foot" %>
<%@ Register Src="~/Admin/UC/header.ascx" TagPrefix="uc1" TagName="header" %>
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
				
                <span>&nbsp;Email Notification Setting</span><hr />
                <!-- row -->
                <div class="row">
                    <div class="col-xl-12 col-xxl-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title"> </h4>
                            </div>
                            <div class="card-body">
							
                                                

                                                <div>
                                                    
                                                    <table style="width: 100%;padding:5px;">
                                                        <tr>
                                                            <td style="padding:5px;">
                                                                 <asp:DropDownList ID="ddlEmailType" runat="server" class="form-control default-select" AutoPostBack="true" OnSelectedIndexChanged="ddlEmailType_SelectedIndexChanged">
                                                                </asp:DropDownList></td>
                                                             <td style="padding:5px;">&nbsp;</td>
                                                            <td style="padding:5px;">
                                                                 <asp:DropDownList ID="EmailSendIn" runat="server" class="form-control default-select">
                                                                     <asp:ListItem Value="0">Select</asp:ListItem>
                                                                     <asp:ListItem Value="12 Hours">12 Hours</asp:ListItem>
                                                                     <asp:ListItem Value="24 Hours">24 Hours</asp:ListItem>
                                                                     <asp:ListItem Value="48 Hours">48 Hours</asp:ListItem>
                                                                </asp:DropDownList></td>
                                                        </tr>
                                                       
                                                        <tr>


                                                            <td style="width: 45%;padding:5px;">
                                                               
                                                             

                                                          </td>
                                                            <td style="width: 10%;padding:5px;">&nbsp;</td>
                                                            <td style="width: 45%;padding:5px;">
                                                               

                                                                <asp:Button ID="btnAdd" runat="server" Text="Save" class="bg-orange" Style="width: 80px; border-color: #FF7416; color: white; border-radius: 12px; height: 35px" UseSubmitBehavior="false" OnClick="btnUpdate_Click1" />
                                                                <asp:Button ID="btnUpdate" runat="server" Text="Update" class="bg-orange" Style="width: 80px; border-color: #FF7416; color: white; border-radius: 12px; height: 35px" UseSubmitBehavior="false" Visible="false" OnClick="btnUpdate_Click1" />




                                                            </td>
                                                        </tr>

                                                    </table>
                                                  
                                                    
                                                    
                                                    
												
												
												
                                        </div>
										

											<div class="row">
												<div class="col-12">
													<div class="skip-email text-center">
														
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
