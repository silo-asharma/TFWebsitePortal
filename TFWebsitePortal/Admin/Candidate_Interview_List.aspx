<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Candidate_Interview_List.aspx.cs" Inherits="Extuent.Admin.Candidate_Interview_List" EnableEventValidation="false"%>

<%@ Register Src="~/Admin/UC/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/Admin/UC/foot.ascx" TagPrefix="uc1" TagName="foot" %>
<%@ Register Src="~/Admin/UC/header.ascx" TagPrefix="uc1" TagName="header" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<%--       <script src="assets/js/jquery.js"></script>--%>
   
<%--    <script src="assets/js/chart-project.js"></script>--%>
    <uc1:header runat="server" id="header" />

    <script>
        function redir(rec)
        {
           // alert(rec)

            window.location.href = URLDisplay + "admin/candidate-profile?vid=" + rec;

        }

    </script>
   <script type="text/javascript">
    window.onload = function () {
        // Dropdown ClientIDs to watch
        const dropdownIds = [
            '<%= ddlResult.ClientID %>',
            '<%= ddlCategory.ClientID %>',
            '<%= ddlAllJob.ClientID %>',
            '<%= ddlDescStatus.ClientID %>',
            '<%= ddlCountry.ClientID %>'
        ];

        const hiddenField = document.getElementById('<%= hdnCheckRecId.ClientID %>');

        // Clear hidden field when any dropdown value changes
        dropdownIds.forEach(function (id) {
            const dropdown = document.getElementById(id);
            if (dropdown) {
                dropdown.addEventListener('change', function () {
                    hiddenField.value = '';
                });
            }
        });

        // Also add input event listener for txtSearch
        const searchBox = document.getElementById('<%= txtSearch.ClientID %>');
        if (searchBox) {
            searchBox.addEventListener('input', function () {
                hiddenField.value = '';
            });
        }
    };
</script>


     <script>
function showpanel() {
    // Get the hidden field reference
    var hiddenField = document.getElementById('<%= hdnCheckRecId.ClientID %>');
    
    // Get current values as array (split by "-")
    var existingValues = hiddenField.value ? hiddenField.value.split('-') : [];

    var checkboxes = document.querySelectorAll('input[type="checkbox"]'); // Get all checkboxes (checked and unchecked)

    // Loop through all checkboxes
    for (var checkbox of checkboxes) {
        if (checkbox.checked) {
            // If checked, add the value to the list if not already present
            if (!existingValues.includes(checkbox.value)) {
                existingValues.push(checkbox.value);
            }
        } else {
            // If unchecked, remove the value from the list
            var index = existingValues.indexOf(checkbox.value);
            if (index !== -1) {
                existingValues.splice(index, 1);
            }
        }
    }

    // Remove any empty string entries and rejoin
    hiddenField.value = existingValues.filter(Boolean).join('-');

    //alert("Last checked: " + (checkboxes.length > 0 ? checkboxes[checkboxes.length - 1].value : 'None'));
   // alert("Combined value: " + hiddenField.value);
}


         
         function showpanel1()
         {
             var temp = 0;
             var valchk=<%= candidateLoginList.Count %>;
             for (var i = 1; i <= valchk; i++) {

                 if (temp == 0) {
                     if (document.getElementById("chkReviewded1" + i).checked == true) {

                         document.getElementById("chkReviewded1" + i).checked = false;
                         temp=0;
                     }
                     else {
                         document.getElementById("chkReviewded1" + i).checked = true;
                         temp=1;
                     }
                 }
                 else
                     document.getElementById("chkReviewded1" + i).checked = true;
             }



             //alert();
             document.getElementById('<%= hdnCheckRecId.ClientID %>').value = "";
             document.getElementById('<%= hdnCheckRecId.ClientID %>').innerText="";
             var checkboxes = document.querySelectorAll('input[type="checkbox"]:checked');
             for (var checkbox of checkboxes) {
                 //document.body.append(checkbox.value + ' ');
             
                 
                 document.getElementById('<%= hdnCheckRecId.ClientID %>').value = document.getElementById('<%= hdnCheckRecId.ClientID %>').value + '-' + checkbox.value;
             }
            //alert(   document.getElementById('<%= hdnCheckRecId.ClientID %>').value);
           //  alert(document.getElementById('<%= hdnCheckRecId.ClientID %>').innerText);
             //var url = "http://localhost:60242/admin/Email-Send?emailhidden=" +document.getElementById('<%= hdnCheckRecId.ClientID %>').innerText + "";
             //alert(url);
          //   url_redirect(url);
             // document.getElementById('<%= btnHdf.ClientID %>').click();
           //  return false;
             
         }
         </script>

      <link rel="stylesheet" type="text/css" href="css_ext/style.css">
 
    
    <script type="text/javascript">
        function Search_Gridview(strKey, strGV) {
            var strData = strKey.value.toLowerCase().split(" ");
            var tblData = document.getElementById(strGV);
            var rowData;
            for (var i = 1; i < tblData.rows.length; i++) {
                rowData = tblData.rows[i].innerHTML;
                var styleDisplay = 'none';
                for (var j = 0; j < strData.length; j++) {
                    if (rowData.toLowerCase().indexOf(strData[j]) >= 0)
                        styleDisplay = '';
                    else {
                        styleDisplay = 'none';
                        break;
                    }
                }
                tblData.rows[i].style.display = styleDisplay;
            }


            event.preventDefault();
        }
    </script>
 <link href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">  
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>  
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script> 
    <script>  
