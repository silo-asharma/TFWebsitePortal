<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Candidate_Profile.aspx.cs" Inherits="Extuent.Admin.Candidate_Profile" enableEventValidation="false"%>

<!DOCTYPE html>

<%@ Register Src="~/Admin/UC/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/Admin/UC/foot.ascx" TagPrefix="uc1" TagName="foot" %>
<%@ Register Src="~/Admin/UC/header.ascx" TagPrefix="uc1" TagName="header" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <title></title>
    <script src="assets/js/jquery.js"></script>
   
    <script src="assets/js/chart-project.js"></script>
    <uc1:header runat="server" id="header" />

     <style>
         #c2 {
             background-image: url(https://image.freepik.com/free-photo/grey-sofa-simple-living-room-interior-3d-rendering_41470-3898.jpg);
            // background-image: url(D:\Projects Work\All\Extuent--Vijay Sabharwal\ExtuentVideoInterviewPlatform\Extuent Phase 2\ExtuentVIP\Admin\images\grey-sofa-simple.webpjpg);
             background-repeat: no-repeat;
         }
    </style>

    <style>
* {box-sizing: border-box}
body {font-family: "Lato", sans-serif;}

/* Style the tab */
.tab {
   
  float: center;
  border: 1px solid #FF6700;
  background-color: #FF6700;
  border:0px;
  width: 30%;
  height: 450px;
}

/* Style the buttons inside the tab */
.tab button {
  display: block;
  background-color: inherit;
  color: black;
  padding: 22px 16px;
  width: 100%;
  border: none;
  outline: none;
  text-align: left;
  cursor: pointer;
  transition: 0.3s;
  font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
}

