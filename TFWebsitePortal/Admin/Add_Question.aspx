<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_Question.aspx.cs" Inherits="Extuent.Admin.Add_Question" EnableEventValidation="false"%>
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
            <div class="container-fluid">
				<!-- Add Order -->
				
                <span>&nbsp;</span>
             <%--   <center><asp:Label ID="lblerrormsg" runat="server" Text="" ForeColor="Red"></asp:Label></center>--%>
                <hr />
                <!-- row -->
                <div class="row">
                    <div class="col-xl-12 col-xxl-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Question Library</h4>
                            </div>
                            <div class="card-body">
							
                                                

                                                <div>
                                                    
                                                    <table style="width: 100%">

                                                        <tr>


                                                            <td style="width: 700px">
                                                                
                                                                



                                                            </td>
                                                            <td style="width: 700px">
                                                                 <asp:DropDownList ID="ddlLiveJob" Visible="false" runat="server" class="form-control default-select" AutoPostBack="true" OnSelectedIndexChanged="ddlLiveJob_SelectedIndexChanged">
                                    
                                            
                                        </asp:DropDownList>
                                                                



                                                            </td>
                                                        </tr>

                                                    </table>
                                                   
                                                    
                                                    <table style="width: 100%">
                                                         <tr>
                                                             <td style="width: 100%" colspan="2">
                                                                  <asp:DropDownList ID="ddlCategory" runat="server"  class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
                                            
                                        </asp:DropDownList>
                                                                  <br />
                                                    <br />
                                                    
                                                                 </td>
                                                             </tr>
                                                        <tr>

                                                            <td style="width: 3000px">
                                                                <asp:TextBox ID="txtquestiondesc" runat="server" TextMode="MultiLine" class="form-control" required></asp:TextBox>
                                                         
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
                                        <td>Question </td>
                                        <th></th>
                                       
                                 
                                      
                                    </tr>
                                    </thead>
                                    <tbody>
                                      <%
                                          int j=0;
                                          int g = -1;
                                          string returnval = "0";
                                          for (int k = 0; k < QuestionList.Count; k++)
                                          {
                                              j = j + 1;

                                              returnval = isused(Convert.ToString(QuestionList[k].id));

                                              {  %>
                                    <tr>
                                        <td><%= j %></td>
                                        <td><%= QuestionList[k].question %></td>
                                     
                     
                                      
                                         <td> 
                                             <% if (returnval == "1")
                                                 { %>
                                             <span style="font-size:9px;color:red">In-use</span>
                                             <%}
    else
    { %>
                                               <a href="add-question?Edit=<%= QuestionList[k].id %>"> <i class="fa fa-edit" aria-hidden="true"></i> </a>   
                                      <a href="add-question?Del=<%= QuestionList[k].id %>">  <i class="fa fa-trash" aria-hidden="true">  </i> </a> 
                                          <%} %>
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
