<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="company-details.aspx.cs" Inherits="Extuent.SuperAdmin.company_details" %>

<%@ Register Src="~/SuperAdmin/UC/header.ascx" TagPrefix="uc1" TagName="header" %>
<%@ Register Src="~/SuperAdmin/UC/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/SuperAdmin/UC/foot.ascx" TagPrefix="uc1" TagName="foot" %>




<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <uc1:header runat="server" ID="header" />

     <style>
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

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <uc1:head runat="server" ID="head" />
     <div class="content-body">
            <div class="container-fluid">
				<!-- Add Order -->
				
           
                <!-- row -->
                <div class="row">
                    <div class="col-xl-12 col-xxl-12">
                        <div class="card">
                       
                            <div class="card-body">
                                <table style="width: 100%;padding:5px;margin-left:25px;margin-right:20px;">
                                    <tr>
                                        <td style="padding: 5px;"><span style="color:black;">Company Name</span></td>
                                        <td style="padding: 5px;">
                                            <input type="text" class="form-control txtborderradius" id="txtCompanyName" placeholder="Extuent" runat="server" required></td>
                                        <td style="padding: 5px;"><span style="color:black;">Domain</span></td>
                                        <td style="padding: 5px;">
                                            <input type="text" class="form-control txtborderradius" id="txtDomain" placeholder="@extuent.com" runat="server" required></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px;"><span style="color:black;">Plan</span></td>
                                        <td style="padding: 5px;">
                                            <input type="text" class="form-control txtborderradius" id="txtPlan" placeholder="Standard" runat="server" required></td>
                                        <td style="padding: 5px;"><span style="color:black;">Start Date</span></td>
                                        <td style="padding: 5px;">
                                            <input type="text" class="form-control txtborderradius" id="txtStartDate" placeholder="July 11 2022" runat="server" required></td>
                                   </tr>
                                      <tr>
                                        <td style="padding: 5px;"><span style="color:black;">Last Activity Date</span></td>
                                        <td style="padding: 5px;">
                                            <input type="text" class="form-control txtborderradius" id="txtLastACtivity" placeholder="July 21 2023" runat="server" required></td>
                                        <td style="padding: 5px;"><span style="color:black;">Minutes</span></td>
                                        <td style="padding: 5px;">
                                            <input type="text" class="form-control txtborderradius" id="txtMinutes" placeholder="1800" runat="server" required></td>
                                   </tr>
                                    </table>
                                <br />
							<div class="row">
												<div class="col-12">
													<div class="skip-email text-left">
                                                         <span style="color:black;padding:15px;font-size:16px;font-weight:bold">Users</span><span><img src="images/downarrow.png"/></span>
														<table class="table mb-0">
                                    <thead>
                                    <tr style="background-color:#FF6700;color:white;">
                                        <th class="tdsize">Status</th>
                                        <td class="tdsize">Name</td>
                                        <td class="tdsize">Email</td>
                                        <td class="tdsize">Start Date</td>
                                       
                                    </tr>
                                    </thead>
                                    <tbody>
                                      <%
                                          //int j=0;
                                          //int g = -1;
                                          for (int k = 0; k < usrloginlist.Count; k++)
                                          {
                                             // j = j + 1;
                                           
                                              {  %>
                                    <tr>
                                     <%--   <td><%= j %></td>--%>
                                        <td class="logincolor"><%= usrloginlist[k].active %></td>
                                           <td class="logincolor"><%= usrloginlist[k].Name %></td>
                                         <td class="logincolor"><%= usrloginlist[k].email %></td>
                                       <td class="logincolor"><%= Convert.ToDateTime(usrloginlist[k].doc).ToString("dd/MM/yyyy") %></td>
                                       
                                    </tr>

                                        <%}
    } %>
                                    
                                      
                                    </tbody>
                                </table>
													</div>
												</div>
											</div>
                                <br />
                                <div class="row">
												<div class="col-12">
													<div class="skip-email text-left">
                                                         <span style="color:black;padding:15px;font-size:16px;font-weight:bold">Jobs</span><span><img src="images/downarrow.png"/></span>
														<table class="table mb-0">
                                    <thead>
                                    <tr style="background-color:#FF6700;color:white;">
                                        <th class="tdsize">Job Name</th>
                                        <td class="tdsize">Status</td>
                                        <td class="tdsize"># of Interviews</td>
                                        <td class="tdsize">Start Date</td>
                                       
                                    </tr>
                                    </thead>
                                    <tbody>
                                      <%
                                          // int j=0;
                                          // int g = -1;
                                          string interviewcount = "0";
                                          for (int k = 0; k < jobpostList.Count; k++)
                                          {
                                              // j = j + 1;

                                              {  %>
                                    <tr>
                                     <%--   <td><%= j %></td>--%>
                                        <td class="logincolor"><%= jobpostList[k].job_title %></td>
                                           <td class="logincolor"><%= jobpostList[k].short_jobdesc %></td>
                                         <td class="logincolor"><%= interviewcount %></td>
                                       <td class="logincolor"><%= Convert.ToDateTime(jobpostList[k].doc).ToString("dd/MM/yyyy") %></td>
                                       
                                    </tr>

                                        <%}
    } %>
                                    
                                      
                                    </tbody>
                                </table>
													</div>
												</div>
											</div>
                                <br />
                                <div class="row">
												<div class="col-12">
													<div class="skip-email text-left">
                                                         <span style="color:black;padding:15px;font-size:16px;font-weight:bold">Minutes</span><span><img src="images/downarrow.png"/></span>
														<table class="table mb-0">
                                    <thead>
                                    <tr style="background-color:#FF6700;color:white;">
                                        <th class="tdsize">Month</th>
                                        <td class="tdsize"># of Minutes</td>
                                        <td class="tdsize">Payment Status</td>
                                        <td class="tdsize">Payment Due</td>
                                       <td class="tdsize">Paid On</td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                      <%
                                          //int j=0;
                                          // int g = -1;
                                          string planMinutes = "500";
                                          string planName = "BASIC";
                                          string PlanPaymentDue = "";
                                          string PaidOn = "";
                                          string PaymentStatus = "Free";
                                          for (int k = 0; k < emppaymentList.Count; k++)
                                          {
                                              //  j = j + 1;

                                              {  %>
                                    <tr>
                                     <%--   <td><%= j %></td>--%>
                                        <td class="logincolor"><%= getMonthName( emppaymentList[k].doc.ToString()) %></td>
                                           <td class="logincolor"><%= planMinutes %></td>
                                         <td class="logincolor"><%= PaymentStatus %></td>
                                       <td class="logincolor"><%= PlanPaymentDue %></td>
                                         <td class="logincolor"><%= PaidOn %></td>
                                         
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
        <uc1:foot runat="server" ID="foot" />
    </form>
</body>
</html>
