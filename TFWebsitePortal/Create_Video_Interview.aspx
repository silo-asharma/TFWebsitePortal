<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Create_Video_Interview.aspx.cs" Inherits="Extuent.Create_Video_Interview" EnableEventValidation="false" %>
<%@ Register Src="~/UC/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/UC/header.ascx" TagPrefix="uc1" TagName="header" %>
<%@ Register Src="~/UC/footer.ascx" TagPrefix="uc1" TagName="footer" %>
<%@ Register Src="~/UC/footer-inner.ascx" TagPrefix="uc1" TagName="footerinner" %>
<%@ Register Src="~/UC/headnewui.ascx" TagPrefix="uc1" TagName="headnewui" %>
<%@ Register Src="~/UC/headernewui.ascx" TagPrefix="uc1" TagName="headernewui" %>
<%@ Register Src="~/UC/footernewui.ascx" TagPrefix="uc1" TagName="footernewui" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title></title>
   <%-- <uc1:head runat="server" ID="head" />--%>
    <uc1:headnewui runat="server" ID="headnewui" />
<%--    	<link rel="stylesheet" href="css/main.css" />--%>
    <script src="js/jquery-1.4.1.js"></script>
                        <script src="https://cdn.jsdelivr.net/npm/@mediapipe/camera_utils/camera_utils.js" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/@mediapipe/control_utils/control_utils.js" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/@mediapipe/drawing_utils/drawing_utils.js" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/@mediapipe/selfie_segmentation/selfie_segmentation.js" crossorigin="anonymous"></script> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
     
    <style>
      #loading {
  position: fixed;
  display: block;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  text-align: center;
  opacity: 0.9;
  background-color: #fff;
  z-index: 99;
}

