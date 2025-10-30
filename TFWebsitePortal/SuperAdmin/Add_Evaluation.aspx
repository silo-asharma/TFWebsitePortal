<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_Evaluation.aspx.cs" Inherits="Extuent.SuperAdmin.Add_Evaluation" EnableEventValidation="false"%>
<%@ Register Src="~/SuperAdmin/UC/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/SuperAdmin/UC/foot.ascx" TagPrefix="uc1" TagName="foot" %>
<%@ Register Src="~/SuperAdmin/UC/header.ascx" TagPrefix="uc1" TagName="header" %>
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
            <div class="container-fluid">
				<!-- Add Order -->
				
                <span>&nbsp;Evaluation Library</span><hr />
                <!-- row -->
                <div class="row">
                    <div class="col-xl-12 col-xxl-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Evaluation</h4>
                            </div>
                            <div class="card-body">
							
                                                

                                                <div>
                                                    
                                                    <table style="width: 100%">

                                                        <tr>


                                                            <td style="width: 700px">
                                                                 <asp:DropDownList ID="ddlCategory" runat="server"  class="form-control default-select" AutoPostBack="true" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" Visible="false">
                                            
                                        </asp:DropDownList>
                                                                



                                                            </td>
                                                            <td style="width: 700px">
                                                                 <asp:DropDownList ID="ddlLiveJob" runat="server" class="form-control default-select" Visible="false">
                                    
                                            
                                        </asp:DropDownList>
                                                                



                                                            </td>
                                                        </tr>

                                                    </table>
                                                
                                                    
                                                    
                                                    <table style="width: 100%">

                                                        <tr>

                                                            <td style="width: 3000px">
                                                                <asp:TextBox ID="txtquestiondesc" runat="server" TextMode="MultiLine" class="form-control"></asp:TextBox>
                                                         
                                                            </td>

                                                            <td style="width: 100px">
                                                                 <asp:Button ID="btnAdd" runat="server" Text="Add" class="bg-orange" style="width: 80px; border-color: #FF7416; color: white; border-radius: 12px; height: 35px" usesubmitbehavior="false" OnClick="btnAdd_Click"/>
								                                <asp:Button ID="btnUpdate" runat="server" Text="Update" class="bg-orange" style="width: 80px; border-color: #FF7416; color: white; border-radius: 12px; height: 35px" usesubmitbehavior="false" Visible="false" OnClick="btnUpdate_Click"/>
								

                                                            </td>
                                                        </tr>
                                                    </table>
												
												
												
                                        </div>
										

											<div class="row">
												<div class="col-12">
													<div class="skip-email">
														<table class="table mb-0">
                                    <thead>
                                    <tr>
                                        <th>S.No.</th>
                                        <td>Evaluation </td>
                                        <th></th>
                                       
                                 
                                      
                                    </tr>
                                    </thead>
                                    <tbody>
                                      <%
                                          int j=0;
                                          int g = -1;
                                          for (int k = 0; k < QuestionList.Count; k++)
                                          {
                                              j = j + 1;
                                           
                                              {  %>
                                    <tr>
                                        <td><%= j %></td>
                                        <td><%= QuestionList[k].evaluation_name %></td>
                                     
                     
                                      
                                         <td> 
                                               <a href="add-evaluation?Edit=<%= QuestionList[k].id %>"> <i class="fa fa-edit" aria-hidden="true"></i> </a>   
                                      <a href="add-evaluation?Del=<%= QuestionList[k].id %>">  <i class="fa fa-trash" aria-hidden="true">  </i> </a> 
                                          
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
