<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_Skills.aspx.cs" Inherits="Extuent.SuperAdmin.Add_Skills" %>
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
				
                <span>&nbsp; Skills Library</span><hr />
                <!-- row -->
                <div class="row">
                    <div class="col-xl-12 col-xxl-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Skills</h4>
                            </div>
                            <div class="card-body">
							
                                                

                                                <div>
                                                    
                                                    
                                                   
                                                    
                                                    <table style="width: 100%">

                                                        <tr>

                                                            <td style="width: 90%">
                                                                    <asp:TextBox ID="txtCat" runat="server" class="form-control" placeholder="Enter Category Name"></asp:TextBox>
                                                              
                                                         
                                                            </td>
                                                        
                                                            <td style="width: 10%;text-align:center;">

                                                              &nbsp;  <asp:Button ID="btnAdd" runat="server" Text="Add"   usesubmitbehavior="false" OnClick="btnAdd_Click" class="bg-orange" style="width: 90%; border-color: #FF7416; color: white; border-radius: 12px; height: 35px;margin-top:18%"/>
						           &nbsp; <asp:Button ID="btnUpdate" runat="server" Text="Update"  usesubmitbehavior="false" Visible="false" OnClick="btnUpdate_Click" class="bg-orange" style="width: 90%; border-color: #FF7416; color: white; border-radius: 12px; height: 35px;"/>
							
                                                              

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
                                        <td>Name</td>
                                        <th></th>
                                       
                                 
                                      
                                    </tr>
                                    </thead>
                                    <tbody>
                                      <%
                                          int j=0;
                                          int g = -1;
                                          for (int k = 0; k < categoryList.Count; k++)
                                          {
                                              j = j + 1;
                                           
                                              {  %>
                                    <tr>
                                        <td><%= j %></td>
                                        <td><%= categoryList[k].skill_name %></td>
                                     
                     
                                      
                                         <td> 
                                             <a href="add-skills?Edit=<%= categoryList[k].id %>">  <i class="fa fa-edit" aria-hidden="true"></i>  </a>    
                                      <a href="add-skills?Del=<%= categoryList[k].id %>">  <i class="fa fa-trash" aria-hidden="true"></i> </a>
                                        
                                          
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