/* Create an active/current "tab button" class */
.tab button.active {
  background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
  float: left;
  padding: 0px 12px;
  border: 1px solid #ccc;
  width: 70%;
  border-left: none;
  height: 450px;
}
.video {
object-fit: cover;
aspect-ratio: 16 / 9;
width:100%;

}
</style>
       <script>
           var strating_1;
           var strating_2;
           var strating_3;
           var strating_4;
           var strating_5;
           var rating_string;
           $(document).ready(function () {
             
               $(".fa-star").css("color", "black");
          $("#st1").click(function() {
              $(".g1").css("color", "black");
              $("#st1").css("color", "yellow");
              strating_1 = 1;
              
          });
          $("#st2").click(function() {
              $(".g1").css("color", "black");
              $("#st1, #st2").css("color", "yellow");
              strating_1 = 2;
          });
          $("#st3").click(function() {
              $(".g1").css("color", "black")
              $("#st1, #st2, #st3").css("color", "yellow");
              strating_1 = 3;
          });
          $("#st4").click(function() {
              $(".g1").css("color", "black");
              $("#st1, #st2, #st3, #st4").css("color", "yellow");
              strating_1 = 4;
          });
          $("#st5").click(function() {
              $(".g1").css("color", "black");
              $("#st1, #st2, #st3, #st4, #st5").css("color", "yellow");
              strating_1 = 5;
          });
          $("#st6").click(function () {
              $(".g2").css("color", "black");
              $("#st6").css("color", "yellow");
              strating_2 = 1;
             
          });
          $("#st7").click(function () {
              $(".g2").css("color", "black");
              $("#st6, #st7").css("color", "yellow");
              strating_2 = 2;
          });
          $("#st8").click(function () {
              $(".g2").css("color", "black")
              $("#st6, #st7, #st8").css("color", "yellow");
              strating_2 = 3;
          });
          $("#st9").click(function () {
              $(".g2").css("color", "black");
              $("#st6, #st7, #st8, #st9").css("color", "yellow");
              strating_2 = 4;
          });
          $("#st10").click(function () {
              $(".g2").css("color", "black");
              $("#st6, #st7, #st8, #st9, #st10").css("color", "yellow");
              strating_2 = 5;
             
          });
          $("#st11").click(function () {
              $(".g3").css("color", "black");
              $("#st11").css("color", "yellow");
              strating_3 = 1;
             
          });
          $("#st12").click(function () {
              $(".g3").css("color", "black");
              $("#st11, #st12").css("color", "yellow");
              strating_3 = 2;
          });
          $("#st13").click(function () {
              $(".g3").css("color", "black")
              $("#st11, #st12, #st13").css("color", "yellow");
              strating_3 = 3;
          });
          $("#st14").click(function () {
              $(".g3").css("color", "black");
              $("#st11, #st12, #st13, #st14").css("color", "yellow");
              strating_3 = 4;
          });
          $("#st15").click(function () {
              $(".g3").css("color", "black");
              $("#st11, #st12, #st13, #st14, #st15").css("color", "yellow");
              strating_3 = 5;

          });
          $("#st16").click(function () {
              $(".g4").css("color", "black");
              $("#st16").css("color", "yellow");
              strating_4 = 1;

          });
          $("#st17").click(function () {
              $(".g4").css("color", "black");
              $("#st16, #st17").css("color", "yellow");
              strating_4 = 2;
          });
          $("#st18").click(function () {
              $(".g4").css("color", "black")
              $("#st16, #st17, #st18").css("color", "yellow");
              strating_4 = 3;
          });
          $("#st19").click(function () {
              $(".g4").css("color", "black");
              $("#st16, #st17, #st18, #st19").css("color", "yellow");
              strating_4 = 4;
          });
          $("#st20").click(function () {
              $(".g4").css("color", "black");
              $("#st16, #st17, #st18, #st19, #st20").css("color", "yellow");
              strating_4 = 5;

          });
          $("#st21").click(function () {
              $(".g5").css("color", "black");
              $("#st21").css("color", "yellow");
              strating_5 = 1;

          });
          $("#st22").click(function () {
              $(".g5").css("color", "black");
              $("#st21, #st22").css("color", "yellow");
              strating_5 = 5;
          });
          $("#st23").click(function () {
              $(".g5").css("color", "black");
              $("#st21, #st22, #st23").css("color", "yellow");
              strating_5 = 5;
          });
          $("#st24").click(function () {
              $(".g5").css("color", "black");
              $("#st21, #st22, #st23, #st24").css("color", "yellow");
              strating_5 = 5;
          });
          $("#st25").click(function () {
              $(".g5").css("color", "black");
              $("#st21, #st22, #st23, #st24, #st25").css("color", "yellow");
              strating_5 = 5;

          });
     
          var rating_Questions = "<%=context.job_post.FirstOrDefault(j => j.rec_id == canloginNow.job_apply_id).evalauation%>";

               document.getElementById("<%=hidRatingQuestions.ClientID%>").value = rating_Questions
        });

           function SaveRatings(status) {
               var rating = strating_1 + "," + strating_2 + "," + strating_3 + "," + strating_4 + "," + strating_5;

               var rating_Questions ="<%=context.job_post.FirstOrDefault(j => j.rec_id == canloginNow.job_apply_id).evalauation%>";
              // alert(rating);
               //var rating = document.getElementById("<%=hidRating.ClientID%>").value;
               var rating_Questions = document.getElementById("<%=hidRatingQuestions.ClientID%>").value;
               var Comments = document.getElementById("<%=txtCommentsarea.ClientID%>").value;
               var Candidate_ID = "<%=vid %>";
alert(Comments);
               $.ajax({
                   type: "POST",
                   url: "Candidate_Profile.aspx/SaveRatings",
                   data: '{rating_string: "' + rating + '",rating_Questions:"' + rating_Questions + '",Comments:"' + Comments + '",Status:"' + status + '",Candidate_ID:"' + Candidate_ID + '"}',
                   contentType: "application/json; charset=utf-8",
                   dataType: "json",
                   success: OnSuccess1,
                   failure: function (response) {
                       alert(response.d);
                   }
               });
               function OnSuccess1(response) {
                   alert("Saved");
               }
           }
    </script>
    <script>
        function OpenWindow() {
            var v = document.getElementById('lnkresume2')
              
          //  alert(v.href);
            window.open(v, '_blank', 'height=450,width=500,location=1,toolbar=0,scrollbars=1');
        }
    </script>
    <script>
        function assignUrl(q_no,q_name,q_id,candidate_id) {
            //var candidatelist = lst;
            var candida_Id = parseInt(candidate_id);
            document.getElementById("questionspan").innerHTML ="Question "+q_no+":"+ q_name;
            $.ajax({
                type: "POST",
                url: "Candidate_Profile.aspx/assignUrl",
                data: '{QID: "' + q_id + '",CandidateID:"' + candida_Id + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess,
                failure: function (response) {
                    alert(response.d);
                }
            });

        }
        function OnSuccess(response) {
            var videoPlayers = document.getElementById("VideoPlayer")
           
            document.getElementById("VideoPlayer").src =response.d;
            $("video")[0].load();
            setTimeout(function () {

                document.getElementById("<%=btnpreview.ClientID%>").click();

              }
                  , 1000);
           
        }
        function onBtnpreClicked() {
         
            var previewdiv = document.getElementById("previewVideo");
            previewdiv.hidden = false;
            var playbackVElement = document.getElementById("VideoPlayer");
            playbackVElement.autoplay = true;
            playbackVElement.controls = true;
            playbackVElement.muted = false;
            // playbackVElement.controls = false;
            playbackVElement.play();
            //playbackVElement.hidden = true;          
            document.getElementById("<%=c2.ClientID%>").style.visibility = 'visible';
           
        }
    </script>
