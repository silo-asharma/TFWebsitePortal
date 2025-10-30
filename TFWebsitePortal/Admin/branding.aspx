<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="branding.aspx.cs" Inherits="Extuent.Admin.branding" %>

<%@ Register Src="~/Admin/UC/header.ascx" TagPrefix="uc1" TagName="header" %>
<%@ Register Src="~/Admin/UC/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/Admin/UC/foot.ascx" TagPrefix="uc1" TagName="foot" %>




<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <uc1:header runat="server" ID="header" />
    <style>
        .tblbox {
         width:250px;
         height:100px;
         background-color:#FF7416;
         padding:50px;
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
    </style>
     <style>
    .mainImages
    {
      position: relative;
      top: 0;
      left: 0;
    }
    .topright
    {
      position: absolute;
      top: 10px;
      left: 150px;
    }
     .topleft
    {
      position: absolute;
      top: 10px;
      left: 10px;
    }
      .bottomleft
    {
      position: absolute;
      top: 130px;
      left: 10px;
    }
       .bottomright
    {
      position: absolute;
      top: 130px;
      left: 150px;
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
                                <div id="divvlaues" runat="server">
                                <table style="width: 100%;padding:5px;">
                                                        
                                                        <tr>
                                                            <td style="padding:5px;width:50px !important"><span style="color:black">Company Name</span>      </td>
                                                             <td style="padding:5px;width:40%"> <input type="text" class="form-control txtborderradius" id="txtcompanyName"  runat="server" required></td>
                                                             <td style="padding:5px;width:10%">
                                                        
                                                                 </td>
                                                           </tr>
                                                           <tr>
                                                               <td colspan="3">To be used in email notifications to candidates as part of the signature and in the subject line.</td>
                                                           </tr>
                                                          <tr>
                                                            <td style="padding:5px;width:50px !important"><span style="color:black">Upload HD Background Image</span>      </td>
                                                             <td style="padding:5px;width:40%"><asp:FileUpload ID="FileUpload1" runat="server" onchange="readURL(this);"/></td>
                                                             <td style="padding:5px;width:10%">
                                                        
                                                                 </td>
                                                           </tr>
                                                            <tr>
                                                            <td style="padding:5px;width:50px !important"><span style="color:black">Upload HD Logo Image</span>      </td>
                                                             <td style="padding:5px;width:40%"><asp:FileUpload ID="FileUpload2" runat="server" onchange="readURL2(this);"/></td>
                                                             <td style="padding:5px;width:10%">
                                                        
                                                                 </td>
                                                           </tr>
                                                            <tr>
                                                            <td style="padding:5px;width:50px !important"><span style="color:black">Select logo Placement</span>      </td>
                                                             <td style="padding:5px;width:40%"> <asp:DropDownList ID="ddlPlanName" runat="server" class="form-control txtborderradius">
                                                                      <asp:ListItem>Top Right</asp:ListItem>
                                                                      <asp:ListItem>Top Left</asp:ListItem>
                                                                      <asp:ListItem>Bottom Left</asp:ListItem>
                                                                      <asp:ListItem>Bottom Right</asp:ListItem>
                                                                </asp:DropDownList></td>
                                                             <td style="padding:5px;width:10%">
                                                        
                                                                 </td>
                                                           </tr>
                                    </table>
                                <table>
                                    <tr>
                                        <td colspan="7">
                                            <table style="width: 100%;padding:5px;margin-top:40px;margin-left:20px;">
                                                <tr>
                                                    <td>
                                                        <div style="position: relative; left: 0; top: 0;">
                                                            <img src="images/bg18_logo.jpg" id="imageResult1" width="215" height="190" alt="profile picture" class="mainImages">
                                                            <img src="images/favicon.png" id="imageResult2" width="50" height="50" alt="profile picture" class="topright">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div style="position: relative; left: 0; top: 0;">
                                                            <img src="images/bg18_logo.jpg" id="imageResult11" width="215" height="190" alt="profile picture" class="mainImages">
                                                            <img src="images/favicon.png" id="imageResult21" width="50" height="50" alt="profile picture" class="topleft">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div style="position: relative; left: 0; top: 0;">
                                                            <img src="images/bg18_logo.jpg" id="imageResult12" width="215" height="190" alt="profile picture" class="mainImages">
                                                            <img src="images/favicon.png" id="imageResult22" width="50" height="50" alt="profile picture" class="bottomleft">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div style="position: relative; left: 0; top: 0;">
                                                            <img src="images/bg18_logo.jpg" id="imageResult13" width="215" height="190" alt="profile picture" class="mainImages">
                                                            <img src="images/favicon.png" id="imageResult23" width="50" height="50" alt="profile picture" class="bottomright">
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                            
                                            
                                            
                                           
                                             <span class="imgb">
                                               
                                            </span>
                                            <img src="images/brandingimages.png"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="7">
                                            <center>
                                              <div>
                                                <asp:Button ID="btnAdd" runat="server" Text="Change Background" class="bg-orange" style="width: 280px; border-color: #FF7416; color: white; border-radius: 12px; height: 35px" usesubmitbehavior="false" OnClick="btnAdd_Click"/>
								                                
                                              </div>
                                            </center>
                                        </td>
                                    </tr>
                                    <tr style="visibility:hidden">
                                        <td class="tblbox"><div style="height:50px;width:50px;background-color:#ffd800;margin-top:5px;margin-bottom:100px;margin-left:180px;"></div></td>
                                        <td style="width:10px;"></td>
                                         <td class="tblbox"></td>
                                         <td style="width:10px;"></td>
                                         <td class="tblbox"></td>
                                         <td style="width:10px;"></td>
                                         <td class="tblbox"></td>
                                    </tr>
                                  
                                
                                </table>
                             </div>
                               
                                <div style="display:none" id="divdisplaymessage" runat="server">
                                    <span>
                                        Thank You for submitting the background change request.
                                        Our team will activate the new video background and logo
                                                        within the next 72 hrs. 
                                    </span>
                                    <br />
                                    <span>
                                        Reach out to us at support@extuentai.ai.
                                    </span>
                                </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
       </div>




        <uc1:foot runat="server" ID="foot" />
    </form>
    <script>
       
        

/*  [SHOW UPLOADED IMAGE] */
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
          
            $('#imageResult1')
                .attr('src', e.target.result);
            $('#imageResult11')
                .attr('src', e.target.result);
            $('#imageResult12')
                .attr('src', e.target.result);
            $('#imageResult13')
                .attr('src', e.target.result);
        };
        

        reader.readAsDataURL(input.files[0]);
    }
}
function readURL2(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {

            $('#imageResult2')
                .attr('src', e.target.result);
            $('#imageResult21')
               .attr('src', e.target.result);
            $('#imageResult22')
               .attr('src', e.target.result);
            $('#imageResult23')
               .attr('src', e.target.result);
        };


        reader.readAsDataURL(input.files[0]);
    }
}
$(function () {
    $('#upload').on('change', function () {
        readURL(input);
    });
});
        </script>
</body>
</html>
