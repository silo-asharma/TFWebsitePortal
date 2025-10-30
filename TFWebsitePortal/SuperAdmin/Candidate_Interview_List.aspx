<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Candidate_Interview_List.aspx.cs" Inherits="Extuent.Admin.Candidate_Interview_List" EnableEventValidation="false"%>

<%@ Register Src="~/Admin/UC/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/Admin/UC/foot.ascx" TagPrefix="uc1" TagName="foot" %>
<%@ Register Src="~/Admin/UC/header.ascx" TagPrefix="uc1" TagName="header" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
       <script src="assets/js/jquery.js"></script>
   
    <script src="assets/js/chart-project.js"></script>
    <uc1:header runat="server" id="header" />

    <script>
        function redir(rec)
        {
            alert(rec)

            window.location.href = "http://localhost:60242/admin/candidate-profile?vid=" + rec;

        }

    </script>
     <script>

         function showpanel()
         {
             //alert();
             document.getElementById('<%= hdnCheckRecId.ClientID %>').value = "";
             document.getElementById('<%= hdnCheckRecId.ClientID %>').innerText="";
             var checkboxes = document.querySelectorAll('input[type="checkbox"]:checked');
             for (var checkbox of checkboxes) {
                 document.body.append(checkbox.value + ' ');
             
                 
                 document.getElementById('<%= hdnCheckRecId.ClientID %>').value = document.getElementById('<%= hdnCheckRecId.ClientID %>').value + '-' + checkbox.value;
             }
           // alert(checkbox.value);
           //  alert(document.getElementById('<%= hdnCheckRecId.ClientID %>').innerText);
             //var url = "http://localhost:60242/admin/Email-Send?emailhidden=" +document.getElementById('<%= hdnCheckRecId.ClientID %>').innerText + "";
             //alert(url);
          //   url_redirect(url);
             // document.getElementById('<%= btnHdf.ClientID %>').click();
           //  return false;
             
         }
         
         function showpanel1()
         {
             var temp = 0;
             for (var i = 1; i <= 4; i++) {

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
                 document.body.append(checkbox.value + ' ');
             
                 
                 document.getElementById('<%= hdnCheckRecId.ClientID %>').value = document.getElementById('<%= hdnCheckRecId.ClientID %>').value + '-' + checkbox.value;
             }
           // alert(checkbox.value);
           //  alert(document.getElementById('<%= hdnCheckRecId.ClientID %>').innerText);
             //var url = "http://localhost:60242/admin/Email-Send?emailhidden=" +document.getElementById('<%= hdnCheckRecId.ClientID %>').innerText + "";
             //alert(url);
          //   url_redirect(url);
             // document.getElementById('<%= btnHdf.ClientID %>').click();
           //  return false;
             
         }
         </script>
    <style media="screen">
  @import url(http://fonts.googleapis.com/css?family=Roboto:400,700,300);



.circle-wrap {
  margin: 20px auto;
  width: 150px;
  height: 150px;
  background: #FFFFFF;
  border-radius: 50%;
  border: 1px solid #cdcbd0;
}

.circle-wrap .circle .mask,
.circle-wrap .circle .fill {
  width: 150px;
  height: 150px;
  position: absolute;
  border-radius: 50%;
}

.circle-wrap .circle .mask {
  clip: rect(0px, 150px, 150px, 75px);
}

.circle-wrap .inside-circle {
  width: 122px;
  height: 122px;
  border-radius: 50%;
  background: #FFFFFF;
  line-height: 120px;
  text-align: center;
  margin-top: 14px;
  margin-left: 14px;
  color: #FE634E;
  position: absolute;
  z-index: 100;
  font-weight: 700;
  font-size: 2em;
}

/* color animation */

/* 3rd progress bar */
.mask .fill {
  clip: rect(0px, 75px, 150px, 0px);
  background-color: #FE634E;
}

.mask.full,
.circle .fill {
  animation: fill ease-in-out 3s;
  transform: rotate(<%= degval %>deg);
}

@keyframes fill{
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(<%= degval %>deg);
  }
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
        <div class="content-body">
            <!-- row -->
            <div class="container-fluid">
                <!-- Add Order -->
                <div class="modal fade" id="addOrderModalside">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Add Event</h5>
                                <button type="button" class="close" data-dismiss="modal">
                                    <span>&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <div class="form-group">
                                        <label class="text-black font-w500">Event Name</label>
                                        <input type="text" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label class="text-black font-w500">Event Date</label>
                                        <input type="date" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label class="text-black font-w500">Description</label>
                                        <input type="text" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <button type="button" class="btn btn-primary">Create</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">

                    <hr />
                    
                        <div class="col-xl-12 col-xxl-12">
                            <input class="form-control" runat="server" id="headdisplay" type="text" placeholder="" readonly>
                          
                            </div>
                           
                    <br />
                    <br />



                        
                  
                        <div class="col-xl-12 col-xxl-12">
                            <br />
                            <br />
                            <div class="row">
                                <div class="col-xl-3 col-md-3">
                                    <asp:DropDownList ID="ddlCategory" runat="server" class="form-control default-select" AutoPostBack="true" OnSelectedIndexChanged="Button2_Click">
                                    
                                         
                                            
                                        </asp:DropDownList>    
                                            
                                  
                                </div>
                                <div class="col-xl-2 col-md-3">
                                       <asp:DropDownList ID="ddlAllJob" runat="server" class="form-control" placeholder="Listed Jobs" AutoPostBack="true" OnSelectedIndexChanged="Button2_Click">
                                           <asp:ListItem Value="">Job Ttile</asp:ListItem>
                                               
                                        </asp:DropDownList>
                                  
                                </div>
                                <div class="col-xl-2 col-md-3">

                                     <asp:DropDownList ID="ddlResult" runat="server" class="form-control default-select" AutoPostBack="true" OnSelectedIndexChanged="Button2_Click">
                                             <asp:ListItem Value="0">Filter By Status</asp:ListItem>
                                             <asp:ListItem Value="All">All</asp:ListItem>
                                               <asp:ListItem Value="Hired">Hired</asp:ListItem>
                                               <asp:ListItem Value="On Hold">On Hold</asp:ListItem>
                                               <asp:ListItem Value="Shortlisted">Shortlisted</asp:ListItem>
                                              <asp:ListItem Value="Rejected">Rejected</asp:ListItem>
                                        </asp:DropDownList>
                                    
                                </div>
                                <div class="col-xl-3 col-md-3">

                                    <select id="inputState" class="form-control default-select">
                                        <option selected>Filter By Assessment</option>
                                        <option>Pass</option>
                                        <option>Fail</option>
                             
                                    </select>
                                </div>
                                <div class="col-xl-2 col-md-3">

                                    <select id="inputState" class="form-control default-select">
                                        <option selected>6 result per page</option>
                                        <option>30 result per page</option>
                                        <option>40 result per page</option>
                                        <option>50 result per page</option>
                                    </select>
                                   <%-- &nbsp;<asp:Button ID="Button2" runat="server" Text="search" style="background-image:border:none;width:45px;height:45px" usesubmitbehavior="false" OnClick="Button2_Click"  />--%>
                                </div>
                              
                            </div>
                        </div>
                        
                    </div>
                <div class="col-xl-12 col-xxl-12">
                    <br />
                    <br />
                    <table style="width:100%;">
                        <tr style="width:100%;">
                            <td style="width:20%;">&nbsp;</td>
                            <td style="width:20%;"></td>
                            <td style="width:20%;"></td>
                            <td style="width:20%;"></td>
                            <td style="width:20%;">
                                
                                   
                                  <%--  <img src="images/icon_list.png" alt="" width="192">--%>
                                      <asp:Button ID="Button9" runat="server"  ValidationGroup="V1"  style="background-image: url(images/open-profile.png);background-repeat:no-repeat;border:none;width:45px;height:45px" OnClick="Button9_Click"   />
                                    <asp:Button ID="btnSendProfile" runat="server"  style="background-image: url(images/share.png);background-repeat:no-repeat;border:none;width:45px;height:45px"  usesubmitbehavior="false" OnClick="btnSendProfile_Click"  />
                             
                                     <asp:Button ID="Button1" runat="server"  style="background-image: url(images/delete.png);background-repeat:no-repeat;border:none;width:45px;height:45px" usesubmitbehavior="false" OnClick="Button1_Click"  />
                                    

                                <input id="chkReviewded2" type="checkbox" onclick="showpanel1()"  style="background-color:gray;color:gray;width:45px;height:45px" />

                            </td>
                        </tr>
                    </table>
                    </div>
                    <br />
                    <br />
                    <div class="row">

                        <div class="col-xl-12 col-xxl-12">
                            <div class="row">
                                   <%
                                            int j=0;
                                            int g = -1;
                                            string imageURL = "";
                                            for (int k = 0; k < candidateLoginList.Count; k++)
                                            {
                                                j = j + 1;

                                                { 
                                                     
                                        
                                                   imageURL ="http://localhost/LiveImages/"+candidateLoginList[k].candidate_profile_pic_url ;
                                                    
                                                     %>



                                <div class="col-xl-3 col-xxl-6 col-lg-3 col-sm-6">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="d-flex align-items-end">
                                                <div>
                                                    <div class="new-arrivals-img-contnent">
                                                       
                                                        <img class="img-fluid" src="<%= imageURL %>">

                                                    </div>




                                                    <table style="width:90%">
                                                        <tr>
                                                            <td style="width:10%">
                                                                <div class="custom-control custom-checkbox mb-3 checkbox-success">
                                                                    <input id="chkReviewded1<%= j %>" type="checkbox" onclick="showpanel()"  value="<%= candidateLoginList[k].rec_id %>" />
                                                            <%--        <label class="custom-control-label" for="customCheckBox3"></label>--%>
                                                                </div>
                                                            </td>
                                                            <td style="width:80%;"><label><%= candidateLoginList[k].name %></label></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width:10%"></td>
                                                            <td style="width:80%"><b style="font-size:medium;"><%= getJobName(candidateLoginList[k].job_apply_id.ToString()) %></b></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width:10%"></td>
                                                            <td style="width:80%"><h6 style="color:dodgerblue;font-size:medium"><%= candidateLoginList[k].email %></h6></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width:10%"></td>
                                                            <td style="width:80%"><h6 style="color:dodgerblue;font-size:medium"><%= candidateLoginList[k].mobile_no %></h6></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width:10%"></td>
                                                            <td style="width:80%"><h4 style="font-size:medium">Status:<span style="color:red"><%= candidateLoginList[k].status %></span></h4></td>
                                                        </tr>
                                                    </table>
                                                    <table style="width:100%">
                                                        <tr>
                                                            <td rowspan="2" style="width:40%"> <div class="circle-wrap">
        <div class="circle">
          <div class="mask full">
            <div class="fill"></div>
          </div>
          <div class="mask half">
            <div class="fill"></div>
          </div>
          <div class="inside-circle"> <%= calculaterating(candidateLoginList[k].rec_id.ToString()) %> </div>
        </div>
      </div></td>
                                                            <td style="width:10%">       </td>
                                                            <td style="width:50%">       </td>
                                                        </tr>
                                                        <tr>
                                                             <td style="width:10%">       </td>
                                                            <td style="width:50%">&nbsp;
                                                             <a href="candidate-profile?vid=<%= candidateLoginList[k].rec_id %>"><i class="fa fa-edit fa-lg"></i></a>&nbsp;
                                                             <a href="Email-Send?emailhidden=-<%= candidateLoginList[k].rec_id %>"> <i class="fa fa-share-alt fa-lg"></i></a>&nbsp;
                                                             
                                                           <a href="candidate-interview-list?type=<%=  Request.QueryString["type"].ToString() %>&&del=<%= candidateLoginList[k].rec_id %>"> <i class="fa fa-trash fa-lg"></i></a>&nbsp;
                                                    
                                                                
                                                                <a href="candidate-profile?vid=<%= candidateLoginList[k].rec_id %>" class="btn btn-primary">Watch</a>
                                                     </td>
                                                        </tr>
                                                    </table>

                                                    <div class="row">
                                                        <div class="col-xl-6 col-md-6">
                                                              

                                                            <%--<img src="images/iconrating.png" alt="" width="92" class="rounded-circle mr-2">--%>
                                                            </div>
                                                        <div class="col-xl-6 col-md-6">
                                                            
                                                            <%--<img src="images/icon_list2.png" alt="" width="92" >--%>
                                                            <br />
                                                            <br />
                                                                  <%--<button type="submit" class="btn btn-primary" onclick="redir('<%= candidateLoginList[k].rec_id %>')"> Watch</button>--%>
                                                        </div>
                                                        </div>


                                                           
                                                            <!--<img src="images/profile/p2.jpg" alt="" width="42" class="rounded-circle mr-2">
                <img src="images/profile/p3.jpg" alt="" width="42" class="rounded-circle mr-2">
                <a href="" class="text-black" style="font-size:10px;">View All</a>-->
                                                            



                                                            <!--<table style="width:100%">
                    <tr>
                        <td style="font-size:11px;"><i class="las la-sms"></i>25 interviews</td>
                        <td style="font-size:11px;text-align:right;"><span class="badge badge-sm light badge-primary"><i class="las la-clock"></i>2 weeks left</span></td>
                    </tr>
                </table>-->
                                                        </div>
                                                        <!--<canvas class="lineChart" id="chart_widget_2" height="85"></canvas>-->
                                                    </div>
                                                </div>
                                    </div>
                                </div>


                                       <%}} %>
                                        


                                
                                
                                

                                
                                
                                
                                

                                <table style="width:100%">
                                    <tr>
                                        <td style="width:40%"></td>
                                        <td style="width:40%">
                                            <div class="card-body" style="text-align:center;">



                                                <center>
                                                    <nav>
                                                        <ul class="pagination pagination-xs">
                                                            <li class="page-item page-indicator">
                                                                <a class="page-link" href="javascript:void(0)">
                                                                    <i class="la la-angle-left"></i>
                                                                </a>
                                                            </li>
                                                            <li class="page-item active">
                                                                <a class="page-link" href="javascript:void(0)">1</a>
                                                            </li>
                                                            <li class="page-item"><a class="page-link" href="javascript:void(0)">2</a></li>
                                                            <li class="page-item"><a class="page-link" href="javascript:void(0)">3</a></li>
                                                            <li class="page-item"><a class="page-link" href="javascript:void(0)">4</a></li>
                                                            <li class="page-item"><a class="page-link" href="javascript:void(0)">5</a></li>
                                                            <li class="page-item"><a class="page-link" href="javascript:void(0)">6</a></li>
                                                            <li class="page-item page-indicator">
                                                                <a class="page-link" href="javascript:void(0)">
                                                                    <i class="la la-angle-right"></i>
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </nav>
                                                </center>
                                            </div>
                                        </td>
                                        <td style="width:20%"></td>
                                    </tr>
                                </table>


                            </div>

                        </div>


                    </div>

                </div>
                        </div>
























 <!-- Main content end here -->
        <div  style="display: none;">
                <asp:Button ID="btnHdf" runat="server" Text="submit" OnClick="btnEdit_Click" usesubmitbehavior="false"/>
        <asp:HiddenField ID="hdnCheckRecId" runat="server" />
              </div>
        <uc1:foot runat="server" id="foot" />
    </form>
</body>
</html>
