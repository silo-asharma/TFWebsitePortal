<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="email_notification.aspx.cs" Inherits="Extuent.email_notification" validateRequest="false" EnableEventValidation="false" %>
<%@ Register Src="~/Admin/UC/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/Admin/UC/foot.ascx" TagPrefix="uc1" TagName="foot" %>
<%@ Register Src="~/Admin/UC/header.ascx" TagPrefix="uc1" TagName="header" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v22.1, Version=22.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v22.1, Version=22.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v22.1, Version=22.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title></title>
       <uc1:header runat="server" id="header" />
    <script src="assets/js/jquery.js"></script>

      <script src="//cdn.ckeditor.com/4.20.1/standard/ckeditor.js"></script>
    <style>
.accordion {
  background-color: #eee;
  color: #4e5764;
  cursor: pointer;
  padding: 14px;
  width: 100%;
  border: none;
  text-align: left;
  outline: none;
  font-size: 16px;
  transition: 0.4s;
  margin-top:10px;
  font-weight:bold;

}

.active, .accordion:hover {
  background-color: #ccc; 
}

.panel {
  padding: 0 18px;
  display: none;
  background-color: white;
  overflow: hidden;
}
.accordion:after {
  content: '\1F589'; /* Unicode character for "plus" sign (+) */
  font-size: 16px;
  color: #011633;
  float: right;
  margin-left: 5px;
}

.active:after {
  content: "\2796"; /* Unicode character for "minus" sign (-) */
}
</style>
</head>
<body>
    <form id="form1" runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server">

    </asp:ScriptManager>
        <uc1:head runat="server" ID="head" />

        <div class="content-body">
            <div class="container-fluid" style="margin-top:0px;padding-top:0px;">
				
                <div class="row">
                    <div class="col-xl-12 col-xxl-12">
                        <div class="card">
                            
                            <div class="card-body" style="display:none">
							
                                                

                                                <div>
                                                    
                                                    <table style="width: 100%;padding:5px;">
                                                        <tr>
                                                            <td style="padding:5px;">
                                                                 <asp:DropDownList ID="ddlEmailType" runat="server" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEmailType_SelectedIndexChanged">
                                                                </asp:DropDownList></td>
                                                             <td style="padding:5px;">&nbsp;</td>
                                                            <td style="padding:5px;">
                                                                 <asp:DropDownList ID="EmailSendIn" runat="server" class="form-control" Visible="false">
                                                                 
                                                                     <asp:ListItem Value="Immediate">Immediate</asp:ListItem>
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
                                                               

                                                                


                                                            </td>
                                                        </tr>
                                                        <tr  style="width: 100%;padding:5px;">
                                                            <td style="width: 100%;padding:5px;" colspan="2">
                                                              
                                                                <span>Email Subject</span>
                                     	<input type="text" class="form-control" id="txtemailSubject"  placeholder="" runat="server" style="color:#B1B1B1;width:100%">



                                                            </td>
                                                        </tr>

                                                    </table>
                                                  
                                                    
                                                    
                                                    
												
												
												
                                        </div>
										

											<div class="row">
												<div class="col-12">
													<div class="skip-email text-left">
														 
                                                              <span>Email Body Content</span>