</head>
<body>
    
     <form id="form1" runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
         <asp:HiddenField ID="hidRating" runat="server" />
      <asp:HiddenField ID="hidRatingQuestions" runat="server" />
        <uc1:head runat="server" ID="head" />
     
                 <!--**********************************
            Sidebar end
        ***********************************-->

        <!--**********************************
            Content body start
        ***********************************-->
        <!--**********************************
        Content body start
    ***********************************-->
        <div class="content-body">
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
                <div class="page-titles">
                 
                    <table style="width:100%">
                        <tr>
                            <td style="width:10%" rowspan="2"><div class="profile-photo">
    <img src="images/profile/p5.png" class="img-fluid rounded-circle" alt="" style="width:70px;height:70px;">

</div></td>
                            <td style="width:30%">
                                <ol class="breadcrumb">

                                    <li class="breadcrumb-item"><a href="javascript:void(0)"><asp:Label ID="lblName" runat="server" Text=""></asp:Label>: Contact Center Specialist</a></li>
                                 
                                </ol>
                            </td>
                            <td style="width:30%">
                                <i class="fa fa-envelope text-primary mr-2"></i>&nbsp;<i class="fa fa-linkedin text-primary mr-2"></i>
                            </td>
                            <td style="width:15%"></td>
                            <td style="width:15%"></td>
                        </tr>
                        <tr>
                            <!--<td style="width:20%"></td>-->
                            <td style="width:30%"><h6><i class="fa fa-phone text-primary mr-2"></i><asp:Label ID="lblPhone" runat="server" Text=""></asp:Label> &nbsp;<i class="fa fa-envelope text-primary mr-2"></i><asp:Label ID="lblEmail" runat="server" Text=""></asp:Label></h6></td>
                            <td style="width:30%"></td>
                            <td style="width:15%;text-align:left;"><%--<i class="fa fa-list-alt text-primary mr-2"></i>Dashboard--%></td>
                            <td style="width:15%;text-align:right;"><%--Next&nbsp;<i class="fa fa-forward text-primary mr-2"></i>--%></td>
                        </tr>
                        
                    </table>
                  
                </div>
                <!-- row -->
                <span style="font-weight:bold;" id="questionspan">&nbsp;&nbsp;&nbsp;</span>
                <div class="row">
                    <div class="col-lg-8">

                        <div class="row">

                            <div class="col-lg-12">
                                <div class="profile card card-body px-3 pt-3 pb-0">
                                    <div >
                                        <div>
                                            
                                               <%-- <img src="images/profile/p6.png" alt="" style="width:100%;height:451px;">--%>
                                                 <div style="width: 450px; z-index: -1; float:left;margin-left:10%;" id="previewVideo" runat="server"> 
                                                  <input type="button"  id="btnpreview" runat="server" onclick="onBtnpreClicked()" value="Play Preview" style="display:none;"/> 
                                                     <canvas id="c2"  runat="server" width="640" height="600" style="margin-left:10%;" ></canvas>  
                                                     <canvas id="c1" runat="server" width="640" height="600" style="margin-left:10%;" hidden></canvas>
                                                </div>
                                                <video id="VideoPlayer" runat="server" src=""   controls  muted   height="370px" style="margin-bottom:-22px;visibility:hidden;" class="video" />
                                          
                                        </div>

                                    </div>
                                </div>
                                <div class="profile-details">
                                    <br />
                                    <div class="dropdown ml-auto">
                                        <!--<a href="#" class="btn btn-primary light sharp" data-toggle="dropdown" aria-expanded="true"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="18px" height="18px" viewBox="0 0 24 24" version="1.1"><g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><rect x="0" y="0" width="24" height="24"></rect><circle fill="#000000" cx="5" cy="12" r="2"></circle><circle fill="#000000" cx="12" cy="12" r="2"></circle><circle fill="#000000" cx="19" cy="12" r="2"></circle></g></svg></a>-->
                                        <ul class="dropdown-menu dropdown-menu-right">
                                            <li class="dropdown-item"><i class="fa fa-user-circle text-primary mr-2"></i> View profile</li>
                                            <li class="dropdown-item"><i class="fa fa-users text-primary mr-2"></i> Add to close friends</li>
                                            <li class="dropdown-item"><i class="fa fa-plus text-primary mr-2"></i> Add to group</li>
                                            <li class="dropdown-item"><i class="fa fa-ban text-primary mr-2"></i> Block</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>


                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="col-xl-12 col-lg-12">


                                    <div style="text-align:center;margin-left:37%">


                                        <ul class="pagination pagination-xs pagination-circle">
                                            <li class="page-item page-indicator">
                                                <a class="page-link" href="javascript:void(0)">
                                                    <i class="la la-angle-left"></i>
                                                </a>
                                            </li>
                                              <%
    int j=0;

    for (int k = 0; k < VideoInterViewList.Count; k++)
    {
        j = j + 1;

        {  %>
                                            <% if (j == 1)
    {%>
                                            <li class="page-item active" id="1">
                                                <a  class="page-link" href="#" onclick="assignUrl('<%=j %>','<%= getQuestionName(VideoInterViewList[k].question_id.ToString()) %>','<%=VideoInterViewList[k].question_id %>','<%=VideoInterViewList[k].candidate_id %>');"><%=j %></a>
                                            </li>
                                            <%}
    else
    { %>
                                            <li id="<%=j %>" class="page-item"><a class="page-link" href="#" onclick="assignUrl('<%=j %>','<%= getQuestionName(VideoInterViewList[k].question_id.ToString()) %>','<%=VideoInterViewList[k].question_id %>','<%=VideoInterViewList[k].candidate_id %>');"><%=j %></a></li>
                                           
                                             <%}
    } %>
                                            <%} %>
                                            <li class="page-item page-indicator">
                                                <a class="page-link" href="javascript:void(0)">
                                                    <i class="la la-angle-right"></i>
                                                </a>
                                            </li>
                                        </ul>

                                    </div>

                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="col-xl-12 col-lg-12">
                                    <div class="card">
                                        <div class="card-header d-block">
                                            <h6 class="m-b-0">Professional Skills:</h6>
                                            <p class="mb-0 subtitle">&nbsp;&nbsp;<asp:Label runat="server" ID="exp1"></asp:Label>
