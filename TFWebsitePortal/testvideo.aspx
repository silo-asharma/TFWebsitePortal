<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testvideo.aspx.cs" Inherits="Extuent.testvideo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 
    <meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Extuent</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="./images/favicon.png">
<link rel="stylesheet" href="./vendor/chartist/css/chartist.min.css">
<link href="./vendor/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet">
<link href="./vendor/owl-carousel/owl.carousel.css" rel="stylesheet">
<link href="./css/style.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&family=Roboto:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link href="assets/css/update-style.css" rel="stylesheet">

 <script src="js/jquery-1.4.1.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        #canvas {
            background-image: url(https://image.freepik.com/free-photo/grey-sofa-simple-living-room-interior-3d-rendering_41470-3898.jpg);
             background-repeat: no-repeat;
            background-size: cover;
            margin-bottom: 10px;
        }
         #c2 {
        background-image: url(https://image.freepik.com/free-photo/grey-sofa-simple-living-room-interior-3d-rendering_41470-3898.jpg);
        background-repeat: no-repeat;
      }
    <style>
    .relative {
  position: absolute;
  top: 80px;
  right: 0;

}
</style>
    <style>
        .button{
                flex-grow: 1;
 
    border: none;
    border-radius: 0;
    background: #FF6700;
    
   
    cursor: pointer;
  
    
    color: #ffffff;
    font-weight: bold;
    font-size: 1rem;
        }
        .buttondisabled {
             flex-grow: 1;
   
    border: none;
    border-radius: 0;
    background: #FFf;
   
    
    cursor: pointer;
    pointer-events: none;
    background: lightgray;
     align-items: center;
    color: #ffffff;
 
    font-size: 1rem;
}
    </style>
     <script type='text/javascript'>
        $(document).ready(function () {
            setTimeout(function () {
             
                var divControls = document.getElementById("<%=controls.ClientID%>").style.visibility='visible';
                divControls.hidden = false;
           
            }
           , 1000);
        });
