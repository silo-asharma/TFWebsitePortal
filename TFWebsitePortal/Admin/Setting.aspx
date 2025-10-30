<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Setting.aspx.cs" Inherits="Extuent.Admin.Setting" %>
<%@ Register Src="~/Admin/UC/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/Admin/UC/foot.ascx" TagPrefix="uc1" TagName="foot" %>
<%@ Register Src="~/Admin/UC/header.ascx" TagPrefix="uc1" TagName="header" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
       <uc1:header runat="server" id="header" />
    <script src="assets/js/jquery.js"></script>
      <style>
input[type="checkbox"]:checked:after {
    width: 1rem;
    height: 1rem;
    display: block;
    content: "\f00c";
    font-family: 'FontAwesome';
    color: #fff;
    font-weight: 100;
    font-size: 12px;
    text-align: center;
    border-radius: 3px;
    line-height: 12px;
    background: #FE634E;
}
          .logincolor{
              border: 1px solid !important;
              border-color:#FF6700 !important;
              text-align:left;
              
              padding: 10px 10px !important;
          }
          .txtborderradius {

              border-radius:0rem !important;
              background-color:lightgray;
              height:35px;
              color:#000000;
          }
          .tdsize {
            
              padding: 10px 10px !important;
          }

          
        .switch {
            position: relative;
            display: inline-block;
            width: 60px;
            height: 34px;
        }

        .switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }

        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            -webkit-transition: .4s;
            transition: .4s;
            height: 25px;
        }

        .slider:before {
            position: absolute;
            content: "";
            height: 18px;
            width: 18px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            -webkit-transition: .4s;
            transition: .4s;
        }

        .switch input:checked+.slider {
            background-color: #2196F3;
        }

        .switch input:focus+.slider {
            box-shadow: 0 0 1px #2196F3;
        }

        .switch input:checked+.slider:before {
            -webkit-transform: translateX(26px);
            -ms-transform: translateX(26px);
            transform: translateX(26px);
        }

        /* Rounded sliders */
        .slider.round {
            border-radius: 34px;
        }

        .slider.round:before {
            border-radius: 50%;
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
				
                
                <!-- row -->
                <div class="row">
                    <div class="col-xl-12 col-xxl-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Manage Users</h4>
                            </div>
                            <div class="card-body">
							<div class="row">
												<div class="col-12">
													<div class="skip-email text-center">
														<table class="table mb-0 logincolor">
                                    <thead>
                                    <tr style="background-color:#FF6700;color:white;">
                                      <%--  <th>S.No.</th>--%>
                                        <td class="tdsize">User Id</td>
                                        <td class="tdsize">Name</td>
                                        <td class="tdsize">Email</td>
                                        <td class="tdsize">Start Date</td>
                                        <th class="tdsize"></th>
                                       
                                 
                                      
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
                                    <tr class="logincolor">
                                        
                                        <td class="logincolor"><%= usrloginlist[k].userName %></td>
                                           <td class="logincolor"><%= usrloginlist[k].Name %></td>
                                         <td class="logincolor"><%= usrloginlist[k].email %></td>
                                         <td class="logincolor"><%= Convert.ToDateTime(usrloginlist[k].doc).ToString("dd/MM/yyyy")  %></td>
                                         <td class="logincolor"> 
                                                         <a href="User-Setting?Edit=<%= usrloginlist[k].id %>"> <i class="fa fa-edit" aria-hidden="true"></i> </a> 
                                       <a href="User-Setting?Del=<%= usrloginlist[k].id %>"> <i class="fa fa-trash" aria-hidden="true"></i> </a>   
                                          
</td>
                                    </tr>

                                        <%}
    } %>
                                    
                                      
                                    </tbody>
                                </table>
													</div>
												</div>
											</div>
                                                

                                                <div>
                                                    <br />
                                                    
                                                    
                                                    <table style="width: 100%;padding:5px;">
                                                        <tr>
                                                            <td colspan="3"><span style="color:black">Fill out the required details to add a new user</span></td>
                                                            <td colspan="2">
                                                                   <span style="color:black;float:right"> Email Notification
                                                                  <label class="switch">
                                                        <asp:CheckBox ID="rdoemail" runat="server" Checked="true" />


                                                        <span class="slider round"></span>
                                                    </label>
                                                                   </span> 
                                                             </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="padding:5px;width:50px !important"><span style="color:black">Full Name</span>      </td>
                                                             <td style="padding:5px;width:40%"><input type="text" class="form-control txtborderradius" id="txtname"  runat="server" required></td>
                                                             <td style="padding:5px;width:10%">
                                                                  <span style="color:black">Designation</span>  
                                                                 </td>
                                                             <td style="padding:5px;width:40%">
                                                                 <input type="text" class="form-control txtborderradius" id="txtDesignation"  runat="server" required>
                                                                </td>
                                                        </tr>
                                                      
                                                        <tr>
                                                           <td style="padding:5px;width:50px !important"><span style="color:black">User ID</span>      </td>
                                                             <td style="padding:5px;width:40%"><input type="text" class="form-control txtborderradius" id="txtuserid"  runat="server" required></td>
                                                             <td style="padding:5px;width:10%">
                                                                  <span style="color:black">Password</span>  
                                                                 </td>
                                                             <td style="padding:5px;width:40%">
                                                                 <input type="Password" class="form-control txtborderradius" id="txtpassword"  runat="server" required>
                                                                </td> 

                                                        </tr>
                                                        <tr>
                                                            <td style="padding:5px;width:50px !important">
                                                                   <span style="color:black">Email</span> 
                                                               </td>
                                                              <td style="padding:5px;">
                                                                  <input type="text" class="form-control txtborderradius" id="txtemail"  runat="server" required>
                                                                   </td>
                                                            <td style="padding:5px;">
                                                                  <span style="color:black">Phone No</span>  
                                                                 </td>
                                                             <td style="padding:5px;">
                                                                
                                                                 <input type="text" class="form-control txtborderradius" id="txtPhone" runat="server" required />

                                                              
                                                                </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="padding:5px;width:50px !important"> <span style="color:black">Location</span> 
                                                                </td>
                                                            <td style="padding:5px;"><input type="text" class="form-control txtborderradius" id="txtLocation"  runat="server" required /></td>
                                                             <td style="padding:5px;">
                                                                  <span style="color:black">Role</span>  
                                                                 </td>
                                                            <td style="padding:5px;">

                                                                <asp:DropDownList ID="ddlRole" runat="server" class="form-control txtborderradius">
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                              <td style="width: 45%;padding:5px;width:50px !important">
                                                                  <span style="color:black"></span> 
                                                                  
                                                                  </td>
                                                              <td style="width: 10%;padding:5px;">  </td>
                                                              <td style="padding:5px;">
                                                                  <span style="color:black"></span>  
                                                                 </td>
                                                            <td style="width: 45%;padding:5px;">
                                                               
                                                                  <input type="Password" class="form-control txtborderradius" id="EmailPassword"  runat="server" required visible="false">
                                                                </td>

                                                        </tr>
                                                        <tr>


                    
                                                           
                                                            <td colspan="5">
                                                                
                                                                <center>
                                                                <asp:Button ID="btnAdd" runat="server" Text="Add User" class="bg-orange" Style="width: 280px; border-color: #FF7416; color: white; border-radius: 12px; height: 35px" UseSubmitBehavior="false" OnClick="btnAdd_Click" />
                                                                <asp:Button ID="btnUpdate" runat="server" Text="Update User Information" class="bg-orange" Style="width: 280px; border-color: #FF7416; color: white; border-radius: 12px; height: 35px" UseSubmitBehavior="false" Visible="false" OnClick="btnUpdate_Click1" />
                                                                </center>



                                                            </td>
                                                        </tr>

                                                    </table>
                                                  
                                                    
                                                    
                                                    
												
												
												
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
