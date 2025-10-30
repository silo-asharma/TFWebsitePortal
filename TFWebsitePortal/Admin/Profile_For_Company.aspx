<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile_For_Company.aspx.cs" Inherits="Extuent.Admin.Profile_For_Company" %>


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

     <style>
         #c2 {
             background-image: url(https://extuent.ai/bg/bg1.jpg);
             background-repeat: no-repeat;
             background-size: cover;
             width: 100%;
         }
     </style>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: "Lato", sans-serif;
        }

        /* Style the tab */
        .tab {
            float: center;
            border: 1px solid #FF6700;
            background-color: #FF6700;
            border: 0px;
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
            width: 100%;
        }
    </style>
    
       <script>
           $(document).ready(function () {
               var rating;
               var ratings = "<%=canloginNow.rating%>";
               if (ratings != null && ratings != "")
                   rating = ratings.split(',');


               if (rating[0] == 1)
                   $("#st1").css("color", "green");
               else if (rating[0] == 2) {
                   $("#st1").css("color", "green");
                   $("#st2").css("color", "green");
               }

               else if (rating[0] == 3) {
                   $("#st1").css("color", "green");
                   $("#st2").css("color", "green");
                   $("#st3").css("color", "green");
               }
               else if (rating[0] == 4) {
                   $("#st1").css("color", "green");
                   $("#st2").css("color", "green");
                   $("#st3").css("color", "green");
                   $("#st4").css("color", "green");
               }
               else if (rating[0] == 5) {
                   $("#st1").css("color", "green");
                   $("#st2").css("color", "green");
                   $("#st3").css("color", "green");
                   $("#st4").css("color", "green");
                   $("#st5").css("color", "green");
               }

               if (rating[1] == 1)
                   $("#st6").css("color", "green");
               else if (rating[0] == 2) {
                   $("#st6").css("color", "green");
                   $("#st7").css("color", "green");
               }

               else if (rating[1] == 3) {
                   $("#st6").css("color", "green");
                   $("#st7").css("color", "green");
                   $("#st8").css("color", "green");
               }
               else if (rating[1] == 4) {
                   $("#st6").css("color", "green");
                   $("#st7").css("color", "green");
                   $("#st8").css("color", "green");
                   $("#st9").css("color", "green");
               }
               else if (rating[1] == 5) {
                   $("#st6").css("color", "green");
                   $("#st7").css("color", "green");
                   $("#st8").css("color", "green");
                   $("#st9").css("color", "green");
                   $("#st10").css("color", "green");
               }
               if (rating[2] == 1)
                   $("#st11").css("color", "green");
               else if (rating[2] == 2) {
                   $("#st11").css("color", "green");
                   $("#st12").css("color", "green");
               }

               else if (rating[2] == 3) {
                   $("#st11").css("color", "green");
                   $("#st12").css("color", "green");
                   $("#st13").css("color", "green");
               }
               else if (rating[2] == 4) {
                   $("#st11").css("color", "green");
                   $("#st12").css("color", "green");
                   $("#st13").css("color", "green");
                   $("#st14").css("color", "green");
               }
               else if (rating[2] == 5) {
                   $("#st11").css("color", "green");
                   $("#st12").css("color", "green");
                   $("#st13").css("color", "green");
                   $("#st14").css("color", "green");
                   $("#st15").css("color", "green");
               }
               if (rating[3] == 1)
                   $("#st16").css("color", "green");
               else if (rating[3] == 2) {
                   $("#st16").css("color", "green");
                   $("#st17").css("color", "green");
               }

               else if (rating[3] == 3) {
                   $("#st16").css("color", "green");
                   $("#st17").css("color", "green");
                   $("#st18").css("color", "green");
               }
               else if (rating[3] == 4) {
                   $("#st16").css("color", "green");
                   $("#st17").css("color", "green");
                   $("#st18").css("color", "green");
                   $("#st19").css("color", "green");
               }
               else if (rating[3] == 5) {
                   $("#st16").css("color", "green");
                   $("#st17").css("color", "green");
                   $("#st18").css("color", "green");
                   $("#st19").css("color", "green");
                   $("#st20").css("color", "green");
               }
               if (rating[4] == 1)
                   $("#st21").css("color", "green");
               else if (rating[4] == 2) {
                   $("#st21").css("color", "green");
                   $("#st22").css("color", "green");
               }

               else if (rating[4] == 3) {
                   $("#st21").css("color", "green");
                   $("#st22").css("color", "green");
                   $("#st23").css("color", "green");
               }
               else if (rating[4] == 4) {
                   $("#st21").css("color", "green");
                   $("#st22").css("color", "green");
                   $("#st23").css("color", "green");
                   $("#st24").css("color", "green");
               }
               else if (rating[4] == 5) {
                   $("#st21").css("color", "green");
                   $("#st22").css("color", "green");
                   $("#st23").css("color", "green");
                   $("#st24").css("color", "green");
                   $("#st25").css("color", "green");
               }
           });
    </script>
      
    <script>
        function OpenWindow() {
            var v = document.getElementById('lnkresume2')

            //  alert(v.href);
            window.open(v, '_blank', 'height=450,width=500,location=1,toolbar=0,scrollbars=1');
        }
    </script>

     <script>
         $(document).ready(function () {
             //   alert("2");
             var rating;
             var ratings = "<%=canloginNow.rating%>";
             if (ratings != null && ratings != "")
                 rating = ratings.split(',');


             if (rating[0] == 1)
                 $("#st1").css("color", "green");
             else if (rating[0] == 2) {
                 $("#st1").css("color", "green");
                 $("#st2").css("color", "green");
             }

             else if (rating[0] == 3) {
                 $("#st1").css("color", "green");
                 $("#st2").css("color", "green");
                 $("#st3").css("color", "green");
             }
             else if (rating[0] == 4) {
                 $("#st1").css("color", "green");
                 $("#st2").css("color", "green");
                 $("#st3").css("color", "green");
                 $("#st4").css("color", "green");
             }
             else if (rating[0] == 5) {
                 $("#st1").css("color", "green");
                 $("#st2").css("color", "green");
                 $("#st3").css("color", "green");
                 $("#st4").css("color", "green");
                 $("#st5").css("color", "green");
             }

             if (rating[1] == 1)
                 $("#st6").css("color", "green");
             else if (rating[0] == 2) {
                 $("#st6").css("color", "green");
                 $("#st7").css("color", "green");
             }

             else if (rating[1] == 3) {
                 $("#st6").css("color", "green");
                 $("#st7").css("color", "green");
                 $("#st8").css("color", "green");
             }
             else if (rating[1] == 4) {
                 $("#st6").css("color", "green");
                 $("#st7").css("color", "green");
                 $("#st8").css("color", "green");
                 $("#st9").css("color", "green");
             }
             else if (rating[1] == 5) {
                 $("#st6").css("color", "green");
                 $("#st7").css("color", "green");
                 $("#st8").css("color", "green");
                 $("#st9").css("color", "green");
                 $("#st10").css("color", "green");
             }
             if (rating[2] == 1)
                 $("#st11").css("color", "green");
             else if (rating[2] == 2) {
                 $("#st11").css("color", "green");
                 $("#st12").css("color", "green");
             }

             else if (rating[2] == 3) {
                 $("#st11").css("color", "green");
                 $("#st12").css("color", "green");
                 $("#st13").css("color", "green");
             }
             else if (rating[2] == 4) {
                 $("#st11").css("color", "green");
                 $("#st12").css("color", "green");
                 $("#st13").css("color", "green");
                 $("#st14").css("color", "green");
             }
             else if (rating[2] == 5) {
                 $("#st11").css("color", "green");
                 $("#st12").css("color", "green");
                 $("#st13").css("color", "green");
                 $("#st14").css("color", "green");
                 $("#st15").css("color", "green");
             }
             if (rating[3] == 1)
                 $("#st16").css("color", "green");
             else if (rating[3] == 2) {
                 $("#st16").css("color", "green");
                 $("#st17").css("color", "green");
             }

             else if (rating[3] == 3) {
                 $("#st16").css("color", "green");
                 $("#st17").css("color", "green");
                 $("#st18").css("color", "green");
             }
             else if (rating[3] == 4) {
                 $("#st16").css("color", "green");
                 $("#st17").css("color", "green");
                 $("#st18").css("color", "green");
                 $("#st19").css("color", "green");
             }
             else if (rating[3] == 5) {
                 $("#st16").css("color", "green");
                 $("#st17").css("color", "green");
                 $("#st18").css("color", "green");
                 $("#st19").css("color", "green");
                 $("#st20").css("color", "green");
             }
             if (rating[4] == 1)
                 $("#st21").css("color", "green");
             else if (rating[4] == 2) {
                 $("#st21").css("color", "green");
                 $("#st22").css("color", "green");
             }

             else if (rating[4] == 3) {
                 $("#st21").css("color", "green");
                 $("#st22").css("color", "green");
                 $("#st23").css("color", "green");
             }
             else if (rating[4] == 4) {
                 $("#st21").css("color", "green");
                 $("#st22").css("color", "green");
                 $("#st23").css("color", "green");
                 $("#st24").css("color", "green");
             }
             else if (rating[4] == 5) {
                 $("#st21").css("color", "green");
                 $("#st22").css("color", "green");
                 $("#st23").css("color", "green");
                 $("#st24").css("color", "green");
                 $("#st25").css("color", "green");
             }
         });
    </script>
    <script>

        function getPrevious() {

            var tabLink = document.getElementById("<%=hidPre.ClientID%>").value;

            $('#id_' + tabLink)[0].click();
            //var tabLink = document.querySelectorAll('.page-item');
            ////$('.page-item').removeClass('active'); // remove active for all first.
            ////  $(item).addClass('active'); // add active for clicked element
            //tabLink.forEach(function (item) {
            //    item.addEventListener('click', function () {
            //        tabLink.forEach(function (item) {
            //            item.classList.remove('active');


            //        })

            //        item.classList.add('active')

            //    }, false)
            //})
            //tabLink.click();
        }
        function getNext() {

            var tabLink = document.getElementById("<%=hidNext.ClientID%>").value;
            //alert(tabLink);
            $('#id_' + tabLink)[0].click();
            //var ok = document.getElementById($('#id_' + tabLink));
            //alert(ok);

            //var tabLink1 = document.querySelectorAll('.page-item');
            // $('.page-item').removeClass('active'); // remove active for all first.
            // $('#jid_' + tabLink).addClass('page-item active'); // add active for clicked element

            //$('#id_' + tabLink)[0].addClass('active');
            //alert($('#id_' + tabLink)[0]);
            //tabLink.click();
        }
        var a;


        function getDeviceNameorBrowser() {
            if (navigator.userAgent.match(/iPhone/i)
            || navigator.userAgent.match(/iPad/i)
            || navigator.userAgent.match(/iPod/i)
           ) {
                a = true;
            } else {
                a = false;
            }

            return a;
        }
        function fnBrowserDetect() {

            let userAgent = navigator.userAgent;
            let browserName;

            if (userAgent.match(/chrome|chromium|crios/i)) {
                browserName = "chrome";
            } else if (userAgent.match(/firefox|fxios/i)) {
                browserName = "firefox";
            } else if (userAgent.match(/safari/i)) {
                browserName = "safari";
            } else if (userAgent.match(/opr\//i)) {
                browserName = "opera";
            } else if (userAgent.match(/edg/i)) {
                browserName = "edge";
            } else {
                browserName = "No browser detection";
            }

            return browserName;
        }
        function assignUrl(q_no, q_name, q_id, candidate_id) {
            document.getElementById("<%=hidPre.ClientID%>").value = parseInt(q_no) - 1;
             document.getElementById("<%=hidNext.ClientID%>").value = parseInt(q_no) + 1;
             //var candidatelist = lst;
             var tabLink = document.querySelectorAll('.page-item');
             //$('.page-item').removeClass('active'); // remove active for all first.
             //  $(item).addClass('active'); // add active for clicked element
             //tabLink.forEach(function (item) {
             //    item.addEventListener('click', function () {
             //        tabLink.forEach(function (item) {
             //            item.classList.remove('active')
             //        })
             //        item.classList.add('active')
             //    }, false)
             //})

             var tabLink1 = document.querySelectorAll('.page-item');
             $('.page-item').removeClass('active'); // remove active for all first.
             $('#jid_' + q_no).addClass('page-item active');

             var candida_Id = parseInt(candidate_id);
             document.getElementById("questionspan").innerHTML = q_name;
             $.ajax({
                 type: "POST",
                 url: "Profile_For_Company.aspx/assignUrl",
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
             var resDevice = getDeviceNameorBrowser();
             //alert(resDevice);
             var browserName = fnBrowserDetect();

             const myArray2 = response.d.split("/");
             //alert(myArray2);
             let URLforPlay2 = URLDisplay + "//admin/Upload/MP4/" + myArray2[6];

             document.getElementById("VideoPlayer").style.visibility = "visible";
             //alert(browserName);
             if (resDevice == true) {
                 document.getElementById("VideoPlayer").src = myArray2 + '.mp4';

                 document.getElementById('divinput').setAttribute("style", "background-image: url('https://extuent.ai/bg/blackscreen.png')")
                 // document.getElementById("divPhoneLogo").style.visibility = "visible";

             }
             else if (resDevice == false && browserName == "safari") {
                 document.getElementById("VideoPlayer").src = myArray2 + '.mp4';
                 document.getElementById('divinput').setAttribute("style", "background-image: url('https://extuent.ai/bg/blackscreen.png')")
                 document.getElementById("divPhoneLogo").style.visibility = "hidden";
             }
             else {
                 document.getElementById("VideoPlayer").src = response.d + '.webm';

                 document.getElementById("divPhoneLogo").style.visibility = "hidden";
             }

             $("video")[0].load();
             setTimeout(function () {



             }
                   , 1000);

         }
         function onBtnpreClicked() {


             var playbackVElement = document.getElementById("VideoPlayer");
             playbackVElement.autoplay = true;
             playbackVElement.controls = true;
             playbackVElement.muted = false;
             // playbackVElement.controls = false;
             playbackVElement.play();
             //playbackVElement.hidden = true;          


         }
    </script>

    <link rel="stylesheet" type="text/css" href="../css_ext/style.css">
</head>
<body>
    <form id="form1" runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
         <asp:HiddenField ID="hidRating" runat="server" />
      <asp:HiddenField ID="hidRatingQuestions" runat="server" />
           <asp:HiddenField ID="hidPre" runat="server" />
           <asp:HiddenField ID="hidNext" runat="server" />
<%--        <uc1:head runat="server" ID="head" />--%>
     
             <div class="header" style="height:70px;">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-auto">
                <!-- start logo -->
                <div class="logo">
                    <a href="" title="Extuent"><img src="images/logo.png" width="241" height="42" alt="Extuent"></a>
                </div>
                <!-- end logo -->
            </div>
            <div class="col">
                <div class="menu-link">
                  <%--  <img src="images/menu.svg" width="30" height="30" alt="menu">--%>
                </div>
                <!-- start navigation -->
                <div>
                  
                    <asp:Button ID="btnCandidateBackButton" runat="server" ToolTip="Back" Text=" Back" CssClass="candidateBackButton" OnClick="btnCandidateBackButton_Click"></asp:Button>
              
                </div>
                <!-- end navigation -->
            </div>
        </div>
    </div>
</div>
        <!--**********************************
        Content body start
    ***********************************-->
        <div class="main-container">
            <div class="container">
                <!-- Add Order -->
                
                <!-- start candidate-bar -->
                
                <!-- end candidate-bar -->
                <!-- row -->
                 <div class="interview-screen">
            
                <div class="row">
                    
                    <div class="col">
                         
                        
                   
                        <div class="row">
                              <div class="d-flex justify-content-center align-items-center">   <h6>  <span id="questionspan" class="questionhead">&nbsp;&nbsp;&nbsp;</span></h6></div>
                            <div class="col-lg-12" >
<center>

                                <div class="interview-video-profile" id="divinput">
                                    <video id="VideoPlayer" runat="server" src="" style="visibility:hidden;" autoplay playsinline controls  width="100%" height="100%" poster="https://extuent.ai/bg/bg18.jpg">

                                          
                                        </video>
                                </div>
                          </center>
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
                        
                        <div class="interview-pagination">
                         
                            

                                    <div style="text-align:center;">
                               

                                        <ul class="pagination pagination-xs pagination-circle" style="display: inline-flex;">
                                            <li class="page-item page-indicator">
                                                <a class="page-link" href="javascript:void(0)"  onclick="getPrevious();">
                                                    <i class="la la-angle-left"></i>
                                                </a>
                                            </li>
                                              <%
                                                  int j = 0;

                                                  for (int k = 0; k < VideoInterViewList.Count; k++)
                                                  {
                                                      j = j + 1;

                                                      {  %>
                                            <% if (j == 1)
                                                {%>
                                            <li class="page-item" id="jid_1">
                                                <a id="id_1" class="page-link" href="#" onclick="assignUrl('<%=j %>','<%= getQuestionName(VideoInterViewList[k].question_id.ToString()) %>','<%=VideoInterViewList[k].question_id %>','<%=VideoInterViewList[k].candidate_id %>');"><%=j %></a>
                                            </li>
                                            <%}
                                                else
                                                { %>
                                            <li id="jid_<%=j %>" class="page-item"><a id="id_<%=j %>" class="page-link" href="#" onclick="assignUrl('<%=j %>','<%= getQuestionName(VideoInterViewList[k].question_id.ToString()) %>','<%=VideoInterViewList[k].question_id %>','<%=VideoInterViewList[k].candidate_id %>');"><%=j %></a></li>
                                           
                                             <%}
                                                 } %>
                                            <%} %>
                                            <li class="page-item page-indicator">
                                                <a class="page-link" href="javascript:void(0)" onclick="getNext();">
                                                    <i class="la la-angle-right"></i>
                                                </a>
                                            </li>
                                        </ul>
                                         <br />
                                                   <img src="images/logo.png" width="120" height="30" alt="Extuent" id="divPhoneLogo" style="visibility: hidden;">
                           
                                    </div>

                             
                   
                        </div>
                        

                            </div>

                            <div class="col-xl-5 d-flex flex-column justify-content-start align-items-start pl-2">
                                <p> 
                            <span><%--<img src="../images/icon_phone.png" width="24" height="24" alt="phone">--%><asp:Label ID="lblPhone" runat="server" Text="" Visible="false"></asp:Label></span>
                            <span><%--<img src="../images/icon_email.png" width="24" height="24" alt="email">--%><asp:Label ID="lblEmail" runat="server" Text="" Visible="false"></asp:Label></span>
                        </p>
                                <div class="candidate-bar candidate-bar-profile">
                     
                    <div class="txtb">
                    
                        <h3>
                            <asp:Label ID="lblName" runat="server" Text="" ForeColor="Black"></asp:Label>: &nbsp;<br /><asp:Label ID="lblpositionName" runat="server" Text="" ForeColor="Black"></asp:Label>
                            <%--<span class="icon"><img src="../images/icon_mail.png" width="24" height="24" alt="mail"></span>--%>
                            <%--<span class="icon"><img src="../images/icon_linkedin.png" width="24" height="24" alt="linkedin"></span>--%>
                        </h3>

                       
                    </div>
                               
                </div>
                                <div class="candidate-interview-text">
                                    <div class="txt">
                                      <h5>Pricing: USD <asp:Label runat="server" ID="lblComments"></asp:Label></h5>
                                        </div>
                                    <div class="txt">
                                        <p>Availability: <asp:Label ID="lblnoticeperiod" runat="server" Text=""></asp:Label></p>
                                    </div>
                                    <div class="txt">
                                        <br />
                            <h5>Profile Summary:</h5>
                            <p><asp:Label runat="server" ID="exp1"></asp:Label></p>
                            <p><asp:Label runat="server" ID="exp2"></asp:Label></p>
                            <p><asp:Label runat="server" ID="exp3"></asp:Label></p>
                            <div class="links">
                              <%--  <a href="#" title="Download/View Resume" class="link">
                                    <img src="images/img_resume.png" width="40" height="40" alt="Download/View Resume">
                                    Download/View Resume
                                </a>--%>
                              <%--  <a href="#" title="Download Video" class="link">
                                    <img src="images/img_download_video.png" width="40" height="40" alt="Download Video">
                                    Download Video
                                </a>--%>
                            </div>
                            <br />
                                 <%--   <h5>Comments:</h5>--%>
                                  
                        </div>
                                    <div class="txt">
                                        <h5>Professional Skills:</h5>
                                        <p runat="server" id="lblskills"></p>
                                    </div>
                                    <div class="txt">
                                     <%--   <h5>Salary Details</h5>--%>
                                        <p><asp:Label ID="lbltotalctc" runat="server" Text="" Visible="false"></asp:Label></p>
                                        <p> <asp:Label ID="lblfixedctc" runat="server" Text="" Visible="false"></asp:Label></p>
                                    </div>
                                    
                                </div>
                                <!-- start candidate-rating -->
                                <div class="candidate-rating w-100">
                                    <%if (evalutiontext.Count > 0)
                                        { %>
                                    <div class="rat">
                                        <p><%=evalutiontext[0] %></p>
                                        <div class="star">
                                            <i class="fa fa-star g1" id="st1"></i>
                                            <i class="fa fa-star g1" id="st2"></i>
                                            <i class="fa fa-star g1" id="st3"></i>
                                            <i class="fa fa-star g1" id="st4"></i>
                                            <i class="fa fa-star g1" id="st5"></i>
                                        </div>
                                    </div>
                                    <%} %>
                                    <%if (evalutiontext.Count > 1)
                                        { %>
                                    <div class="rat">
                                        <p><%=evalutiontext[1] %></p>
                                        <div class="star">
                                            <i class="fa fa-star g2" id="st6"></i>
                                            <i class="fa fa-star g2" id="st7"></i>
                                            <i class="fa fa-star g2" id="st8"></i>
                                            <i class="fa fa-star g2" id="st9"></i>
                                            <i class="fa fa-star g2" id="st10"></i>
                                        </div>
                                    </div>
                                    <%} %>
                                    <%if (evalutiontext.Count > 2)
                                        { %>
                                    <div class="rat">
                                        <p><%=evalutiontext[2] %></p>
                                        <div class="star">
                                            <i class="fa fa-star g3" id="st11"></i>
                                            <i class="fa fa-star g3" id="st12"></i>
                                            <i class="fa fa-star g3" id="st13"></i>
                                            <i class="fa fa-star g3" id="st14"></i>
                                            <i class="fa fa-star g3" id="st15"></i>
                                        </div>
                                    </div>
                                    <%} %>
                                    <%if (evalutiontext.Count > 3)
                                        { %>
                                    <div class="rat">
                                        <p><%=evalutiontext[3] %></p>
                                        <div class="star">
                                            <i class="fa fa-star g4" id="st16"></i>
                                            <i class="fa fa-star g4" id="st17"></i>
                                            <i class="fa fa-star g4" id="st18"></i>
                                            <i class="fa fa-star g4" id="st19"></i>
                                            <i class="fa fa-star g4" id="st20"></i>
                                        </div>
                                    </div>
                                    <%} %>
                                    <%if (evalutiontext.Count > 4)
                                        { %>
                                    <div class="rat">
                                        <p><%=evalutiontext[4] %></p>
                                        <div class="star">
                                            <i class="fa fa-star g5" id="st21"></i>
                                            <i class="fa fa-star g5" id="st22"></i>
                                            <i class="fa fa-star g5" id="st23"></i>
                                            <i class="fa fa-star g5" id="st24"></i>
                                            <i class="fa fa-star g5" id="st25"></i>
                                        </div>
                                    </div>
                                    <%} %>
                                </div>
                                <div class="candidate-interview-text">
                                
                                    </div>
                                <!-- end candidate-rating -->
                                <!-- start comments -->
                                <div class="comments">
                                    <textarea id="txtCommentsarea" placeholder="enter comment..." runat="server" visible="false"></textarea>
                                    <div class="links">
                                     <%--   <a href="#" title="View Comments">View Comments</a>--%>
                                      <%--  <a href="#" title="Add Comment">Add Comment</a>--%>
                                    </div>
                                </div>
                                <!-- end comments -->
                                <!-- start candidate-action-bar -->
                                <div class="candidate-action-bar">
                                    <ul style="list-style:none;">
                                        <li class="pass">
                                           <%-- <button runat="server" id="p1" onclick="SaveRatings('Pass');" class="icon">
                                                <img src="../images/pass.png" width="90" height="90" alt="Pass">
                                            </button>
                                            <p>Pass</p>--%>
                                        </li>
                                        <li class="hold">
                                         <%--   <button runat="server" id="ho1" onclick="SaveRatings('Hold');" class="icon">
                                                <img src="../images/hold.png" width="90" height="90" alt="Hold">
                                            </button>
                                            <p>Hold</p>--%>
                                        </li>
                                        <li class="reject">
                                          <%--  <button runat="server" id="r1" onclick="SaveRatings('Reject');" class="icon">
                                                <img src="../images/reject.png" width="90" height="90" alt="Reject">
                                            </button>
                                            <p>Reject</p>--%>
                                        </li>
                                        <li class="hired">
                                            <%--<button runat="server" id="h1" onclick="SaveRatings('Hired');" class="icon">
                                                <img src="../images/hired.png" width="90" height="90" alt="Hired">
                                            </button>--%>
                                     <%--       <p>Hired</p>--%>
                                        </li>
                                    </ul>
                                </div>
                                <!-- end candidate-action-bar -->
                                </div>
                            </div>
                     </div>
                        </div>
                        <%--<div class="row">

                            <div class="col-xl-12">
                                <div class="card">

                                    <div class="card-body">
                                        <div id="accordion-four" class="accordion accordion-no-gutter accordion-bordered">

                                            <div class="accordion__item" >
                                                <div class="accordion__header collapsed" data-toggle="collapse" data-target="#bordered_no-gutter_collapseTwo">
                                                    <span class="accordion__header--text" ><asp:Label ID="lblresume" runat="server"></asp:Label></span>
                                                    <span class="accordion__header--indicator style_two"></span>
                                                </div>
                                                <div id="bordered_no-gutter_collapseTwo" class="collapse accordion__body" data-parent="#accordion-four">
                                                  
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>--%>
                    </div>

              <div class="imgb" style="visibility:hidden">
                        <img src="../images/candidate1.jpg" width="0" height="0" alt="candidate" id="imgprofile" runat="server">
                    </div>





        <div class="footer">
        <div class="container">
            <div class="row align-items-center">
                <div class="col">
                    <!-- start footer-links -->
                    <div class="footer-links">
                        <ul style="list-style:none;">
                           <%-- <li><a href="#" title="Terms of Use">Terms of Use</a></li>
                            <li><a href="#" title="Privacy Policy">Privacy Policy</a></li>
                            <li><a href="#" title="Help Articles">Help Articles</a></li>
                            <li><a href="#" title="Accessibility">Accessibility</a></li>
                            <li><a href="#" title="Contact Us">Contact Us</a></li>--%>
                        </ul>
                    </div>
                    <!-- end footer-links -->
                </div>
                <div class="col-auto">
                    <div class="footer-logo">
                        <p style="font-size:10px">Powered By</p>
                        <!-- start imgb -->
                        <div class="imgb">
                            <a href="" title="Extuent"><img src="images/logo.png" style="width:80px;height:25px"  
                                    alt="Extuent"></a>
                        </div>
                        <!-- end imgb -->
                    </div>
                </div>
            </div>
        </div>
    </div>

         <main style="display:none">
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

    
    </form>
    
    <link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css">

    <script src = "https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.min.js"> </script>
    <link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <script src="js/TensorFlow.js"></script>
    <script src="js/BodyPix.js"></script>
 	
    <script src="js/processor.js"></script>

    <script>
        document.getElementById("id_1").click();

        var playbackVElement = document.getElementById("VideoPlayer");
        playbackVElement.autoplay = false;
        //playbackVElement.preload = true;

        playbackVElement.poster = "https://extuent.ai/bg/clip3.png"
        // playbackVElement.pause();




    </script>
</body>

</html>