</p>
                                            <p class="mb-0 subtitle">
                                                &nbsp;&nbsp;<asp:Label runat="server" ID="exp2"></asp:Label>
                                            </p>
                                            <p class="mb-0 subtitle">
                                                &nbsp;&nbsp; <asp:Label runat="server" ID="exp3"></asp:Label>
                                            </p>
                                            <br />
                                            <a  href="javascript:void(0)">
                                                <i class="fa fa-file-text-o text-primary mr-2"></i>Download / View Resume
                                            </a>
                                            <a href="javascript:void(0)">
                                              <%--  <i class="fa fa-video-camera text-primary mr-2"></i>Download Video--%>
                                            </a>
                                            <br />
                                            <br />
                                        </div>
                                        
                                    </div>
                                </div>

                                </div>
                            </div>

                            </div>

                            <div class="col-xl-4">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="profile-statistics mb-5">
                                            <div class="text-left">
                                                <div class="row">
                                                    <div class="col">
                                                        <h6 class="m-b-0">Professional Skills:</h6>
                                                     <span runat="server" id="lblskills"></span>
                                                    </div>

                                                </div>

                                            </div>
                                            <div class="text-left">
                                                <div class="row">
                                                    <div class="col">
                                                        <br />
                                                        <h6 class="m-b-0">Salary Details :</h6>
                                                        <span>Current Month Salary: INR <asp:Label ID="lbltotalctc" runat="server" Text=""></asp:Label></span>
                                                        <span>Expected Month Salary: INR <asp:Label ID="lblfixedctc" runat="server" Text=""></asp:Label></span>
                                                    </div>
                                                </div>
                                                <div class="row">

                                                    <div class="col">
                                                      
                                                        <span>Notice Period:<asp:Label ID="lblnoticeperiod" runat="server" Text=""></asp:Label></span>
                                                        <br />
                                                    </div>
                                                </div>


                                            </div>
                                            <br />

                                            <div class="text-left">
                                                
                                                <div class="row">
                                                     <%if (evalutiontext.Count>0)
                                                            { %>
                                                    <div class="col">
                                                       
                                                        <span> <%=evalutiontext[0] %></span>
                                                      
                                                    </div>
                                                    <div class="col">
                                                        <div class="comment-review star-rating">
                                                            <ul>
                                                                <li><i  class="fa fa-star g1" aria-hidden = "true"  id = "st1"></i></li>
                                                                <li><i class="fa fa-star g1" aria-hidden = "true" id = "st2"></i></li>
                                                                <li><i class="fa fa-star g1" aria-hidden = "true" id = "st3"></i></li>
                                                                <li><i class="fa fa-star g1" aria-hidden = "true" id = "st4"></i></li>
                                                                <li><i class="fa fa-star g1" aria-hidden = "true" id = "st5"></i></li>
                                                            </ul>

                                                        </div>
                                                    </div>
                                                      <%} %>
                                                </div>
                                                <div class="row">
                                                    <%if (evalutiontext.Count>1)
                                                            { %>
                                                    <div class="col">

                                                        <span> <%=evalutiontext[1] %> </span>
                                                    </div>
                                                    <div class="col">
                                                        <div class="comment-review star-rating">
                                                            <ul>
                                                                <li><i class="fa fa-star g2" aria-hidden = "true"  id = "st6"></i></li>
                                                                <li><i class="fa fa-star g2" aria-hidden = "true" id = "st7"></i></li>
                                                                <li><i class="fa fa-star g2" aria-hidden = "true" id = "st8"></i></li>
                                                                <li><i class="fa fa-star g2" aria-hidden = "true" id = "st9"></i></li>
                                                                <li><i class="fa fa-star g2" aria-hidden = "true" id = "st10"></i></li>
                                                            </ul>

                                                        </div>
                                                    </div>
                                                     <%} %>
                                                </div>

                                                <div class="row">
                                                     <%if (evalutiontext.Count>2)
                                                            { %>
                                                    <div class="col">

                                                        <span> <%=evalutiontext[2] %> </span>
                                                    </div>
                                                    <div class="col">
                                                        <div class="comment-review star-rating">
                                                            <ul>
                                                                <li><i class="fa fa-star g3" aria-hidden = "true"  id = "st11"></i></li>
                                                                <li><i class="fa fa-star g3" aria-hidden = "true" id = "st12"></i></li>
                                                                <li><i class="fa fa-star g3" aria-hidden = "true" id = "st13"></i></li>
                                                                <li><i class="fa fa-star g3" aria-hidden = "true" id = "st14"></i></li>
                                                                <li><i class="fa fa-star g3" aria-hidden = "true" id = "st15"></i></li>
                                                            </ul>

                                                        </div>
                                                    </div>
                                                     <%} %>
                                                </div>
                                                <div class="row">
                                                    <%if (evalutiontext.Count>3)
                                                            { %>
                                                    <div class="col">

                                                        <span> <%=evalutiontext[3] %> </span>
                                                    </div>
                                                    <div class="col">
                                                        <div class="comment-review star-rating">
                                                            <ul>
                                                              <li><i class="fa fa-star g4" aria-hidden = "true"  id = "st16"></i></li>
                                                                <li><i class="fa fa-star g4" aria-hidden = "true" id = "st17"></i></li>
                                                                <li><i class="fa fa-star g4" aria-hidden = "true" id = "st18"></i></li>
                                                                <li><i class="fa fa-star g4" aria-hidden = "true" id = "st19"></i></li>
                                                                <li><i class="fa fa-star g4" aria-hidden = "true" id = "st20"></i></li>
                                                            </ul>

                                                        </div>
                                                    </div>
                                                      <%} %>
                                                </div>

                                                <div class="row">
                                                      <%if (evalutiontext.Count>4)
                                                            { %>
                                                    <div class="col">

                                                        <span> <%=evalutiontext[4] %> </span>
                                                    </div>
                                                    <div class="col">
                                                        <div class="comment-review star-rating">
                                                            <ul>
                                                               <li><i class="fa fa-star g5" aria-hidden = "true"  id = "st21"></i></li>
                                                                <li><i class="fa fa-star g5" aria-hidden = "true" id = "st22"></i></li>
                                                                <li><i class="fa fa-star g5" aria-hidden = "true" id = "st23"></i></li>
                                                                <li><i class="fa fa-star g5" aria-hidden = "true" id = "st24"></i></li>
                                                                <li><i class="fa fa-star g5" aria-hidden = "true" id = "st25"></i></li>
                                                            </ul>
                                                           
                                                        </div>
                                                    </div>
                                                     <%} %>
                                                </div>
                                               
                                            </div>
                                            <div class="text-left">
                                                <div class="row">
                                                    <div class="col">
                                                       

                                                        <textarea id="txtCommentsarea" placeholder="enter Comment..." rows="3" style="width:100%" runat="server"></textarea>

                                                        <br />
                                                        <span>&nbsp;<a href="#" onclick="OpenWindow();">View Comment</a> </span>
                                                    </div>
                                                </div>
                                                <div class="row">

                                                    <div class="col">
                                                       <br />
                                                        <br />

                                                    </div>
                                                </div>


                                            </div>
                                            <div >
                                                
                                                <table style="width:80% ">
                                                    <tr>
                                                        <td> <input type="button" runat="server" class="img-fluid rounded-circle" style="width:100px;height:90px;background-image:url(images/pass.png);background-repeat:no-repeat;border:none;" onclick="SaveRatings('Pass');"  alt="Submit" /></td>
                                                          <td>  <input type="button" runat="server" class="img-fluid rounded-circle" style="width:100px;height:90px;background-image:url(images/hold.png);background-repeat:no-repeat;border:none;" onclick="SaveRatings('Hold');"  alt="Submit" /></td>
                                                          <td>   <input type="button" runat="server" class="img-fluid rounded-circle" style="width:100px;height:90px;background-image:url(images/reject.png);background-repeat:no-repeat;border:none;" onclick="SaveRatings('Reject');"  alt="Submit" /> </td>
                                                          <td>  <input type="button" runat="server" class="img-fluid rounded-circle" style="width:100px;height:90px;background-image:url(images/hired.png);background-repeat:no-repeat;border:none;" onclick="SaveRatings('Hired');"  alt="Submit" /> </td>
                                                    </tr>
                                                </table>
                                               
                                                  
                                                    
                                                

                                            </div>
                                            <!-- Modal -->

                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">

                            <div class="col-xl-12">
                                <div class="card">

                                    <div class="card-body">
                                        <div id="accordion-four" class="accordion accordion-no-gutter accordion-bordered">

                                            <div class="accordion__item" >
                                                <div class="accordion__header collapsed" style="background-color:darkgrey;" data-toggle="collapse" data-target="#bordered_no-gutter_collapseTwo">
                                                    <span class="accordion__header--text" ><asp:Label ID="lblresume" runat="server"></asp:Label></span>
                                                    <span class="accordion__header--indicator style_two"></span>
                                                </div>
                                                <div id="bordered_no-gutter_collapseTwo" class="collapse accordion__body" data-parent="#accordion-four">
                                                    <div class="accordion__body--text">
                                        <%--                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.--%>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
        </div>








         <main style="visibility:hidden">
 <div class="container-fluid">
 <div class="title-box">
 <div class="row">
 <div class="col-12 col-sm-6 col-xl-6"><div class="page-title">Profile</div></div>
  <div class="col-12 col-sm-6 col-xl-6 "><div class="breadcrumb">Dashboard <span><i class="fas fa-angle-right"></i></span> Profile</div></div>
 </div>
 </div>
 <div class="profile-box">
 <div class="header">
 <div class="overlay"></div>
 <div class="edit-btn"><a href="#"></a></div>
 <div class="follower-box">
 <div> </div>
  <div> </div>
 </div>
 </div>
 <div class="body">
 <div class="row">
 <div class="col-xl-3 col-lg-3 pr-0">
 <div class="left-panel">
 <div class="profile-info-box">
 <div class="profile-pic">
     <asp:Image runat="server" ID="img1"  class="w-100" />

 
 </div>
 <div class="name"></div>
 <div class="position"><asp:Label ID="lblPost" runat="server" Text=""></asp:Label></div>
      <div class="position"></div>
     <br />
  
       <div class="position" style="color:blue;"><asp:Button ID="btnViewRemarks" runat="server" Text="View/Download Resume" 
                      class="button"  OnClientClick="OpenWindow();"/>
           <a href="" runat="server" id="lnkresume2"  style="color:blue;visibility:hidden;" OnClick="OpenWindow();">Download Resume</a></div>