</script>
    <script>
        var retake = 0;
        var currentTme=0;
        function removeDisabled() {
         
            document.getElementById("<%=reTakeBtn.ClientID%>").disabled = false;
            document.getElementById("<%=reTakeBtn.ClientID%>").className = "button";
            $('#time').text(currentTme); clearInterval(interval);
            document.getElementById("<%=btnNext.ClientID%>").disabled = false;
            document.getElementById("<%=btnNext.ClientID%>").className = "button";
            document.getElementById("<%=previewVideo.ClientID%>").style.visibility = 'visible';
            document.getElementById("<%=c1.ClientID%>").style.visibility = 'hidden';
            document.getElementById("<%=c2.ClientID%>").style.visibility = 'hidden';
            document.getElementById("<%=btnpreview.ClientID%>").className = "button";
            document.getElementById("<%=stop.ClientID%>").style.visibility = 'hidden';
          
        }
        function onBtnpreClicked() {
            var divLive = document.getElementById("divLive");
            divLive.hidden = true;
            var previewdiv = document.getElementById("previewVideo");
            previewdiv.hidden = false;
            var playbackVElement = document.getElementById("playback");
            playbackVElement.autoplay = true;
            playbackVElement.controls = true;
            playbackVElement.muted = false;
            // playbackVElement.controls = false;
            playbackVElement.play();
            //playbackVElement.hidden = true;          
            document.getElementById("<%=c2.ClientID%>").style.visibility = 'visible';
        }
        function onBtnstopPreview() {
          
            var playbackVElement = document.getElementById("playback");
            playbackVElement.pause();
           
        }
        function reTake() {
            var previewdiv = document.getElementById("previewVideo");
            previewdiv.hidden = true;
            var divLive = document.getElementById("divLive");
            divLive.hidden = false;
            document.getElementById("<%=btnpreview.ClientID%>").className = "buttondisabled";
              document.getElementById("<%=btnNext.ClientID%>").className = "buttondisabled";
            var reTake = "<%=Session["ReTake"]%>";
            if (retake < parseInt(reTake)) {
              
                retake = retake + 1;
                $('#retakeCount').html('Retake:' + (parseInt(reTake) - retake));
                timerset();
                onBtnReTakeClicked();
            }
            else {
                document.getElementById("<%=btnNext.ClientID%>").className = "button";
                $("#lblUploadFiles").html("You have retaken max. times.please move to next question.Thanks!!!");
            }
        }
        var interval;
        function timerset() {
            document.getElementById("<%=stop.ClientID%>").style.visibility = 'visible';
              document.getElementById("<%=rec.ClientID%>").style.visibility = 'hidden';
            $("#lblUploadFiles").html("");
              document.getElementById("<%=fafaIconwatch.ClientID%>").style.visibility = 'visible';
            var Qtime = '<% =Session["Timer"]%>';
            $('#time').text(Qtime);
            countdown();
        }
        function countdown() {
            clearInterval(interval);
            interval = setInterval(function () {
                var timer = $('#time').html();
                timer = timer.split(':');
                var minutes = timer[0];
                var seconds = timer[1];
                seconds -= 1;
                if (minutes < 0) return;
                else if (seconds < 0 && minutes != 0) {
                    minutes -= 1;
                    seconds = 59;
                }
                else if (seconds < 10 && length.seconds != 2) seconds = '0' + seconds;

                $('#time').html(minutes + ':' + seconds);
                currentTme = minutes + ':' + seconds;
              
                if (minutes == 0 && seconds == 0) clearInterval(interval);
                if (minutes == 0 && seconds == 0) {
                    onBtnStopClicked();
                }
            }, 1000);
        }

       
        function uploadFiles() {
            retake = 0;
            var Question = "<%=question%>";
            var questions = Question.split(';');
          
            var JobId = "<%=JobId%>";
             var CandidateID = "<%=Session["CandidateId"]%>";
            var QuestionNo = document.getElementById("<%=hdfquestion.ClientID %>").value;
            var i = QuestionNo;
            const blob = new Blob(chunks, { type: 'video/webm' });
           
            const url = window.URL.createObjectURL(blob);
         
            var formData = new FormData();
            formData.append('videoblob', blob);
            formData.append('name', 'ss');
            formData.append('Question', questions[i]);
            formData.append('JobId', JobId);
            formData.append('CandidateId', CandidateID);
            const xhr = $.ajaxSettings.xhr();
            $("progress").show();
            xhr.upload.addEventListener("progress", function (e) {
                if (e.lengthComputable) {
                    $("#fileProgress").attr({
                        value: e.loaded,
                        max: e.total
                    });
                }
            }, false);
            xhr.open("POST", "test.ashx");
            xhr.send(formData);
            xhr.onreadystatechange = function () {
          
                //alert(xhr.readyState);
                //Call a function when the state changes.
                if (xhr.readyState == XMLHttpRequest.DONE) {
                    $("#fileProgress").hide();
                    $("#lblmsg").html(xhr.responseText);
                    $("#lblUploadFiles").html("Interview Video Successfully Uploaded.Please Move To Next Question");
                    i = parseInt(i) + 1;
                    document.getElementById("<%= hdfquestion.ClientID %>").value = i;
                    document.getElementById("<%=reTakeBtn.ClientID%>").disabled = true;
                    document.getElementById("<%=reTakeBtn.ClientID%>").className = "buttondisabled";
                    document.getElementById("<%=btnpreview.ClientID%>").className = "buttondisabled";
                    document.getElementById("<%=reTakeBtn.ClientID%>").disabled = true;
                    var divLive = document.getElementById("divLive");
                    divLive.hidden = false;
                    var divLive = document.getElementById("divLive");
                    divLive.hidden = false;
                    var previewdiv = document.getElementById("previewVideo");
                    previewdiv.hidden = true;
                    var recBtn = document.querySelector('button#rec');
                    recBtn.disabled = false;
                        document.getElementById("<%=rec.ClientID%>").style.visibility = 'visible';
                    $('#retakeCount').html('');
                    document.getElementById("<%=btnNext.ClientID%>").className = "buttondisabled";
                      document.getElementById("<%=fafaIconwatch.ClientID%>").style.visibility = 'hidden';
                       $('#time').text('');
                    if (i >= questions.length-1) {                       
                        window.location.replace("thank_you.aspx?JobID="+JobId+"&CandidateID="+CandidateID);
                     
                    }
                    $("#lblmsg").html("Question " + (parseInt(i) + 1) + ":-" + questions[i]);
                  
                       // $("#lblmsg").html("Interview Successfully Completed,Thanks No More Questions.");
                    if (xhr.responseText != null && xhr.responseText.trim() != "") {
                        //$("#fileProgress").hide();
                        //$("#lblmsg").html("Interview Video Successfully Uploaded.");
                        //$("#lblUploadFiles").html("Interview Video Successfully Uploaded.");
                        //alert(xhr.responseText);

                        return;
                    }
                }
            }
        }
        function onSavevideo() {
            alert();
            $.ajax({
                type: "POST",
                url: "Create_Video_Interview.aspx/save",
                data: '{name: "' + "as" + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess,
                failure: function (response) {
                    alert(response.d);
                }
            });

        }
        function OnSuccess(response) {
            alert(response.d);
        }

       
    </script>
    <style>
        #progressbar {
    margin-bottom: 3vh;
    overflow: hidden;
    color: rgb(252, 103, 49);
    padding-left: 0px;
    margin-top: 3vh;
    margin-left:22%;
    float:center;
    
}