#loading-image {
  position: center;
  padding-top: 250px;
  left: 240px;
  z-index: 100;
}
    </style>
    <style>
        #canvas {
            background-image: url(https://extuent.ai/bg/bg18_logo_sqr.jpg);
             background-repeat: no-repeat;
            background-size: cover;
            margin-bottom: 10px;
        }
         #c2 {
        background-image: url(https://extuent.ai/bg/bg18_logo.jpg);
        background-repeat: no-repeat;
 	background-size: cover;
            margin-bottom: 10px;
      }
         </style>
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
            document.getElementById("<%=previewVideo.ClientID%>").style.height = '0px';
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
            previewdiv.style.height = 'calc(100vh - 270px)';
            var playbackVElement = document.getElementById("playback");
            playbackVElement.autoplay = true;
            playbackVElement.controls = true;
            playbackVElement.muted = false;
            // playbackVElement.controls = false;
            playbackVElement.play();
            //playbackVElement.hidden = true;          
            document.getElementById("<%=c2.ClientID%>").style.visibility = 'visible';

            event.preventDefault();
        }
        function onBtnstopPreview() {
          
            var playbackVElement = document.getElementById("playback");
            playbackVElement.pause();
           
            event.preventDefault();
        }
        function reTake() {
            var previewdiv = document.getElementById("previewVideo");
            previewdiv.hidden = true;
            previewdiv.style.height = '0px';
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

            event.preventDefault();
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
                    removeDisabled();
                    onBtnStopClicked();
                    $("#lblUploadFiles").html("You have reached the recording time limit of 2 Minutes.<br/>Click next to move to the next question or review and retake if you wish to record");
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
            $('#loading').show();
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
                    MoveOnNext();
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
                    previewdiv.style.height = 'calc(100vh - 270px)';
                    var recBtn = document.querySelector('button#rec');
                    recBtn.disabled = false;
                        document.getElementById("<%=rec.ClientID%>").style.visibility = 'visible';
                    $('#retakeCount').html('');
                    document.getElementById("<%=btnNext.ClientID%>").className = "buttondisabled";
                      document.getElementById("<%=fafaIconwatch.ClientID%>").style.visibility = 'hidden';
                       $('#time').text('');
                       if (i >= questions.length) {
                           window.location.replace("Thank_You?JobID=" + JobId + "&CandidateID=" + CandidateID);

                       }
                       else { $('#loading').hide(); }
                    $("#lblmsg").html(questions[i]);
                  
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
            event.preventDefault();
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
    
    <link href="css_ext/style.css" rel="stylesheet">
</head>
<body>
   <form id="form1" runat="server">
        <div id="loading">
  <img id="loading-image" src="images/progress.gif" alt="Loading..." />
</div>
   <%--     <uc1:header runat="server" ID="header" />--%>
       <uc1:headernewui runat="server" ID="headernewui" />
        <div id="main-wrapper">



        <div class="content-body1">

            <!-- Add Order -->
             <div class="row" style="display:none;">
                                        <div class="col-xl-12 col-xxl-12">
                                      
                                     <div class="mb-4" style="float:right;margin-right:12%;font-weight:bold;color:#fff;background-color:red;visibility:hidden">
                                           <h6 id="retakeCount" style="text-align: left;width:300px;text-align:right;margin-right:10px;visibility:hidden"></h6>
                                       
                                         </div><br />
                                
                                       </div>
                                
                               </div>
            <div class="row">

               
                        <!-- START JOBS-POST-EDIT -->
                   
                            <div class="container">
                                <%--<div class="row">
                                        <div class="col-xl-12 col-xxl-12">
                                           <center>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font:large">Customer Service Representative </span></center> 
                                   </div>
                                </div>--%>
                               <%--<div class="row">
                               <center>
                                       <div class="col-xl-6 col-xxl-6">
                                     
                                  <div class="interview-process-wrap">
            <h3 class="post-head text-center"></h3>
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
                                      </div>
                                           </div>
                                   </center>
                               </div>--%>
                          <div class="single-interview">
            <h3><span id="jobtitle" runat="server"></span></h3>
            <!-- start steps -->
                                  <div class="steps">
                <ul>
                    <li class="step current"><a href="#" title="1">1</a></li>
                    <%if (question != null && question != "")
    {
        var quescount = question.Split(';');
        int count = quescount.Count();
        for (int i =1 ; i <count; i++) { 
                            %>
                    <li class="step"><a href="#" title="2"><%=i+1 %></a></li>
                    <%}
    } %>
                   
                    <li><a href="#" title="Upload">Upload</a></li>
                </ul>
            </div>

                                <div class="single-interview-box">
                <div class="single-interview-box-in">
                                    <div class="question-txt">
                        <div class="row">
                            <div class="col-sm">
                                <p><label for="skills" class="form-label" id="lblmsg" runat="server"> </label></p>
                            </div>
                            <div class="col-sm-auto">
                                <p class="text-end"><i class="fa fa-clock-o" style="font-size:18px;color:#FF6700;visibility:hidden;" id="fafaIconwatch" runat="server" ></i><strong>&nbsp;Time Limit: </strong><span> <span id="time">2:00</span></span> Minute (S)</p>
                            </div>
                        </div>
                    </div>
                                </div>
                                    </div> 
                                </div>
                                        <center>
                                    <div class="col-lg-10">
                                                <div class="mb-10">
                                                   
                                                    
                                               
                                                   
     <div>
	<div>
       
       <div class="row">
                                    <div class="col-lg-12">
	<div  style="border-radius:12px;border-color:#FF7416;" id="divLive">
        <video id="live" width="440" style="width:60%; height:100%;max-height: calc(100vh - 270px);display:none;border-radius:12px;border-color:#FF7416;" height="400" controls autoplay playsinline muted></video>
            <canvas id="canvas" width="440" height="400" style="width:60%; height:100%; margin:0; display: flex; max-height: calc(100vh - 270px); border-radius:12px;border-color:#FF7416;"></canvas>
	</div>
          
        
      <div style="height:0px; z-index: -1; visibility:hidden; border-radius:12px;border-color:#FF7416;" id="previewVideo" runat="server"> 
        <video id="playback" width="440" height="600"  controls  muted controls="true" style="width:60%; height:100%; max-height: calc(100vh - 270px) border-radius:12px;border-color:#FF7416;">Preview</video>
         <canvas id="c2"  runat="server" width="640" height="421" style="width:60%; height:100%; margin:0; max-height: calc(100vh - 270px); border-radius:12px;border-color:#FF7416;"></canvas>
         <canvas id="c1" runat="server" width="640" height="421" style="width:60%; height:100%; margin:0; max-height: calc(100vh - 270px); border-radius:12px;border-color:#FF7416;"></canvas>
      </div>
    
                   
        <div  style="width:60%;float:center; display: flex;margin-top: 20px;">
           
   
            <div id="controls" class="action-bar" runat="server" style="visibility:hidden;min-width:100%">
                <table style="width: 100%;">
                 
                    <tr>
                        <td style="width:20%" valign="top" align="left">
                            <button name="reTakeB" id="reTakeBtn" runat="server" class="buttondisabled retake" value="" disabled="disabled" onclick="reTake();" >
                                <img src="images/icon_retake.png" width="63" height="58" alt="Retake">
                                 Retake
                            </button> 
                        </td>
                        <td style="width:20%" valign="top">
                            <button id="btnpreview" runat="server" class="buttondisabled link" onclick="onBtnpreClicked()" >
                                <img src="images/icon_review.png" width="63" height="58" alt="review">
                                Review
                            </button>
			
                        </td>
                        <td style="width:40%; position: relative;" valign="top">
                        <center>  
                          <button id="rec" runat="server" onclick="timerset();onBtnRecordClicked()" style=" width:200px;border-color:#FF7416;background-color:#FF7416;color:white;height:35px;border-radius:12px;">Start Recording</button>			
		                  <button id="stop" runat="server" onclick="removeDisabled();onBtnStopClicked()" disabled style="position: absolute; left: 10px; top: 0; visibility:hidden;width:200px;border-color:#FF7416;background-color:#FF7416;color:white;height:35px;border-radius:12px;">Stop</button>&nbsp;&nbsp;
                       </center>
                        </td>
                        <td style="width:20%;text-align:right" valign="top">
                            <button id="btnNext" runat="server" style="float:right"  class="buttondisabled next" value="" onclick="uploadFiles();" disabled="disabled">
                                Next
                                <img src="images/icon_next.png" width="60" height="60" alt="Next">
                            </button>
                        </td>
                        
                    </tr>
                       <tr>
                           <td colspan="4" style="width:100%; ">
                         <center><progress id="fileProgress" style="display: none"></progress><br />  <label id="lblUploadFiles" style="color:green;"></label>    </center></td>
                           
                    </tr>
                </table>
                    <button id="download" style="display:none;">Submit Your Answer</button>  </div>                                  
                    <button id="pauseRes"   onclick="onPauseResumeClicked()" disabled style="visibility:hidden">Pause</button>
                    <label id="lblUploadFiles" style="color:green;visibility:hidden" ></label> 
                    <asp:HiddenField ID="hdfquestion" runat="server" Value="0" /><br />
           
                  
            </div> 
       
   </div>
           </div>
           
          </div> 
           
             
		</div>
         
           
              
        </div>
              <div class="help-txtb">
            <p>Need help with your interview? <a href="feedback-or-support" title="Contact Support">Contact Support</a></p>
         <%--   <p><span><a href="#" title="Reconfigure audio and video settings">Reconfigure audio and video settings</a></span> <span><a href="#" title="View Help Articles">View Help Articles</a></span></p>--%>
        </div>
                                        
                                        </div>
  <div class="row">
        <div class="col-xl-12 col-xxl-12"> 
            
                  <input type="file" id="myfile" name="myfile" style="visibility:hidden">
                  <a id="downloadLink" download="mediarecorder.webm" name="mediarecorder.webm" href style="display:none;"></a>                               <%--   <a  href="javascript:void(0)" class="btn btn-success">Upload Video</a>--%>
                  <button id="idsave"  onclick="onSavevideo()" style="visibility:hidden">submit</button>
                  <button type="submit" class="btn btn-white btn-hover w-100" runat="server" onclick="btnCancel_Click" style="visibility:hidden">Sign In</button>
                  <asp:Button ID="btntest" runat="server" Text="text" OnClick="btntest_Click" OnClientClick="onSavevideo" Visible="false"/>
                                       
                  <a href="http://44.204.70.197/extuent/Create_Video_Interview?id=How did you hear about this position" id="lnknext" runat="server" class="btn btn-primary" style="width:300px;visibility:hidden;">Next <i class=""></i></a>
        </div>
 </div>
      <%--  <video id="playback" controls autoplay style="visibility:hidden"></video>--%>
</div></div>

	<p id="data" style="visibility:hidden;"></p>
	<script src="js/adapter-latest.js"></script>
     <%--  <script src="js/TensorFlow.js"></script>
    <script src="js/BodyPix.js"></script>--%>
    <script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.2"></script>
    <script src="https://cdn.jsdelivr.net/npm/@tensorflow-models/body-pix@2.0"></script>
	<script src="js/main.js"></script>
    <script src="js/processor.js"></script>
   
</div>
 <div>
 </div>
</div> </div>
                <!-- START SUBSCRIBE -->
               
                <!-- END SUBSCRIBE -->
                <!-- End Page-content -->
   
    <uc1:footerinner runat="server" ID="footerinner" />
    <uc1:footernewui runat="server" ID="footernewui" />
     
    </form>
     <script>
        const progressBar = document.getElementById("progress-bar");
        //const progressNext = document.getElementById("progress-next");
        //const progressPrev = document.getElementById("progress-prev");
        const steps = document.querySelectorAll(".step");
        let active = 1;
        function MoveOnNext() {
          
            if (active > steps.length) {
                active = steps.length;
            }
            updateProgress();
            active++;
        }
        const updateProgress = () => {
            steps.forEach((step, i) => {
            
                if (i == active)
                {
                    step.classList.add("current");
                }
                if (i < active) {
                    step.classList.add("active");
                    step.classList.remove("current");
                }
              
                else {
                    step.classList.remove("active");
                }
            });
            //progressBar.style.width = ((active - 1) / (steps.length - 1)) * 100 + "%";
            if (active === 1) {
                //progressPrev.disabled = true;
            } else if (active === steps.length) {
                //progressNext.disabled = true;
            } else {
                //progressPrev.disabled = false;
                //progressNext.disabled = false;
            }
        };
    </script>
 <script>
  $(window).on('load', function () {
    $('#loading').hide();
  }) 
</script>
</body>
</html>
