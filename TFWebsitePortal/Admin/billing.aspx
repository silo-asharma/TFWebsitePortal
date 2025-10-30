<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="billing.aspx.cs" Inherits="Extuent.Admin.billing" %>

<%@ Register Src="~/Admin/UC/header.ascx" TagPrefix="uc1" TagName="header" %>
<%@ Register Src="~/Admin/UC/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/Admin/UC/foot.ascx" TagPrefix="uc1" TagName="foot" %>




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
        .tblbakground {
            width: 100%;
          
           
        }

    </style>
    <script>
         
        function getMonthName(doc)
        {
            var objDate =  new Date(doc).toLocaleString('en-us',{month:'short', year:'numeric'})

            return objDate;
        }

    </script>
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
                                <table style="width: 100%;padding:5px;">
                                                        <tr>
                                                            <td style="padding:15px;">
                                                                <span style="color:black;font-size:18px;">Current Plan</span>  

                                                            </td>
                                                             <td style="padding:5px;width:300px;">
                                                                  <asp:DropDownList ID="ddlPlanName" runat="server" class="form-control txtborderradius">
                                                                      <asp:ListItem>BASIC</asp:ListItem>
                                                                       <asp:ListItem>Standard</asp:ListItem>
                                                                       <asp:ListItem>PREMIUM</asp:ListItem>
                                                                </asp:DropDownList>
                                                             </td>
                                                            <td style="padding:5px;"><span style="color:black">Sign Up Date</span></td>
                                                            <td>       <input type="text" class="form-control txtborderradius" id="txtdateofjoin" value="1 July 2023" runat="server" required></td>
                                                        </tr>
                                    </table>

                                <br />
                              
                                <span style="color:black;padding:15px;font-size:18px;">Usage History</span>
                                <br />
                                <div class="col-12">
													<div class="skip-email text-center">
														<table class="table mb-0 logincolor">
                                    <thead>
                                    <tr style="background-color:#FF6700;color:white;">
                                      <%--  <th>S.No.</th>--%>
                                        <td class="tdsize">Month</td>
                                        <td class="tdsize"># of Minutes</td>
                                        <td class="tdsize">Minutes Used</td>
                                        <td class="tdsize">Payment Status</td>
                                        <td class="tdsize">Payment Due</td>
                                        <td class="tdsize">Paid On</td>
                                   
                                 
                                      
                                    </tr>
                                    </thead>
                                    <tbody>
                                     <%--   <tr class="logincolor">
                                   
                                        <td class="logincolor">July</td>
                                        <td class="logincolor">500</td>
                                        <td class="logincolor"></td>
                                        <td class="logincolor">Free</td>
                                        <td class="logincolor"></td>
                                        <td class="logincolor"></td>
                                      
                                       
                                 
                                      
                                    </tr>--%>

                                      <%
                                          int j=0;
                                          int g = -1;
                                          string planMinutes = "500";
                                          string planName = "BASIC";
                                          string PlanPaymentDue = "";
                                          string PaidOn = "";
                                          for (int k = 0; k < usrloginlist.Count; k++)
                                          {
                                              j = j + 1;

                                              int emplRecId = Convert.ToInt32(usrloginlist[k].employer_rec_id);
                                              paymenthistory = context.employer_payment_history.Where(c => c.employer_recid == emplRecId).FirstOrDefault();
                                              if (paymenthistory != null)
                                              {
                                                  PlanPaymentDue = Convert.ToString(paymenthistory.paymnet_due);
                                                  PaidOn = Convert.ToString(paymenthistory.payment_date);


                                                  websitePlans = context.website_plan_master.Where(c => c.rec_id == context.employer_plan_details.Where(d => d.employer_rec_id == emplRecId).FirstOrDefault().plan_master_recId).FirstOrDefault();
                                                  if (websitePlans != null)
                                                  {
                                                      planName = websitePlans.plan_name;
                                                      planMinutes = websitePlans.recording_minutes;


                                                  }
                                              }

                                              {  %>
                                    <tr class="logincolor">
                                        
                                        <td class="logincolor"><%= getMonthName(usrloginlist[k].doc.ToString()) %></td>
                                           <td class="logincolor"><%= planMinutes %></td>
                                         <td class="logincolor"><%= getTotalUsedMinjtes(usrloginlist[k].employer_rec_id.ToString()) %></td>
                                         <td class="logincolor"><%= planName %></td>
                                        <td class="logincolor"><%= PlanPaymentDue %></td>
                                        <td class="logincolor"><%= PaidOn %></td>
                                   
                                    </tr>

                                        <%}
    } %>
                                    
                                      
                                    </tbody>
                                </table>
                                                        <br />
                                                        <table class="tblbakground">
                                                            <tr>
                                                                <td colspan="2">
                                                                    <img src="images/grey-button.png" />
                                                                </td>
                                                                <td colspan="1">
                                                                    <asp:RadioButton Checked="true" ID="paymnetrue" runat="server" Font-Size="Large" Text="Pay By Card"></asp:RadioButton>

                                                                </td>
                                                                <td colspan="4">
                                                                    <img src="images/card-icons.png" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                      <%--  <img  src="images/payment_image.png" style="width:100%;height:70px;" />--%>
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