<%-- <center><ul class="list">
<%-- <li><div class="count">3</div>
  <div class="name">Question</div>
 </li>
 <%--<li><div class="count">1,231</div>
  <div class="name">Photos</div>
 </li>
 <li><div class="count"></div>
  <div class="name">3 Question/Videos Uploaded</div>
 </li>
 </ul>
     </center>--%>
 </div>
     <br />
     <br />
 <div class="widget">
 <div class="head">About </div>
 <p>

</p>
 <ul class="list">
  <li><i class="fas fa-phone-alt"></i></li>
  <li><i class="fas fa-envelope"></i></li>
  <li><i class="fas fa-map-marker-alt"></i> <asp:Label ID="lblLocation" runat="server" Text=""></asp:Label></li>
 </ul>
 </div>
     <div class="widget">
 <div class="head">Details </div>
 <div class="skill-box">

 <div class="name">Total CTC:</div>
 <div class="skill-box">
</div> 
 <div class="name">Fixed CTC: </div>
 
 </div>
    <div class="skill-box">
 <div class="name">Variable CTC: <asp:Label ID="lblvarctc" runat="server" Text=""></asp:Label></div>
 
 </div>  
     <div class="skill-box">
 <div class="name">Notice Period: </div>
 
 </div>                                
 </div>
