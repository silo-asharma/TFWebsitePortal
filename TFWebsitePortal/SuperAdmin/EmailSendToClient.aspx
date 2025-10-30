<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmailSendToClient.aspx.cs" Inherits="Extuent.Admin.EmailSendToClient" %>
<%@ Register Src="~/Admin/UC/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/Admin/UC/foot.ascx" TagPrefix="uc1" TagName="foot" %>
<%@ Register Src="~/Admin/UC/header.ascx" TagPrefix="uc1" TagName="header" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <script src="assets/js/jquery.js"></script>
   
    <script src="assets/js/chart-project.js"></script>
    <uc1:header runat="server" id="header" />
</head>
<body>
    <form id="form1" runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server">

    </asp:ScriptManager>
        <uc1:head runat="server" ID="head" />

         <div class="content-body">
            <!-- row -->
            <div class="container-fluid">
                <!-- Add Order -->
              <div class="col-xl-12 col-xxl-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Send Email</h4>
                            </div>
                            <div class="card-body">

                                <h6 class="card-title border-bottom-with-margin">Send Email</h6>
						
									<div class="form-group">
								
                                        <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="Please enter Email Id"></asp:TextBox>
								
									</div>
									
									<asp:Button ID="btnSendEmail" runat="server" Text="Send Email" class="theme btn btn-primary"  usesubmitbehavior="false" OnClick="btnAdd_Click"/>
						         
							
                                </div>
                            </div>
                  </div>
                



                </div>
             </div>





                <uc1:foot runat="server" id="foot" />
    </form>
</body>
</html>