#progressbar li {
    list-style-type: none;
    font-size: 12px;
    width: 25%;
    float: left;
    position: relative;
    font-weight: 400;
    color: rgb(160, 159, 159)
}

#progressbar #step1:before {
    content: "";
    color: rgb(252, 103, 49);
    width: 5px;
    height: 5px;
    margin-left: 0px !important
}

#progressbar #step2:before {
    content: "";
    color: #fff;
    width: 5px;
    height: 5px;
    margin-left: 32%;
}

#progressbar #step3:before {
    content: "";
    color: #fff;
    width: 5px;
    height: 5px;
    margin-right: 32%
}

#progressbar #step4:before {
    content: "";
    color: #fff;
    width: 5px;
    height: 5px;
    margin-right: 0px !important
}

#progressbar li:before {
    line-height: 29px;
    display: block;
    font-size: 12px;
    background: #ddd;
    border-radius: 50%;
    margin: auto;
    z-index: -1;
    margin-bottom: 1vh
}

#progressbar li:after {
    content: '';
    height: 2px;
    background: #ddd;
    position: absolute;
    left: 0%;
    right: 0%;
    margin-bottom: 2vh;
    top: 1px;
    z-index: 1
}

.progress-track {
    padding: 0 10%
}

#progressbar li:nth-child(2):after {
    margin-right: auto
}

#progressbar li:nth-child(1):after {
    margin: auto
}

#progressbar li:nth-child(3):after {
    float: left;
    width: 68%
}

#progressbar li:nth-child(4):after {
    margin-left: auto;
    width: 132%
}

#progressbar li.active {
    color: black
}

#progressbar li.active:before,
#progressbar li.active:after {
    background: rgb(252, 103, 49)
}
    </style>



</head>
<body>
    <form id="form1" runat="server">
   
<!--*******************
        Preloader start
    ********************-->
<div id="preloader">
  <div class="sk-three-bounce">
    <div class="sk-child sk-bounce1"></div>
    <div class="sk-child sk-bounce2"></div>
    <div class="sk-child sk-bounce3"></div>
  </div>
</div>
<!--*******************
        Preloader end
    ********************--> 

<!-- [Header] -->
<header>
    <div class="container-fluid">
        <div class="header-wrap">
            <div class="logo"> <a href="index.html"> <img class="logo-compact img-fluid" src="./images/logo.png" alt=""> </a> </div>
            <div class="menu-wrap">
              <nav class="navbar navbar-expand-md navbar-light" aria-label="Primary Menu">
                <div class="container-fluid">
                  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#primaryNav" aria-controls="primaryNav" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
                  <div class="collapse navbar-collapse" id="primaryNav">
                    <ul class="navbar-nav me-auto mb-2 mb-md-0">
                      <li class="nav-item"> <a class="nav-link" href="#">Features</a> </li>
                      <li class="nav-item"> <a class="nav-link" href="#">Clients</a> </li>
                      <li class="nav-item"> <a class="nav-link" href="#">Login</a> </li>
                      <li class="nav-item"> <a class="nav-link" href="#">Pricing</a> </li>
                      <li class="nav-item"> <a class="nav-link" href="#">Get Demo</a> </li>
                    </ul>
                  </div>
                </div>
              </nav>
            </div>
          </div>
    </div>
</header>
<!-- [/Header] --> 

<!--**********************************
        Main wrapper start
    ***********************************-->
    <style>
      
    </style>