<div class="widget">
 <div class="head">Highest Education </div>
 <div class="skill-box">
 <div class="name">Degree:<asp:Label ID="lblDegree" runat="server" Text=""></asp:Label></div>
 
                                     
 </div>
 <div class="skill-box">
 <div class="name">Institute: <asp:Label ID="lblInst" runat="server" Text=""></asp:Label></div>
 
 </div>
 <div class="skill-box">
 <div class="name">Year: <asp:Label ID="lblYear" runat="server" Text=""></asp:Label></div>
 
 </div>

 </div>
 <div class="widget">
 <div class="head"> Skill</div>
 <div class="skill-box">
 <div class="name"></div>
 <%--<div class="progress">                                                 
 <div class="progress-bar bg-primary" style="width: 35%;"></div>
 </div>--%>
                                     
 </div>
 <div class="skill-box">
 <div class="name"></div>
<%-- <div class="progress">                                                 
                                                    <div class="progress-bar bg-warning" style="width: 20%;"></div>
                                                </div>--%>
 </div>
 <div class="skill-box">
 <div class="name"></div>
 <%-- <div class="progress"> 
 <div class="progress-bar bg-success" style="width: 60%;"></div>
 </div>--%>
 </div>
 <div class="skill-box">
 <div class="name"></div>
 <%--<div class="progress">                                                 
                                                    <div class="progress-bar bg-danger" style="width: 50%;"></div>
                                                </div>--%>
 </div>
 </div>
         
 </div>
 </div>
 <div class="col-xl-9 col-lg-9">
 <div class="timeline-part">
 
      <%--<div class="card">
 <div class="card-body">
 <form>
 <div class="form-group">
     <h6>Resume Details</h6>
     <hr />
      <p>Around 10 years of IT experience in designing and implementing system modules.Expertise in debugging and testing developed modules and scripts.Good experience in coding using SQL Server, Procedures/Functions/ Conditional statement/Looping etc. Remote Job Experience.</p>
 
  </div>
  <div class="btn-box">

      <a href="upload/Abhishek/Abhishek Sharma Resume.pdf" style="color:blue;" target="_blank">View More Details</a>
     </div>
 </form>
 </div>
 </div>--%>
 <div class="card" style="visibility:hidden;">
 <div class="card-header">
 <div class="row">
 <div class="col-9">
 <div class="profile-thumbnail">   <asp:Image runat="server" ID="Image2"  class="w-100" /></div>
 <div class="name"> Video Interviews</div>
 <div class="time"></div>
 </div>
 <%--<div class="col-3 text-right"><button type="submit" class="btn btn-success">Download</button></div>--%>
 </div>
 </div>
 <div >
 <table>
     <tr><td>
     <div style="width:350px" class="tab">
         
  <%--<button class="tablinks"  onclick="openCity(event, 'London')" id="defaultOpen">Question 1 :-</button>
  <button class="tablinks" onclick="openCity(event, 'Paris')">Question 2 :-</button>
  <button class="tablinks" onclick="openCity(event, 'Tokyo')">Question 3 :-</button>
 <button class="tablinks" onclick="openCity(event, 'New')">Question 4 :-</button>
  <button class="tablinks" onclick="openCity(event, 'Ok')">Question 5 :-</button>--%>