$(function() {  
$("#tooltip-1").tooltip();  
$("#tooltip-2").tooltip();  
});  
</script>  
    <style>
        .pagination .page-item .page-link {
    background: #fff;
    font-weight: 600;
}
        input[type="checkbox"]:after {
    content: '';
    display: block;
     margin-top: 0px; 
     margin-left: 0px; 
    border: 1px solid #a1a1a1;
    border-radius: 3px;
    background: #ffffff;
    line-height: 1.3;
}

input[type="checkbox"]:checked:after {
  
   display: block;
    content: "\f00c";
    font-family: 'FontAwesome';
    color: #fff;
    font-weight: 100;
    font-size: 15px;
    line-height: 25px;
    text-align: center;
    border-radius: 3px;
    background: #FE634E;
   
}
    </style>
</head>
<body>
  <form id="form1" runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server">

    </asp:ScriptManager>
        <uc1:head runat="server" ID="head" />

        
        <!--**********************************
            Content body start
        ***********************************-->
            <!--**********************************
            Content body start
        ***********************************-->
      


        <div class="content-body" style="margin-top:45px;padding-top:45px;">
            <!-- row -->
            <div class="container-fluid" style="margin-top:0px;padding-top:0px;">
                <!-- Add Order -->
                <div class="row">
                    <div class="col-xl-12 col-xxl-12">
                        <div class="row">
                        <div class="col-md-8 " style="font-size:14px;"><br />All: <%= All %> &nbsp;&nbsp;&nbsp;&nbsp; In Process: <%= In_ProcessAll %> &nbsp;&nbsp;&nbsp;&nbsp;Pending: <%= PendingAll %>  &nbsp;&nbsp;&nbsp;&nbsp;Pass: <%= pass %> &nbsp;&nbsp;&nbsp;&nbsp;Rejected: <%= rejected %> &nbsp;&nbsp;&nbsp;&nbsp;On Hold: <%= onhold %><%= sval %>  &nbsp;&nbsp;&nbsp;&nbsp;Hired: <%= hired %><%= sval %>
                                    
                        </div> 
                            <div class="col-md-4 " style="text-align:right;">
                                <asp:TextBox ID="txtSearch" class="form-control" runat="server" OnTextChanged="txtSearch_TextChanged" AutoPostBack="true" placeholder="Search.."   Font-Size="Small"></asp:TextBox>
                           
                              
                            </div>
                        </div>
                    </div>
                </div>
                <hr />
                <div class="row">

                                
                    
                        <div class="col-xl-12 col-xxl-12">
                               <div class="row">
                              <div class="col-md-5" style="height:40px;font-size:14px;">
                                    <table style="width:100%;" >
                        <tr style="width:100%;">
                          
                         
                         
                            <td style="width:70%;text-align: left;">
                                
                                   
                                  <%--  <img src="images/icon_list.png" alt="" width="192">--%>
                                       <asp:Button ID="Button9" runat="server"  ValidationGroup="V1"  style="background-image: url(images/open-profile_New.png);background-color:transparent;background-size: cover;border:none;background-repeat:no-repeat;width:30px;height:30px" OnClick="Button9_Click"   />
                                       <asp:Button ID="btnSendProfile" runat="server"  style="background-image: url(images/share_New_2.png);background-color:transparent;background-repeat:no-repeat;background-size: cover;border:none;width:30px;height:30px"  usesubmitbehavior="false" OnClick="btnSendProfile_Click"  />
                                       <asp:Button ID="Button2" runat="server"  style="background-image: url(images/icon_mail_New.png);background-color:transparent;background-repeat:no-repeat;background-size: cover;border:none;width:30px;height:30px"  usesubmitbehavior="false" OnClick="Button2_Click1"  />
                             
                                     <asp:Button ID="Button1" runat="server"  style="background-image: url(images/delete_New.png);background-color:transparent;background-repeat:no-repeat;border:none;background-size: cover;width:30px;height:30px" usesubmitbehavior="false" OnClick="Button1_Click"  />
                                    

                                <input id="chkReviewded2" type="checkbox" onclick="showpanel1()" class="chknew"  style="width:25px;height:25px;" />

                            </td>
                               <td style="width:20%;"></td>
                              <td colspan="3" style="width:10%;"> </td>
                        </tr>
                    </table>



                              </div>
                                <div class="col-md-7 d-flex justify-content-between align-items-center" style="height:40px;">

                                     <div style="font-size:14px;> <span id="spanStartVal" runat="server">1</span>-<span id="spanLastVal" runat="server">15</span> of <span id="SpanTotalPage" runat="server">15</span></div>
        <div >
           
            <ul class="pagination pagination-xs" style="background:#bfbfbf26;">
                <li class="page-item page-indicator" >
                    <asp:Button runat="server" ID="btnlinkFirst" CssClass="page-link" Text="|<" Font-Size="20px" OnClick="btnlinkFirst_Click"/>
                   
                </li>
                
                <li class="page-item"><asp:Button runat="server" ID="btnlinkPrev" CssClass="page-link" Text="<" Font-Size="20px" OnClick="btnlinkPrev_Click"/></li>
                <li class="page-item"><asp:Button runat="server" ID="btnlinkNext" CssClass="page-link" Text=">" Font-Size="20px" OnClick="btnlinkNext_Click"/></li>
               
                  
                <li class="page-item page-indicator">
                          <asp:Button runat="server" ID="btnlinkLast" CssClass="page-link"  Text=">|" Font-Size="20px" OnClick="btnlinkLast_Click"/>
                 
                </li>
            </ul>
        </div>
                                    

                                    </div>
                            <div class="col-md-12 mt-3">
                                <div class="orangeline"></div>

                                </div>
                            </div>

                          <%--<b>
                              <input class="form-control" runat="server" id="headdisplay" type="label"  ></b>  
                           <center>    <img src="./images/line1.png" alt=""></center>--%>
                            </div>
                           
                  



                        
                  
                        <div class="col-xl-12 col-xxl-12">
                             <label></label><br />
                            <div class="row">
                              
                                <div class="col-xl-3 col-md-3" style="padding:1px;">
                                    <asp:DropDownList ID="ddlCategory" runat="server" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" ForeColor="#808080" Font-Size="13px">
                                    
                                         
                                            
                                        </asp:DropDownList>    
                                            
                                  
                                </div>
                                <div class="col-xl-3 col-md-3" style="padding:1px;">
                                       <asp:DropDownList ID="ddlAllJob" runat="server" class="form-control" placeholder="Listed Jobs" AutoPostBack="true" OnSelectedIndexChanged="Button2_Click" ForeColor="#808080" Font-Size="13px">
                                           <asp:ListItem Value="">Job Ttile</asp:ListItem>
                                               
                                        </asp:DropDownList>
                                  
                                </div>
                                <div class="col-xl-2 col-md-2" style="padding:1px;">

                                     <asp:DropDownList ID="ddlResult" runat="server" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="Button2_Click" ForeColor="#808080" Font-Size="13px">
                                             <asp:ListItem Value="0">Application Status</asp:ListItem>
                                             <asp:ListItem Value="Completed">Completed</asp:ListItem>
                                               <asp:ListItem Value="Pending">In Process</asp:ListItem>
                                               <%--<asp:ListItem Value="On Hold">On Hold</asp:ListItem>
                                               <asp:ListItem Value="Shortlisted">Shortlisted</asp:ListItem>
                                              <asp:ListItem Value="Rejected">Rejected</asp:ListItem>--%>
                                        </asp:DropDownList>
                                    
                                </div>
                                <div class="col-xl-2 col-md-2" style="padding:1px;">
                                    <asp:DropDownList ID="ddlDescStatus" runat="server" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="Button2_Click" ForeColor="#808080" Font-Size="13px">
                                             <asp:ListItem Value="0">Decision Status</asp:ListItem>
                                        <asp:ListItem Value="Followup">Follow up </asp:ListItem>
                                          <asp:ListItem Value="Pending">Pending</asp:ListItem>
                                          <asp:ListItem Value="Pass">Pass</asp:ListItem>
                                               <asp:ListItem Value="Hold">On Hold</asp:ListItem>
                                               <asp:ListItem Value="Reject">Reject</asp:ListItem>
                                        <asp:ListItem Value="Hired">Hired</asp:ListItem>
                                  </asp:DropDownList>
                                </div>
                                <div class="col-xl-2 col-md-2" style="padding:1px;">
                                     <asp:DropDownList ID="ddlCountry" runat="server" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="Button2_Click" ForeColor="#808080" Font-Size="13px">
                                             <asp:ListItem Value="0">Countries</asp:ListItem>
                                        <asp:ListItem Value="Philippines">Philippines</asp:ListItem>
                                          <asp:ListItem Value="India">India</asp:ListItem>
                                          <asp:ListItem Value="USA">United States</asp:ListItem>
                                            
                                  </asp:DropDownList>
                               
                                   <%-- &nbsp;<asp:Button ID="Button2" runat="server" Text="search" style="background-image:border:none;width:45px;height:45px" usesubmitbehavior="false" OnClick="Button2_Click"  />--%>
                                </div>
                              
                            </div>
                        </div>
                       
                    </div>
                <div class="col-xl-12 col-xxl-12">
                    <br />
                    <asp:Label ID="lblalertMessage" runat="server" ForeColor="Red" Text="" Font-Size="14px"></asp:Label><div class="resume" id="expe1" style="color:red;font-size:14px;">Some recordings are not available for sharing. Kindly check the share indicator.</div>
                  
                    </div>
                  

                <div class="main-container">
   
        <!-- start page-heading -->
        
        <!-- end page-heading -->
        <!-- start candidate-profiles -->
        <div class="candidate-profiles">
            <% if(candidateLoginList.Count==0){ %>

            <div class="row"> <h4>No Data Found </h4>  </div>

            <%} %>

            <div class="row">
                  <%
                      int j=0;
                      int g = -1;
                      string imageURL = "";
                      string ratting = "0";
                      string cirval="0";
                      string res = "Pending";
                      string stat = "Pending";
                      bool returnisVideo=false;
                      string returnquery = "";
                      string history="";

                    string[] MultiplePage = hdnCheckRecId.Value.Split('-');
                    int countVideoPage = 0;
                    string cNamePage = "";
                    int ReqIdPageSide=0;

                      for (int k = 0; k < candidateLoginList.Count; k++)
                      {
                          history="";
                          j = j + 1;

                          {


                              imageURL =ImageDisplay+candidateLoginList[k].candidate_profile_pic_url ;
                              ratting = calculaterating(candidateLoginList[k].rec_id.ToString());
                              cirval = Convert.ToString((Convert.ToDouble(ratting)*2)/10);
                              if (candidateLoginList[k].result == "" || candidateLoginList[k].result == null)
                              {
                                  res = "Pending";
                              }
                              else if (candidateLoginList[k].result == "Followup")
                              {
                                      res="<span style='color:Green;'>In<span style='color:white;font-size:4px'>_</span>Process</span>";
                              }
                              else
                                  res = candidateLoginList[k].result;

                              if (candidateLoginList[k].status == "Pending")
                              {
                                  stat = "In Process";
                                  if (candidateLoginList[k].result == "" || candidateLoginList[k].result == null)
                                  {
                                      res = "In<span style='color:white;font-size:4px'>_</span>Process";
                                  }
                                  else if (candidateLoginList[k].result == "Followup")
                                  {
                                        res="<span style='color:Green;'>In<span style='color:white;font-size:4px'>_</span>Process</span>";
                                  }
                                  else
                                      res = candidateLoginList[k].result;
                              }
                              else
                                  stat= candidateLoginList[k].status;

                              returnisVideo=getVideoConverstion(candidateLoginList[k].rec_id);

                              returnquery=backqueryString();



                      history ="Profile of "+candidateLoginList[k].name+" shared.. ";
                       history +="Profile of "+candidateLoginList[k].name+" retake.. Thanks";
                     

                    cNamePage="NotChecked";
                    foreach (string multiple_email1 in MultiplePage)
                    {
                        if (multiple_email1 != "" && multiple_email1 != "on")
                        {
                            ReqIdPageSide = Convert.ToInt32(multiple_email1);
                            if(ReqIdPageSide==candidateLoginList[k].rec_id)
                                cNamePage="Checked";
                            
                      }
                   }
                                                     %>

                <div class="col-md-6 col-xl-4">
                    <!-- start column -->
                    <div class="candidate-column">
                        <div class="row">
                            <div class="col-3">
                                <div class="imgb">
                                    <img src="<%= imageURL %>" width="399" height="189" alt="candidate">
                                </div>            
                            </div>
                            <div class="col-9">
                                <div class="txt">
                                   <a id="tooltip-<%= k %>" href="#" title="<%= history %>"> <h4><%= candidateLoginList[k].name %>&nbsp;<%= candidateLoginList[k].last_name %></h4></a>
                                    <p><%= getJobName(candidateLoginList[k].job_apply_id.ToString()) %></p>
                                    <p>Application Status: <span class="status"><%= stat %></span></p>
                                </div>
                                <!-- start icon-list -->
                                <div class="icon-list">
                                    <div class="icon">
                                        <a href="candidate-profile?vid=<%= candidateLoginList[k].rec_id %>&&edit=true<%= returnquery %>" title="edit"><img src="../images/icon_edit.png" width="33" height="33" alt="edit"></a>
                                    </div>
                                    <div class="icon">
                                        <% if(returnisVideo==true){ %>
                                        <a href="Email-Send?emailhidden=-<%= candidateLoginList[k].rec_id %><%= returnquery %>" title="share"><img src="../images/icon_share_green.png" width="33" height="33" alt="share"></a>
                                        <%} else{ %>
                                        <a href="#expe1" title="share"><img src="../images/icon_share_red.png" width="33" height="33" alt="share"></a>
                                        <%}  %>
                                    </div>
                                    <div class="icon">
                                        <a href="candidate-interview-list?type=Back&&del=<%= candidateLoginList[k].rec_id %><%= returnquery %>" title="delete"><img src="../images/icon_delete.png" width="33" height="33" alt="delete"></a>
                                    </div>
                                     <div class="icon">
                                        <a href="Email-Send?emailRetake=<%= candidateLoginList[k].rec_id %><%= returnquery %>" title="retake"><img src="../images/retake_admin.png" width="33" height="33" alt="share"></a>
                                    </div>
                                    <div class="icon">
                                        <% if(cNamePage=="Checked"){ %>
                                          <input id="chkReviewded1<%= j %>" type="checkbox" onclick="showpanel()"  value="<%= candidateLoginList[k].rec_id %>" checked/>
                                        <%} else { %>
                                           <input id="chkReviewded1<%= j %>" type="checkbox" onclick="showpanel()"  value="<%= candidateLoginList[k].rec_id %>"/>
                                        <%} %>
                                    </div>
                                </div>
                                <!-- end icon-list -->
                            </div>
                        </div>
                        <!-- start bottom-bar -->
                        <div class="bottom-bar">
                            <div class="row align-items-center">
                                <div class="col-3">
                                    <!-- start progress-bar -->
                                   <div class="profile-progress1">
                                        <div class="circle" data-value="<%= cirval %> ">
                                            <p><%= ratting %> </p>
                                        </div>
                                    </div>
                                    <!-- end progress-bar -->
                                    <span class="progress-status"><%= res %></span>
                                </div>
                                <div class="col-9">
                                    <a href="candidate-profile?vid=<%= candidateLoginList[k].rec_id %><%= returnquery %>" title="Watch" class="btn-outline">Watch</a>
                                    <span><%= Convert.ToDateTime(candidateLoginList[k].doc).ToString("MMM dd, yyyy") %></span>
                                    <div class="txt">
                                        <p><%= candidateLoginList[k].email %></p>
                                        <p><%= candidateLoginList[k].mobile_no %></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end bottom-bar -->
                    </div>
                    <!-- start column -->
                    <!-- start column -->
                    
                    <!-- end column -->
                </div>
                             <%}} %>
            </div>
        </div>
        <!-- end candidate-profiles -->
        <!-- start page-pagination -->
                    <div class="row">
                        <div class="col-md-5" style="height: 40px;">
                        </div>
                        <div class="col-md-7" style="height: 40px;">

                            <div style="font-size:14px;"><span id="spanbottomFirstval" runat="server">1</span>-<span id="spanbottomLastval" runat="server">15</span> of <span id="spanbottomTotalval" runat="server">15</span></div>
                            <div style="text-align: right; float: right; margin-top: -36px;">

                                <ul class="pagination pagination-xs" style="background: #bfbfbf26;">
                                    <li class="page-item page-indicator">
                                        <asp:Button runat="server" ID="btnBottomFirstVal" CssClass="page-link" Text="|<" Font-Size="20px"  OnClick="btnlinkFirst_Click" />

                                    </li>

                                    <li class="page-item">
                                        <asp:Button runat="server" ID="Button4" CssClass="page-link" Text="<" Font-Size="20px" OnClick="btnlinkPrev_Click" /></li>
                                    <li class="page-item">
                                        <asp:Button runat="server" ID="Button5" CssClass="page-link" Text=">" Font-Size="20px" OnClick="btnlinkNext_Click" /></li>


                                    <li class="page-item page-indicator">
                                        <asp:Button runat="server" ID="Button6" CssClass="page-link" Text=">|" Font-Size="20px" OnClick="btnlinkLast_Click" />

                                    </li>
                                </ul>
                            </div>


                        </div>
                    </div>
        <!-- end page-pagination -->
  
</div>

                    

                </div>
                        </div>



      











      <span id="spanPage" runat="server" style="color:white;font-size:1px">1</span><span id="spanpageSize" runat="server" style="color:transparent;font-size:1px">15</span>






 <!-- Main content end here -->
        <div  style="display: none;">
                <asp:Button ID="btnHdf" runat="server" Text="submit" OnClick="btnEdit_Click" usesubmitbehavior="false"/>
        <asp:HiddenField ID="hdnCheckRecId" runat="server" />
              </div>
        <uc1:foot runat="server" id="foot" />
      <script src="../js/circle-progress.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function () {

            /* Menu */
          

            jQuery('.circle').circleProgress({
                startAngle: 4.6,
                reverse: false,
                size: "115",
                thickness: "10",
                fill: {
                    color: "#f06000"
                }
            });

        });
    </script>
      <script type="text/javascript">
          jQuery(document).ready(function($) {
              $('.resume').hide()
             
$('a[href^="#"]').on('click', function(event) {
    $('#ddlAllJob').focus();
    $('#lblalertMessage').hide();
    $('.resume').show();
    
  
});
    });
      </script>
    </form>
</body>
</html>