<asp:TextBox ID="text" runat="server" TextMode="MultiLine"></asp:TextBox>
 <script>
     CKEDITOR.replace("text");
 </script> 

                                                             <br />
                                                             <span>Email Signature</span>
                                                             <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine"></asp:TextBox>
 <script>
     CKEDITOR.replace("TextBox1");
 </script> 

                                                             <br />
                                                        <center>
                                                             <asp:Button ID="btnAdd" runat="server" Text="Save" class="bg-orange" Style="width: 80px; border-color: #FF7416; color: white; border-radius: 12px; height: 35px" UseSubmitBehavior="false" OnClick="btnUpdate_Click1" />
                                                                <asp:Button ID="btnUpdate" runat="server" Text="Update" class="bg-orange" Style="width: 80px; border-color: #FF7416; color: white; border-radius: 12px; height: 35px" UseSubmitBehavior="false" Visible="false" OnClick="btnUpdate_Click1" />


                                </center>
													</div>
												</div>
											</div>
										</div>


                            <div class="card-body">
                                <button class="accordion">Profile Completion </button>
                                <div class="panel">
                                    <div>
                                        <br />
                                        <span id="profilesubject" runat="server"></span><br /><br />
                                        <span id="profiledetails" runat="server"></span><br />
                                        <span id="profiledetailsentry" runat="server"></span><br />


                                        <span><b>Email Content</b></span>
                                        <asp:TextBox ID="txtProfileCompletion" runat="server" TextMode="MultiLine"></asp:TextBox>
                                        <script>
                                            CKEDITOR.replace("txtProfileCompletion");
                                        </script>
                                        
                                        <%--<span>Email Signature </span>
                                        <asp:TextBox ID="txtPemailsign" runat="server" TextMode="MultiLine"></asp:TextBox>
                                        <script>
                                            CKEDITOR.replace("txtPemailsign");
                                        </script>--%>

                                        <span></span><br />
                                        <span></span>
                                     
                                    </div>
                                     <center>
                                        <div>
                                            <asp:Button ID="Button1" runat="server" OnClick="btnUpdate_Click1" Text="Update Email Template" class="bg-orange" style="width: 280px; border-color: #FF7416; color: white; border-radius: 12px; height: 35px" usesubmitbehavior="false" />
								                                
                                            </div>
                                      </center>
                                </div>
                                <br />
                                <button class="accordion">Application Completion Email</button>
                                <div class="panel">
                                   <div>
                                        <span id="Applicationsubject" runat="server"></span><br /><br />
                                        <span id="Applicationdetails" runat="server"></span><br />
                                        <span id="Applicationdetailsentry" runat="server"></span><br />


                                        <span>Email Content</span>
                                        <asp:TextBox ID="txtApplicationCompletionemail"  runat="server" TextMode="MultiLine"></asp:TextBox>
                                        <script>
                                            CKEDITOR.replace("txtApplicationCompletionemail");
                                        </script>

                                        <span></span><br />
                                        <span></span>
                                     
                                    </div>
                                 <center>
                                        <div>
                                            <asp:Button ID="btnApplication" runat="server" OnClick="btnApplication_Click" Text="Update Email Template" class="bg-orange" style="width: 280px; border-color: #FF7416; color: white; border-radius: 12px; height: 35px" usesubmitbehavior="false" />
								                                
                                            </div>
                                      </center>
                                </div>
                                <br />
                                <button class="accordion">Interview Completion Reminder</button>
                                <div class="panel">
                                  <div>
                                       <span id="InterviewCompletesubject" runat="server"></span><br /><br />
                                        <span id="InterviewCompetedetails" runat="server"></span><br />
                                        <span id="InterviewCompletedetailsentry" runat="server"></span><br />



                                        <span>Email Content</span>
                                        <asp:TextBox ID="txtInterview" runat="server" TextMode="MultiLine"></asp:TextBox>
                                        <script>
                                            CKEDITOR.replace("txtInterview");
                                        </script>

                                        <span></span><br />
                                        <span></span>
                                     
                                    </div>
                                     <center>
                                        <div>
                                            <asp:Button ID="btnInterViewComletion" runat="server" OnClick="btnInterViewComletion_Click" Text="Update Email Template" class="bg-orange" style="width: 280px; border-color: #FF7416; color: white; border-radius: 12px; height: 35px" usesubmitbehavior="false" />
								                                
                                            </div>
                                      </center>
                                       </div>
                                 <br />
                                <button class="accordion">Share Candidate Profile</button>
                                <div class="panel">
                                       <div>
                                        <span id="Shareprofilesubject" runat="server"></span><br /><br />
                                        <span id="Shareprofiledetails" runat="server"></span><br />
                                        <span id="Shareprofiledetailsentry" runat="server"></span><br />



                                        <span>Email Content</span>
                                        <asp:TextBox ID="txtShare" runat="server" TextMode="MultiLine"></asp:TextBox>
                                        <script>
                                            CKEDITOR.replace("txtShare");
                                        </script>

                                        <span></span><br />
                                        <span></span>
                                     
                                    </div>
                                     <center>
                                        <div>
                                            <asp:Button ID="btnShareProfile" runat="server" OnClick="btnShareProfile_Click" Text="Update Email Template" class="bg-orange" style="width: 280px; border-color: #FF7416; color: white; border-radius: 12px; height: 35px" usesubmitbehavior="false" />
								                                
                                            </div>
                                      </center>
                                </div>
                                <button class="accordion">Retake Email</button>
                                <div class="panel">
                                      <div>
                                        <span id="RetakeSubject" runat="server"></span><br /><br />
                                        <span id="Retakedetails" runat="server"></span><br />
                                        <span id="Retakedetailsentry" runat="server"></span><br />



                                        <span>Email Content</span>
                                        <asp:TextBox ID="txtRetake" runat="server" TextMode="MultiLine"></asp:TextBox>
                                        <script>
                                            CKEDITOR.replace("txtRetake");
                                        </script>

                                        <span></span><br />
                                        <span></span>
                                     
                                    </div>
                                     <center>
                                        <div>
                                            <asp:Button ID="btnRetake" runat="server" OnClick="btnRetake_Click" Text="Update Email Template" class="bg-orange" style="width: 280px; border-color: #FF7416; color: white; border-radius: 12px; height: 35px" usesubmitbehavior="false" />
								                                
                                            </div>
                                      </center>
                                      </div>
                                <button class="accordion">Share Job Email</button>
                                <div class="panel">
                                     <div>
                                       <span id="ShareJobSubject" runat="server"></span><br /><br />
                                        <span id="ShareJobdetails" runat="server"></span><br />
                                        <span id="ShareJobdetailsentry" runat="server"></span><br />



                                        <span>Email Content</span>
                                        <asp:TextBox ID="txtsharejob" runat="server" TextMode="MultiLine"></asp:TextBox>
                                        <script>
                                            CKEDITOR.replace("txtsharejob");
                                        </script>

                                        <span></span><br />
                                        <span></span>
                                     
                                    </div>
                                     <center>
                                        <div>
                                            <asp:Button ID="btnShaeJob" runat="server" OnClick="btnShaeJob_Click" Text="Update Email Template" class="bg-orange" style="width: 280px; border-color: #FF7416; color: white; border-radius: 12px; height: 35px" usesubmitbehavior="false" />
								                                
                                            </div>
                                      </center>
                                      </div>
                                <button class="accordion">New User</button>
                                <div class="panel">
                                    <div>
                                       <span id="NewUsersubject" runat="server"></span><br /><br />
                                        <span id="NewUserdetails" runat="server"></span><br />
                                        <span id="NewUserdetailsentry" runat="server"></span><br />



                                        <span>Email Content</span>
                                        <asp:TextBox ID="txtNewUser" runat="server" TextMode="MultiLine"></asp:TextBox>
                                        <script>
                                            CKEDITOR.replace("txtNewUser");
                                        </script>

                                        <span></span><br />
                                        <span></span>
                                     
                                    </div>   
                                     <center>
                                        <div>
                                            <asp:Button ID="btnNewUser" runat="server" OnClick="btnNewUser_Click" Text="Update Email Template" class="bg-orange" style="width: 280px; border-color: #FF7416; color: white; border-radius: 12px; height: 35px" usesubmitbehavior="false" />
								                                
                                            </div>
                                      </center>

                                </div>
                                <br />
                                
                            </div>
									</div>
								</div>
                            </div>
                        </div>
                    </div>

  

                <uc1:foot runat="server" id="foot" />
        <script>
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.display === "block") {
      panel.style.display = "none";
    } else {
      panel.style.display = "block";
    }
    event.preventDefault();
  });
}
</script>
    </form>
</body>
</html>