</div>

<%--<div id="London" class="tabcontent">
    
 <div style="background-color:orange;width:100%;height:60px;color:white;"><br /><center> <h6><asp:Label runat="server" ID="lblquestion" Text=""></asp:Label></h6></center></div>
  <p>  <video id="VideoPlayer" runat="server" src='' controls="true" width="440" height="350" loop="false" class="w-100"/>
 </p><hr /> 
</div>--%>
     </td>
         <td>
   <asp:Button ID="btnBack" runat="server" Text="<" style="background-color:rgba(246, 215, 209, 0.54);color:#FF6700;width:25px;height:450px;border:0px;font-weight:bolder;font-size:x-large;" OnClick="btnBack_Click" />


         </td>
         <td>
     <div id="London" >
 <div style="background-color:rgba(0, 0, 0, 0.80);width:100%;height:76px;color:#FF6700;font-size:smaller"> <br /><center><h6 runat="server" id="lblquestion"></h6></center></div>


         
        
  <p>      

      
      </td>
      <td>
          <span style="text-align:right;" > <asp:Button ID="btnNext" runat="server" Text=">" style="background-color:rgba(246, 215, 209, 0.54);;color:#FF6700;width:25px;height:450px;border:0px;font-weight:bolder;font-size:x-large;" OnClick="btnNext_Click"  /></span>
      </td>
     </tr>

 </table>
         <br />
     <br />
             <div class="col-12 text-center">
    
     <asp:DropDownList ID="ddlResult" runat="server" class="custom-select form-control" >
                                           <asp:ListItem Value="0">Result</asp:ListItem>
                                               <asp:ListItem Value="Pass">Pass</asp:ListItem>
                                               <asp:ListItem Value="Fail">Fail</asp:ListItem>
                                               <asp:ListItem Value="Undecided">Undecided</asp:ListItem>
                                   
                                        </asp:DropDownList>
      <asp:DropDownList ID="ddlRating" runat="server"  class="custom-select form-control" >
                                           <asp:ListItem Value="0">Rating</asp:ListItem>
                                               <asp:ListItem Value="1">1</asp:ListItem>
                                               <asp:ListItem Value="2">2</asp:ListItem>
                                               <asp:ListItem Value="3">3</asp:ListItem>
                                                  <asp:ListItem Value="4">4</asp:ListItem>
                                                <asp:ListItem Value="5">5</asp:ListItem>
                                             
                                        </asp:DropDownList><br />

     <asp:TextBox runat="server" ID="txtcomment" TextMode="MultiLine" Width="100%" Height="80px" placeholder="Please enter your comment" ></asp:TextBox><br />
    
         
            <asp:Button ID="btnSubmit" runat="server" Text="Save" class="btn btn-warning" OnClick="btnSubmit_Click" />
    
         
         
         </br>
         </br> 

         <asp:Button ID="sendnotification" runat="server" Text="Send Notification For Video Uploading" class="btn btn-warning" OnClick="sendnotification_Click"/>
         <%--<button type="submit" class="btn btn-warning">Send Notification For Video Uploading</button><--%>
  

            </div>
</div>