<div id="main-wrapper">
  <section class="main-section">
    <div class="container-fluid"> 
      <div class="row"> 
        <div class="col-sm-8 col-xs-12 mx-auto">
          <!-- [Interview Process Wrap] -->
          <div class="interview-process-wrap">
            <h3 class="post-head text-center">Demand Generation Specialist</h3>
            <!-- [Interview Steps] -->
            <div class="interview-steps-box">
              <ul class="interview-progressbar">
                <li class="active">1</li>
                <li class="">2</li>
                <li>3</li>
                <li>4</li>
                <li>5</li>
                <li>6</li>
                <li>Upload</li>
                </ul>
            </div>
            <!-- [/Interview Steps] -->

            <!-- [Interview Qsn & Time] -->
            <div class="interview-quesn-box row">
              <div class="col-sm-8 col-xs-12">
                <p class="qsn-block">
                  <strong>Question 1: </strong> <label for="skills" class="form-label" id="lblmsg" runat="server">Question 1:- What is your name? </label>
                </p>
              </div>
              <div class="col-sm-4 col-xs-12 time-limit">
                <p><i class="fa fa-clock-o" style="font-size:18px;color:#FF6700;visibility:hidden;" id="fafaIconwatch" runat="server" ></i><strong>Time Limit: </strong><span> <span id="time"></span></span> minute(s)</p>
              </div>
            </div>
            <!-- [/Interview Qsn & Time] -->

            <!-- [Video Frame] -->
            <div class="video-frame">
              <div  id="divLive">
        <video id="live" width="440" style="visibility:hidden;" height="400" controls autoplay playsinline muted></video>
            <canvas id="canvas" width="440" height="400" ></canvas>
	</div>
          
        
      <div style="visibility:hidden;" id="previewVideo" runat="server"> 
        <video id="playback"  controls  muted controls="true" >Preview</video>
         <canvas id="c2"  runat="server" width="640" height="600" ></canvas>
         <canvas id="c1" runat="server" width="640" height="600" ></canvas>
      </div>
            </div>
            <!-- [/Video Frame] -->

            <!-- [CTA Row] -->
            <div id="controls" runat="server" class="row cta-row mt-3 mb-5">
              <div class="col-sm-4 text-center option-1">
                <a href="#"><img src="images/reload.png" alt=""><input type="button" name="reTakeB" id="reTakeBtn"  runat="server" class="buttondisabled" value="" disabled="disabled" onclick="reTake();" />Retake</a>
                <a href="#">  <input type="button"  id="btnpreview" runat="server" class="buttondisabled" onclick="onBtnpreClicked()"  value="Review" /> </a>
              </div>
              <div class="col-sm-4 text-center option-2">
                                       <button id="rec" runat="server" onclick="timerset();onBtnRecordClicked()" class="btn btn-primary-orange">Start Recording</button>	
                <button id="stop" runat="server" onclick="removeDisabled();onBtnStopClicked()" disabled>Stop</button>

              </div>
              <div class="col-sm-4 option-3"><input id="btnNext" type="button" runat="server"  class="buttondisabled" value="" onclick="uploadFiles();" disabled="disabled" /></div>
            
               <button id="download" style="display:none;">Submit Your Answer</button> 
             <button id="pauseRes"   onclick="onPauseResumeClicked()" disabled style="visibility:hidden">Pause</button>
            <label id="lblUploadFiles" style="color:green;visibility:hidden" ></label> 
                <asp:HiddenField ID="hdfquestion" runat="server" Value="0" />
           <progress id="fileProgress" style="display: none"></progress>
            </div>
            <!-- [/CTA Row] -->

            <!-- [Interview Options] -->
            <div class="col-sm-12 text-center mb-5 mt-5 other-cta-options">
              <p>Need help with your interview? <a class="color-primary" href="#">Contact Support</a></p>
              <p><a href="" class="color-primary">Reconfigure audio and video settings</a> <a href="" class="color-primary">View Help Articles</a></p>
            </div>
            <!-- [/Interview Options] -->
          </div>
          <!-- [/Interview Process Wrap] -->
        </div>
      </div>
    </div>
  </section>
    
  <!-- [Footer] -->
    <footer>
      <div class="container-fluid">
        <div class="footer-content d-flex">
          <nav class="foot-nav">
            <ul>
              <li><a href="" style="margin-left:15px;">Terms of Use</a></li>
              <li><a href="" style="margin-left:15px;">Privacy Policy</a></li>
              <li><a href="" style="margin-left:15px;">Help Articles</a></li>
              <li><a href="" style="margin-left:15px;">Accessibility</a></li>
              <li><a href="" style="margin-left:15px;">Contact Us</a></li>
            </ul>
          </nav>
          <div class="footer-logo">
            <a href="index.html" class="brand-logo"> 
              <img class="logo-compact" src="./images/powerdby.png" alt=""> </a>
          </div>
        </div>
      </div>
    </footer>
    <!-- [/Footer] -->
</div>

<!--**********************************
        Main wrapper end
    ***********************************--> 

<!--**********************************
        Scripts
    ***********************************--> 
<!-- Required vendors --> 

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script> 
<script src="./vendor/global/global.min.js"></script> 
<script src="./vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script> 
<script src="./vendor/chart.js/Chart.bundle.min.js"></script> 
<script src="./js/custom.min.js"></script> 
<script src="./js/deznav-init.js"></script> 
<script src="./vendor/owl-carousel/owl.carousel.js"></script> 

<!-- Form Steps --> 
<script src="./vendor/jquery-smartwizard/dist/js/jquery.smartWizard.js"></script>
    </form>
</body>
</html>
