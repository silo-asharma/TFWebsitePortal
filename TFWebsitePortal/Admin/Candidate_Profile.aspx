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
             background-image: url(https://extuent.ai/bg/bg1.jpg);
             background-repeat: no-repeat;
             background-size: cover;
             width: 100%;
             max-height: calc(100vh - 130px);
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

        @media (min-width: 280px) and (max-width: 767px) {
            .interview-video {
                width: 100% !important;
                height: 256px !important;
            }
        }

        @media only screen and (min-width: 768px) {
            .interview-video video {
                object-fit: contain;
                object-position: bottom;
            }
        }
    </style>
    <script>
        var strating_1 = 0;
        var strating_2 = 0;
        var strating_3 = 0;
        var strating_4 = 0;
        var strating_5 = 0;
        $(document).ready(function () {


            var rating;
            var ratings = "<%=canloginNow.rating%>";
            if (ratings != null && ratings != "")
                rating = ratings.split(',');

            strating_1 = rating[0];
            strating_2 = rating[1];
            strating_3 = rating[2];
            strating_4 = rating[3];
            strating_5 = rating[4];

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

        // var strating_1=0;
        // var strating_2=0;
        // var strating_3=0;
        // var strating_4=0;
        // var strating_5=0;
        var rating_string;
        $(document).ready(function () {
            // alert("1");
            $(".fa-star").css("color", "gray");
            $("#st1").click(function () {
                $(".g1").css("color", "gray");
                $("#st1").css("color", "green");
                strating_1 = 1;

            });
            $("#st2").click(function () {
                $(".g1").css("color", "gray");
                $("#st1, #st2").css("color", "green");
                strating_1 = 2;
            });
            $("#st3").click(function () {
                $(".g1").css("color", "gray")
                $("#st1, #st2, #st3").css("color", "green");
                strating_1 = 3;
            });
            $("#st4").click(function () {
                $(".g1").css("color", "gray");
                $("#st1, #st2, #st3, #st4").css("color", "green");
                strating_1 = 4;
            });
            $("#st5").click(function () {
                $(".g1").css("color", "gray");
                $("#st1, #st2, #st3, #st4, #st5").css("color", "green");
                strating_1 = 5;
            });
            $("#st6").click(function () {
                $(".g2").css("color", "gray");
                $("#st6").css("color", "green");
                strating_2 = 1;

            });
            $("#st7").click(function () {
                $(".g2").css("color", "gray");
                $("#st6, #st7").css("color", "green");
                strating_2 = 2;
            });
            $("#st8").click(function () {
                $(".g2").css("color", "gray")
                $("#st6, #st7, #st8").css("color", "green");
                strating_2 = 3;
            });
            $("#st9").click(function () {
                $(".g2").css("color", "gray");
                $("#st6, #st7, #st8, #st9").css("color", "green");
                strating_2 = 4;
            });
            $("#st10").click(function () {
                $(".g2").css("color", "gray");
                $("#st6, #st7, #st8, #st9, #st10").css("color", "green");
                strating_2 = 5;

            });
            $("#st11").click(function () {
                $(".g3").css("color", "gray");
                $("#st11").css("color", "green");
                strating_3 = 1;

            });
            $("#st12").click(function () {
                $(".g3").css("color", "gray");
                $("#st11, #st12").css("color", "green");
                strating_3 = 2;
            });
            $("#st13").click(function () {
                $(".g3").css("color", "gray")
                $("#st11, #st12, #st13").css("color", "green");
                strating_3 = 3;
            });
            $("#st14").click(function () {
                $(".g3").css("color", "gray");
                $("#st11, #st12, #st13, #st14").css("color", "green");
                strating_3 = 4;
            });
            $("#st15").click(function () {
                $(".g3").css("color", "gray");
                $("#st11, #st12, #st13, #st14, #st15").css("color", "green");
                strating_3 = 5;

            });
            $("#st16").click(function () {
                $(".g4").css("color", "gray");
                $("#st16").css("color", "green");
                strating_4 = 1;

            });
            $("#st17").click(function () {
                $(".g4").css("color", "gray");
                $("#st16, #st17").css("color", "green");
                strating_4 = 2;
            });
            $("#st18").click(function () {
                $(".g4").css("color", "gray")
                $("#st16, #st17, #st18").css("color", "green");
                strating_4 = 3;
            });
            $("#st19").click(function () {
                $(".g4").css("color", "gray");
                $("#st16, #st17, #st18, #st19").css("color", "green");
                strating_4 = 4;
            });
            $("#st20").click(function () {
                $(".g4").css("color", "gray");
                $("#st16, #st17, #st18, #st19, #st20").css("color", "green");
                strating_4 = 5;

            });
            $("#st21").click(function () {
                $(".g5").css("color", "gray");
                $("#st21").css("color", "green");
                strating_5 = 1;

            });
            $("#st22").click(function () {
                $(".g5").css("color", "gray");
                $("#st21, #st22").css("color", "green");
                strating_5 = 2;
            });
            $("#st23").click(function () {
                $(".g5").css("color", "gray");
                $("#st21, #st22, #st23").css("color", "green");
                strating_5 = 3;
            });
            $("#st24").click(function () {
                $(".g5").css("color", "gray");
                $("#st21, #st22, #st23, #st24").css("color", "green");
                strating_5 = 4;
            });
            $("#st25").click(function () {
                $(".g5").css("color", "gray");
                $("#st21, #st22, #st23, #st24, #st25").css("color", "green");
                strating_5 = 5;

            });


               <% if (canloginNow.job_apply_id != null)
        {

            if (context.job_post.FirstOrDefault(j => j.rec_id == canloginNow.job_apply_id) != null)
            {
                     %>

               var rating_Questions = "<%=context.job_post.FirstOrDefault(j => j.rec_id == canloginNow.job_apply_id).evalauation%>";

               document.getElementById("<%=hidRatingQuestions.ClientID%>").value = rating_Questions;
               
               
                   <% }
        }  %>

           });

        function SaveRatings(status) {
            var rating = strating_1 + "," + strating_2 + "," + strating_3 + "," + strating_4 + "," + strating_5;
            var rating_Questions;
               <% if (canloginNow.job_apply_id != null)
        {

            if (context.job_post.FirstOrDefault(j => j.rec_id == canloginNow.job_apply_id) != null)
            {
                     %>
               rating_Questions = "<%=context.job_post.FirstOrDefault(j => j.rec_id == canloginNow.job_apply_id).evalauation%>";
               <% }
        }  %>
               // alert(rating);
               //var rating = document.getElementById("<%=hidRating.ClientID%>").value;
               var rating_Questions = document.getElementById("<%=hidRatingQuestions.ClientID%>").value;
               var Comments = document.getElementById("<%=txtCommentsarea.ClientID%>").value;
               var Candidate_ID = "<%=vid %>";
               //alert(Comments);
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
                   // alert("Profile Saved..");
                   try {
                       document.getElementById("hdnisAction").value = "yes";


                       document.getElementById("lnkNextnew").click();
                   }
                   catch (ex) {
                       document.getElementById("btnCandidateBackButton").click();

                   }
                   // window.location.replace("candidate-interview-list?type=Back&&" + Session["Backqrystring"].ToString() + "");


               }

               event.preventDefault();
           }

           function OpenWindow() {
               var v = document.getElementById('lnkresume2')

               //  alert(v.href);
               window.open(v, '_blank', 'height=450,width=500,location=1,toolbar=0,scrollbars=1');
           }

           $(document).ready(function () {
               //   alert("2");

               strating_1 = 0;
               strating_2 = 0;
               strating_3 = 0;
               strating_4 = 0;
               strating_5 = 0;


               var ratings = "<%=canloginNow.rating%>";
              if (ratings != null && ratings != "")
                  rating = ratings.split(',');

              strating_1 = rating[0];
              strating_2 = rating[1];
              strating_3 = rating[2];
              strating_4 = rating[3];
              strating_5 = rating[4];

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
            // alert(q_no);
            var tabLink1 = document.querySelectorAll('.page-item');
            $('.page-item').removeClass('active'); // remove active for all first.
            $('#jid_' + q_no).addClass('page-item active');

            var candida_Id = parseInt(candidate_id);
            document.getElementById("questionspan").innerHTML = q_name;
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
            var resDevice = getDeviceNameorBrowser();
            //alert(resDevice);
            var browserName = fnBrowserDetect();

            //document.getElementById("VideoPlayer").src =response.d;

            const myArray = response.d.split(".");
            let URLforPlay = myArray[0];

            //let URLforPlay = myArray[0]+'.'+myArray[1];//live

            const myArray2 = URLforPlay.split("/");
            //alert(myArray2);
            let URLforPlay2 = URLDisplay + "//admin/Upload/MP4/" + myArray2[6];
            //alert(URLforPlay2);

            document.getElementById("VideoPlayer").style.visibility = "visible";
            //alert(browserName);
            if (resDevice == true) {




                document.getElementById("VideoPlayer").src = URLforPlay2 + '.mp4';

                document.getElementById('divinput').setAttribute("style", "background-image: url('https://extuent.ai/bg/blackscreen.png')")
                // document.getElementById("divPhoneLogo").style.visibility = "visible";

            }
            else if (resDevice == false && browserName == "safari") {
                document.getElementById("VideoPlayer").src = URLforPlay2 + '.mp4';
                document.getElementById('divinput').setAttribute("style", "background-image: url('https://extuent.ai/bg/blackscreen.png')")
                //document.getElementById("divPhoneLogo").style.visibility = "hidden";
            }
            else {
                document.getElementById("VideoPlayer").src = URLforPlay + '.webm';

                // document.getElementById("divPhoneLogo").style.visibility = "hidden";
            }

            $("video")[0].load();
            setTimeout(function () {



            }
                  , 1000);

        }
        function onBtnpreClicked() {

            // var previewdiv = document.getElementById("previewVideo");
            //previewdiv.hidden = false;
            var playbackVElement = document.getElementById("VideoPlayer");
            playbackVElement.autoplay = true;
            playbackVElement.controls = true;
            playbackVElement.muted = false;
            // playbackVElement.controls = false;
            playbackVElement.play();
            //playbackVElement.hidden = true;          


        }
    </script>

    <link rel="stylesheet" type="text/css" href="css_ext/style.css">
</head>
<body>
    
     <form id="form1" runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
         <asp:HiddenField ID="hidRating" runat="server" />
      <asp:HiddenField ID="hidRatingQuestions" runat="server" />
         <asp:HiddenField ID="hidPre" runat="server" />
           <asp:HiddenField ID="hidNext" runat="server" />
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
        <div class="content-body" style="margin-top:45px;padding-top:45px;">
            <div class="container-fluid" style="margin-top:0px;padding-top:0px;">
                <!-- Add Order -->
              
                <!-- start candidate-bar -->
                <div class="candidate-bar candidate-bar-admin">
                    <div class="imgb">
                        <img src="images/images.png" width="60" height="60" style="width:60px;height:60px;" alt="candidate" id="imgprofile" runat="server">
                    </div>
                    <div class="txtb">
                       <div class=" name-icons">
                            <div>
                            <h5>
                            <asp:Label ID="lblName" runat="server" Text=""></asp:Label>: &nbsp;<asp:Label ID="lblpositionName" runat="server" Text=""></asp:Label>
                            <span class="icon"><a href="mailto:<%= Session["Emailsend"].ToString() %>"><img src="../images/icon_mail.png" width="14" height="14" alt="mail"></a></span></h5>
                        </div>
                            <%--<span class="icon"><a href="https://in.linkedin.com" target="_blank"><img src="../images/icon_linkedin.png" width="14" height="14" alt="linkedin"></a></span>--%>
                            
                    
                        <div class="d-flex justify-content-center">
                             <div>
                                <asp:Button ID="btnCandidateBackButton" runat="server" ToolTip="Back" Text="" CssClass="candidateBackButtonNew" OnClick="btnCandidateBackButton_Click"></asp:Button>
                            </div>

                                <div>
                                                     <% if (Request.QueryString["vid"] != null)
                                                         {
                                                             string returnquery = backqueryString();


                                                  %>
                                                        <div class="candidateBackButtonAllProfile">
                                                            <a href="candidate-profile?vid=<%= Request.QueryString["vid"] %>&&edit=true<%= returnquery %>" title="edit"><img src="../images/icon_edit.png" width="20" height="20" alt="edit"></a>
                                                           <% if (getVideoConverstion(Convert.ToInt32(Request.QueryString["vid"])) == true)
                                                               { %>
                                                             <a href="Email-Send?emailhidden=-<%= Request.QueryString["vid"]%><%= returnquery %>" title="share"><img src="../images/icon_share.png" width="20" height="20" alt="share"></a>
                                                            <%} %>
                                                            <a href="candidate-interview-list?type=Back&&del=<%=Request.QueryString["vid"] %><%= returnquery %>" title="delete"><img src="../images/icon_delete.png" width="20" height="20" alt="delete"></a>
                                                            <a href="Email-Send?emailRetake=<%= Request.QueryString["vid"] %><%= returnquery %>" title="retake"><img src="../images/retake_admin.png" width="20" height="20" alt="share"></a>
                                                        </div>
                                    
                                         <%} %>
                            </div>
                        </div>
                       </div>
                     

                    
                            
                            
                            
                            <%--     <span class="icon"><a href="candidate-interview-list?type=All">Back</a></span>--%>
                        
                       
                        <div class=" name-icons">
                            <div>
                                <p>
                                    <span><img src="../images/icon_phone.png" width="10" height="10" alt="phone"><asp:Label ID="lblPhone" runat="server" Text=""></asp:Label></span>
                                    <span><img src="../images/icon_email.png" width="10" height="10" alt="email"><asp:Label ID="lblEmail" runat="server" Text=""></asp:Label>&nbsp;&nbsp;&nbsp;<span style="color:orangered"><%=currentresult %></span></span>
                                </p>
                            </div>

                            <div class="d-flex justify-content-between w-pre-next">
                                 <div class="mr-2">
                                <asp:LinkButton id="lnkprenew" runat="server" CssClass="mr-3" Text="Prev" OnClick="lnkprenew_Click"></asp:LinkButton><asp:LinkButton id="lnkNextnew" runat="server" Text="Next" OnClick="lnkNextnew_Click"></asp:LinkButton>
                            </div>

                               
                            </div>
                        </div>
                        
                         
                    </div>
                         
                </div>
               
                <!-- end candidate-bar -->
                <!-- row -->
                <span style="font-weight:bold;font-size:14px;" id="questionspan">&nbsp;&nbsp;&nbsp;</span>
                <div class="row">
                    <div class="col-md-7">

                        <div class="row" style="height:370px;">

                            <div class="col-lg-12" >
                                <div class="profile card card-body p-0 interview-video" style="background-image: url(<%=   Session["background_url"].ToString() %>);background-repeat: no-repeat;background-size: cover;width:100%;height:347px ;border-radius:12px;border-color:#FF7416;">
                                 
                                               <%-- <img src="images/profile/p6.png" alt="" style="width:100%;height:451px;">--%>
                                               <%--  <div style="width: 100%; z-index: -1; border-radius:12px;border-color:#FF7416; float:left;" id="previewVideo" runat="server"> 
                                                  <input type="button"  id="btnpreview" runat="server" onclick="onBtnpreClicked()" value="Play Preview" style="display:none;"/> 
                                                     <canvas id="c2"  runat="server" width="640" height="480" style=" height: auto; margin: 0;border-radius:12px;border-color:#FF7416;" ></canvas>  
                                                     <canvas id="c1" runat="server" width="640" height="480" style=" height: auto; margin: 0a;" hidden></canvas>
                                                </div>--%>
                                                <video  id="VideoPlayer" runat="server" src="" style="visibility:visible;border-radius: 12px;"  controls  autoplay   height="100%" width="100%"    poster="https://extuent.ai/bg/bg18.jpg"/>
                                         
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

                                    </div>

                                </div>
                            </div>
                        </div>

                
                                    <div class="card" style="background-color:white;border:0px;">
                                         <div class="card-header d-block" style="background-color:white;" id="diveditProfileSummary" runat="server" visible="false">
                                            <h6 class="m-b-0">Profile Summary:</h6>

                                                   <p class="mb-0 subtitle">
                                                <asp:Label runat="server" ID="lblStart1" Text="Start Date"></asp:Label>
                                                <asp:Label runat="server" ID="TextBox2" Text="End Date"></asp:Label>
                                                <asp:Label runat="server" ID="TextBox3" Text="Title"></asp:Label>
                                                <asp:Label runat="server" ID="TextBox4" Text="Company"></asp:Label>
</p>
                                            
                                            <p class="mb-0 subtitle">

                                                <asp:TextBox TextMode="Date" runat="server" ID="from"></asp:TextBox>
                                                <asp:TextBox TextMode="Date" runat="server" ID="to"></asp:TextBox>
                                                <asp:TextBox runat="server" ID="title"></asp:TextBox>
                                                <asp:TextBox runat="server" ID="company"></asp:TextBox>
</p>
                                            <p class="mb-0 subtitle">
                                                <asp:TextBox runat="server" TextMode="Date" ID="from1"></asp:TextBox>
                                                <asp:TextBox runat="server" TextMode="Date" ID="to1"></asp:TextBox>
                                                <asp:TextBox runat="server" ID="title1"></asp:TextBox>
                                                <asp:TextBox runat="server" ID="company1"></asp:TextBox>
                                            </p>
                                            <p class="mb-0 subtitle">
                                                    <asp:TextBox runat="server" TextMode="Date" ID="from2"></asp:TextBox>
                                                <asp:TextBox runat="server" TextMode="Date" ID="to2"></asp:TextBox>
                                                <asp:TextBox runat="server" ID="title2"></asp:TextBox>
                                                <asp:TextBox runat="server" ID="company2"></asp:TextBox>
                                            </p>
                                            <br />
                                              <asp:Button  ID="btnsaveedit" runat="server" Text="Save Edit" OnClick="btnsaveedit_Click" CssClass="btn"/>
                                           
                                            <br />
                                            <br />
                                        </div>


                                        <div class="card-header d-block" style="background-color:white;" id="divProfileSummary" runat="server">
                                            <h6 class="m-b-0">Profile Summary:</h6>

                                            <%-- <%
                                                 for (int kl = 0; kl < canExpList.Count; kl++)
                                                 {
                                                   %>

                                               <p class="mb-0 subtitle">
                                                    
                                                   <label><%= (Convert.ToDateTime(canExpList[kl].start_date).ToString("MMM") + " " + Convert.ToDateTime(canExpList[kl].start_date).Year.ToString() + "-" + Convert.ToDateTime(canExpList[kl].end_date).ToString("MMM") + " " + Convert.ToDateTime(canExpList[kl].end_date).Year.ToString() + ", " + canExpList[kl].job_title.ToString() + ", " + canExpList[kl].company_name.ToString()); %></label>
                                                
</p>
                                             <%} %>--%>

                                            <p class="mb-0 subtitle"><asp:Label runat="server" ID="exp1"></asp:Label>
</p>
                                            <p class="mb-0 subtitle">
                                                <asp:Label runat="server" ID="exp2"></asp:Label>
                                            </p>
                                            <p class="mb-0 subtitle">
                                               <asp:Label runat="server" ID="exp3"></asp:Label>
                                            </p>
                                            <br />
                                           
                                            <a href="javascript:void(0)">
                                              <%--  <i class="fa fa-video-camera text-primary mr-2"></i>Download Video--%>
                                            </a>
                                            <br />
                                            <br />
                                            
                                        </div>
                                         
                                    </div>
                                </div>

                              

                            <div class="col-md-5">
                                <div class="candidate-interview-text">
                                    <div class="txt">
                                        <h5>Professional Skills:</h5>
                                        <p runat="server" id="lblskills"></p>
                                      <textarea id="txtSkills" runat="server" style="background-color:white;border-color:white;width: 100%; min-height: 86px;resize: none" Visible="false"></textarea>
                                         
                                      
                                         <asp:Button  ID="btnSaveSkilss" runat="server" Text="Save" OnClick="btnSaveSkilss_Click" CssClass="btnnew" Visible="false"/>
                                    </div>
                                    
                                    <div class="txt">
                                        <h5>Salary Details</h5>
                                        <p>Current Monthly Salary: <%= currencyloc %> <asp:Label ID="lbltotalctc" runat="server" Text=""></asp:Label></p>
                                        <p>Expected Monthly Salary: <%= currencyloc %>  <asp:Label ID="lblfixedctc" runat="server" Text=""></asp:Label></p>
                                      <br /><table style="width:100%"><tr><td style="width:22%;font-size:14px;">Pricing: USD</td><td style="width:78%"> <textarea id="txtSalaryDetailsForCustomer" placeholder="Enter Pricing Details" runat="server" rows="1" style="font-size:14px;background-color:white;border-color:white;width: 80%; min-height: 16px;resize: none;margin-top:7px;text-align:left"></textarea></td></tr></table>
                                    </div>
                                    <div class="txt">
                                        <p>Availability: <asp:Label ID="lblnoticeperiod" runat="server" Text=""></asp:Label> </p>
                                          <p>Application Date: <asp:Label ID="lblApplicationDate" runat="server" Text=""></asp:Label> </p>
                                         <p>   <asp:DropDownList ID="ddlNoticeP" runat="server" class="custom-select form-control" Visible="false">
                                                                    <asp:ListItem Value="Notice Period">Notice Period</asp:ListItem>
                                                                    <asp:ListItem Value="Immediate">Immediate</asp:ListItem>
                                                                    <asp:ListItem Value="Within 30 days">Within 30 days</asp:ListItem>
                                                                    <asp:ListItem Value="Within 60 days">Within 60 days</asp:ListItem>
                                                                    <asp:ListItem Value="More than 60 days">More than 60 days</asp:ListItem>
                                                                </asp:DropDownList>
                                             </p>
                                            
                                             <asp:Button  ID="btnsavenoticePer" runat="server" Text="Save" OnClick="btnsavenoticePer_Click" CssClass="btnnew" Visible="false"/>
                                     
                                    </div>
                                </div>
                                <!-- start candidate-rating -->
                                <div class="candidate-rating">
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
                                <!-- end candidate-rating -->
                                <!-- start comments -->
                                <div class="comments">
                                    <textarea id="txtCommentsarea" placeholder="Enter Comment..." runat="server" style="font-size:14px;background-color:white;border-color:white"></textarea>
                                    <div class="links">
                                       <%-- <a href="#" title="View Comments">View Comments</a>--%>
                                      <%--  <a href="#" title="Add Comment">Add Comment</a>--%>
                                    </div>
                                </div>
                                <!-- end comments -->
                                <!-- start candidate-action-bar -->
                                <% if (Actualcurrentresult != "In Process")
                                    { %>
                               
                                <div class="candidate-action-bar" id="divComplete">
                                    <ul style="list-style: none;">
                                        <li class="pass">
                                            <button runat="server" id="p1" onclick="SaveRatings('Pass');" class="icon">
                                                <img src="../images/pass.png" width="90" height="90" alt="Pass">
                                            </button>
                                            <p>Pass</p>
                                        </li>
                                        <li class="hold">
                                            <button runat="server" id="ho1" onclick="SaveRatings('Hold');" class="icon">
                                                <img src="../images/hold.png" width="90" height="90" alt="Hold">
                                            </button>
                                            <p>Hold</p>
                                        </li>
                                        <li class="reject">
                                            <button runat="server" id="r1" onclick="SaveRatings('Reject');" class="icon">
                                                <img src="../images/reject.png" width="90" height="90" alt="Reject">
                                            </button>
                                            <p>Reject</p>
                                        </li>
                                        <li class="hired">
                                            <button runat="server" id="h1" onclick="SaveRatings('Hired');" class="icon">
                                                <img src="../images/hired.png" width="90" height="90" alt="Hired">
                                            </button>
                                            <p>Hired</p>
                                        </li>
                                    </ul>
                                </div>
                                <%}
                                else
                                { %> 
                                <div class="candidate-action-bar" id="divInProcess" style="margin-left:150px;">
                                   <ul style="list-style: none;">
                                     
                                       
                                        <li class="hired">
                                            <button runat="server" id="f1" onclick="SaveRatings('Followup');" class="icon">
                                                <img src="../images/hired.png" width="90" height="90" alt="Follow up">
                                            </button>
                                            <p>Follow up</p>
                                        </li>
                                          
                                    </ul>
                                    
                                </div>
       
                                <%} %>
                                <!-- end candidate-action-bar -->
                                </div>
                           
                        </div>
                        <div class="row">

                            <div class="col-xl-12">
                                <div class="card">

                                    <div class="card-body">
                                        <div id="accordion-four" class="accordion accordion-no-gutter accordion-bordered">

                                            <div class="accordion__item" >
                                                <div class="accordion__header collapsed" data-toggle="collapse" data-target="#bordered_no-gutter_collapseTwo">
                                                    <span class="accordion__header--text" >Click To View Resume<asp:Label ID="lblresume" runat="server" Visible="false"></asp:Label></span>
                                                    <span class="accordion__header--indicator style_two"></span>
                                                </div>
                                                 <div id="bordered_no-gutter_collapseTwo" class="collapse accordion__body" data-parent="#accordion-four">
                                                  <% 



                                                      if (fileTypefordisplay == "pdf")
                                                      { %>
                                                     <div class="accordion__body--text">
                                                        <%--<iframe src="https://docs.google.com/gview?url=<%= DocURLfordisplay %>&embedded=true" width="100%" height="500px" allowtransparency="true" style="background: #FFFFFF;" frameborder="0"></iframe>--%>
                                                      <object data="<%= DocURLfordisplay %>#toolbar=0&navpanes=0" type="application/pdf" width="100%" height="500px" allowtransparency="true" style="backgroundColor: #FFFFFF;" frameborder="0"">
                                                         <embed src="https://docs.google.com/gview?url=<%= DocURLfordisplay %>&embedded=true" width="100%" height="500px" allowtransparency="true" style="backgroundColor: #FFFFFF;" frameborder="0""/> 
                                                           </object>

                                                         <% }
                                                             else
                                                             {%>

                                                    <iframe src='https://view.officeapps.live.com/op/embed.aspx?src=<%= DocURLfordisplay %>'width="100%" height="500px" allowtransparency="true" style="background: #FFFFFF;" frameborder="0">This is an embedded <a target='_blank' href='http://office.com'>Microsoft Office</a> document, powered by <a target='_blank' href='http://office.com/webapps'>Office Online</a>.</iframe>
                                             
                                                         <%} %>
                                                         </div>
                                                </div>
                                            </div>

                                        </div>
                                        <div style="text-align:right;"> <a  href="javascript:void(0)">
                                                <i class="fa fa-file-text-o text-primary mr-2"></i>
                                                <a href="#" onclick="OpenWindow();">Download / View Resume </a>
                                            <%--    <a href="#" onclick="OpenWindow();"></a>--%>
                                            </a>
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
     <div>
         <div class="row">
                              
                                <div class="col-xl-3 col-md-3">
                                    <asp:DropDownList ID="ddlCategory" runat="server" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" Visible="false" ForeColor="#808080">
                                    
                                         
                                            
                                        </asp:DropDownList>    
                                            
                                  
                                </div>
                                <div class="col-xl-3 col-md-3">
                                       <asp:DropDownList ID="ddlAllJob" runat="server" class="form-control" placeholder="Listed Jobs" AutoPostBack="true"  Visible="false" ForeColor="#808080">
                                           <asp:ListItem Value="">Job Ttile</asp:ListItem>
                                               
                                        </asp:DropDownList>
                                  
                                </div>
                                <div class="col-xl-3 col-md-3">

                                     <asp:DropDownList ID="ddlResult" runat="server" class="form-control" AutoPostBack="true" Visible="false" ForeColor="#808080">
                                             <asp:ListItem Value="0">Application Status</asp:ListItem>
                                             <asp:ListItem Value="Completed">Completed</asp:ListItem>
                                               <asp:ListItem Value="Pending">In Process</asp:ListItem>
                                               <%--<asp:ListItem Value="On Hold">On Hold</asp:ListItem>
                                               <asp:ListItem Value="Shortlisted">Shortlisted</asp:ListItem>
                                              <asp:ListItem Value="Rejected">Rejected</asp:ListItem>--%>
                                        </asp:DropDownList>
                                    
                                </div>
                                <div class="col-xl-3 col-md-3">
                                    <asp:DropDownList ID="ddlDescStatus" runat="server" class="form-control" AutoPostBack="true"  Visible="false" ForeColor="#808080">
                                             <asp:ListItem Value="0">Decision Status</asp:ListItem>
                                          <asp:ListItem Value="Followup">Follow up </asp:ListItem>
                                          <asp:ListItem Value="Pending">Pending</asp:ListItem>
                                          <asp:ListItem Value="Pass">Pass</asp:ListItem>
                                               <asp:ListItem Value="Hold">On Hold</asp:ListItem>
                                               <asp:ListItem Value="Reject">Reject</asp:ListItem>
                                        <asp:ListItem Value="Hired">Hired</asp:ListItem>
                                  </asp:DropDownList>
                                </div>
                                <div class="col-xl-0 col-md-3">
 <asp:DropDownList ID="ddlCountry" runat="server" class="form-control" AutoPostBack="true" Visible="false" ForeColor="#808080" Font-Size="13px">
                                             <asp:ListItem Value="0">Countries</asp:ListItem>
                                        <asp:ListItem Value="Philippines">Philippines</asp:ListItem>
                                          <asp:ListItem Value="India">India</asp:ListItem>
                                          <asp:ListItem Value="USA">United States</asp:ListItem>
                                            
                                  </asp:DropDownList>
                                   <%-- &nbsp;<asp:Button ID="Button2" runat="server" Text="search" style="background-image:border:none;width:45px;height:45px" usesubmitbehavior="false" OnClick="Button2_Click"  />--%>
                                </div>
                              
                            </div>
     </div>
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
    
     <asp:DropDownList ID="ddlResult1" runat="server" class="custom-select form-control" >
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
       
          <asp:HiddenField ID="hdnisAction" runat="server" />
        <asp:HiddenField ID="hdnNext" runat="server" />
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
        playbackVElement.autoplay = true;
        //playbackVElement.preload = true;

        playbackVElement.poster = "https://extuent.ai/bg/clip3.png"
        // playbackVElement.pause();




    </script>
        
</body>
</html>