<%--<div id="Paris" class="tabcontent">
     <div style="background-color:orange;width:100%;height:60px;color:white;"><br /><center> <h6 >How did you hear about this position?</h6></center></div>

  <p>
     <video id="VideoPlayer1" src='http://localhost:60242/admin/Upload_video/EXTUENT/Abhishek001INR/video.webm' controls="true" width="440" height="350" loop="false" class="w-100"/>
</p> 
    <hr /> <div class="col-12 text-right"><button type="submit" class="btn btn-success">Approve</button>|<button type="submit" class="btn btn-warning">Rejected | Send Notification</button></div>
</div>

<div id="Tokyo" class="tabcontent">
    
 <div style="background-color:orange;width:100%;height:60px;color:white;"><br /><center> <h6 >Why did you decide to apply for this position?</h6></center></div>

  <p> <video id="VideoPlayer2" src='http://localhost:60242/admin/Upload_video/EXTUENT/Abhishek001INR/video.webm' controls="true" width="440" height="350" loop="false" class="w-100"/>
</p>
    <hr /> <div class="col-12 text-right"><button type="submit" class="btn btn-success">Approve</button>|<button type="submit" class="btn btn-warning">Rejected | Send Notification</button></div>
</div>

<div id="New" class="tabcontent">
     <div style="background-color:orange;width:100%;height:60px;color:white;"><br /><center> <h6 >What are your strengths and weaknesses?</h6></center></div>

  <p><video id="VideoPlayer3" src='http://localhost:60242/admin/Upload_video/EXTUENT/Abhishek001INR/video.webm' controls="true" width="440" height="350" loop="false" class="w-100"/></p>
    <hr /> <div class="col-12 text-right"><button type="submit" class="btn btn-success">Approve</button>|<button type="submit" class="btn btn-warning">Rejected | Send Notification</button></div>
</div>
<div id="Ok" class="tabcontent">
         <div style="background-color:orange;width:100%;height:60px;color:white;"><br /><center> <h6 >What do you know about Company ?</h6></center></div>

  <p><video id="VideoPlayer4" src='http://localhost:60242/admin/Upload_video/EXTUENT/Abhishek001INR/video.webm' controls="true" width="440" height="350" loop="false" class="w-100"/></p>
    <hr /> <div class="col-12 text-right"><button type="submit" class="btn btn-success">Approve</button>|<button type="submit" class="btn btn-warning">Rejected | Send Notification</button></div>
</div>--%>
<%--<div class="col-12 text-right"><button type="submit" class="btn btn-success">Approve</button>|<button type="submit" class="btn btn-warning">Rejected | Send Notification</button></div>--%>




 
    
       
 

       

 </div>
<%-- <div class="card-footer">

 </div>--%>
 </div>

     <div class="card" style="visibility:hidden;">
 <div class="card-body">

 <div class="form-group">
     <h6>Resume Details</h6>
     <hr />
      <p></p>
 
  </div>
  <div class="btn-box">
      <asp:Button ID="Button1" runat="server" Text="View More Details" 
                      class="button"  OnClientClick="OpenWindow();"/>
      <a href="" runat="server" id="lnkresume" style="color:blue;visibility:hidden;" target="_top"></a>
     </div>

 </div>
 </div>
 </div>
 </div>
 <%--<div class="col-xl-3 col-lg-3 pl-0">
 <div class="right-panel">
 <div class="widget video">
 <div class="head">Videos</div>
 <div class="video-box">
 <div class="row">
 
 <div class="col-8">
 <div class="title"><b>Q1:</b>  What is your Name?</div>
 <p><a href="#" style="color:blue;">Send Back|Accept</a></p>
 </div>
     <div class="col-4 pr-0">

      Uploaded
 
 </div>
       
 </div>
 </div>
   
<div class="video-box">
 <div class="row">
 
 <div class="col-8">
 <div class="title"><b>Q1:</b>  What is your skill?</div>
 <p><a href="#" style="color:blue;">Send Back|Accept</a></p>
 </div>
     <div class="col-4 pr-0">

      Uploaded
 
 </div>
       
 </div>
 </div>
<div class="video-box">
 <div class="row">
 
 <div class="col-8">
 <div class="title"><b>Q1:</b> What is your Qualification?</div>
 <p><a href="#" style="color:blue;">Send Back|Accept</a></p>
 </div>
     <div class="col-4 pr-0">

      Uploaded
 
 </div>
       
 </div>
 </div>
 </div>

 </div>
 </div>--%>
 </div>
 </div>
 </div>
 </div> 
 </div>
 </main>

            <uc1:foot runat="server" id="foot" />
        <%--<script>
function openCity(evt, cityName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " active";
}

// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();
</script>--%> 
    </form>
    
    <link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css">

    <script src = "https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.min.js"> </script>
    <link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <script src="js/TensorFlow.js"></script>
    <script src="js/BodyPix.js"></script>
 	
    <script src="js/processor.js"></script>
</body>
</html>
