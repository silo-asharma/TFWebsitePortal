<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tttt.aspx.cs" Inherits="Extuent.tttt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta charset="utf-8">
  <script src="https://cdn.jsdelivr.net/npm/@mediapipe/camera_utils/camera_utils.js" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/@mediapipe/control_utils/control_utils.js" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/@mediapipe/drawing_utils/drawing_utils.js" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/@mediapipe/selfie_segmentation/selfie_segmentation.js" crossorigin="anonymous"></script>


<script type="module">
const videoElement = document.getElementsByClassName('input_video')[0];
const canvasElement = document.getElementsByClassName('output_canvas')[0];
const canvasCtx = canvasElement.getContext('2d');

function onResults(results) {
  canvasCtx.save();
  canvasCtx.clearRect(0, 0, canvasElement.width, canvasElement.height);
  canvasCtx.drawImage(results.segmentationMask, 1, 1,
                      canvasElement.width, canvasElement.height);

  // Only overwrite existing pixels.
  canvasCtx.globalCompositeOperation = 'source-in';
  canvasCtx.fillStyle = '#ffffff';
  
  canvasCtx.fillRect(0, 0, canvasElement.width, canvasElement.height);


  // Only overwrite missing pixels.
  canvasCtx.globalCompositeOperation = 'source-atop';


  canvasCtx.drawImage(
      results.image, 1, 1, canvasElement.width, canvasElement.height);

  canvasCtx.restore();
   
    //recordCanvas(canvasElement);
}

const selfieSegmentation = new SelfieSegmentation({locateFile: (file) => {
  return `https://cdn.jsdelivr.net/npm/@mediapipe/selfie_segmentation/${file}`;
}});
selfieSegmentation.setOptions({
  modelSelection: 1,
  selfieMode: true,
effect: 'mask',
});
selfieSegmentation.onResults(onResults);

<%--const camera = new Camera(videoElement, {
  onFrame: async () => {
      await selfieSegmentation.send({image: videoElement});
  },
  width: 1280,
  height: 720
});
camera.start();--%>
</script>
	

</head>
<body>
  <div class="container">
    <video  class="input_video" style="display:none;" ></video>  <video id="vid" class="input_video" ></video>
    <canvas runat="server" id="canvas" class="output_canvas" width="1280px" height="720px" style="background-image: url(https://extuent.ai/bg/bg1.jpg);  background-repeat: no-repeat;
            background-size: cover;"></canvas>
     <a href="" id="ak">click</a>
      <a id="downloadLink" download="mediarecorder.webm" name="mediarecorder.webm" href ></a>   
         <button id="rec" runat="server" onclick="onBtnRecordClicked()" style=" width:200px;border-color:#FF7416;background-color:#FF7416;color:white;height:35px;border-radius:12px;">Start Recording</button>	 
  </div>
     <div id="waiting-message">
            <span>Loading the video ... please wait.</span>
        </div>
        <div>
            <button id="play-button">Play</button>
            <button id="pause-button">Pause</button>
             <button id="stopRec">stop recording</button>
        </div>
</body> 
   <%--<script>
       
	    var waitingMessageUI = document.getElementById('waiting-message');
	    const canvasElement = document.getElementsByClassName('output_canvas')[0];
	    var playButtonUI = document.getElementById('play-button');
	    var pauseButtonUI = document.getElementById('pause-button');
	    playButtonUI.onclick = () => startCamera();
	    pauseButtonUI.onclick = () => stopCamera();
	    var chunks = [];
	    var mediaRecorder;
	    function recordCanvas() {
	        // var aidlink = document.getElementsById('downloadLink');
	        chunks = [];
	        mediaRecorder = new MediaRecorder(
             canvasElement.captureStream(25), { mimeType: 'video/webm; codecs=vp9' });
	        mediaRecorder.ondataavailable = function (e) {

	            if (e.data && e.data.size > 0) {
	                chunks.push(e.data);
	            }
	        };
	        mediaRecorder.onstop = () => {
	            var recording = new Blob(chunks, { type: mediaRecorder.mimeType });
	            const url = URL.createObjectURL(
                  new Blob(chunks, { type: "video/webm" }));

	            //aidlink.href = URL.createObjectURL(recording);
	            // alert(mediaRecorder);
	            // const anchor = document.createElement("a");
	            //anchor.href = url;
	            //anchor.download = "video.webm";

	            // anchor.click();
	            window.URL.revokeObjectURL(url);
	        }
	        mediaRecorder.start();
	        window.setTimeout(() => { mediaRecorder.stop(); }, 1000);
	    }

        function hide(element) {
            element.style.display = "none";
        }

        function show(element) {
            element.style.display = "block";
        }

        function enable(element) {
            element.disabled = false;
        }

        function disable(element) {
            element.disabled = true;
        }

        function startCamera() {
            alert();
            recordCanvas();
          
            hide(playButtonUI);
            show(pauseButtonUI);
        }

        function stopCamera() {
            camera.stop();

            hide(pauseButtonUI);
            show(playButtonUI);
        }
    </script>--%>
    <script>
        var constraints = { audio: true, video: { width: { min: 640, ideal: 640, max: 640 }, height: { min: 480, ideal: 480, max: 480 }, framerate: 60 } };
        var playButtonUI = document.getElementById('play-button');
        var pauseButtonUI = document.getElementById('pause-button');
        playButtonUI.onclick = () => startRecording();
        pauseButtonUI.onclick = () => stopCamera();
      let webcamCanvas = document.getElementById("canvas"),
  recordingStream,
  current = 0,
  chunks = [],
  recorder,
  switchInterval;
        let cStream;
        var localStream = null;
        var containerType = "video/webm"; //defaults to webm but we switch to mp4 on Safari 14.0.2+

     
        function startRecording() {

            var chunks = [];
            var canvas_stream = webcamCanvas.captureStream(30); // fps
            // Add audio track
            //if (this.audio_track) { canvas_stream.addTrack(this.audio_track); }
            // init the MediaRecorder
            this.media_recorder = new MediaRecorder(canvas_stream, { mimeType: "video/webm; codecs=vp9" });

            // Record data in chunks array when data is available
            this.media_recorder.ondataavailable = (evt) => { chunks.push(evt.data); };
            // Provide recorded data when recording stops
            this.media_recorder.onstop = () => {
                alert();
                this.on_media_recorder_stop(chunks);
            }
            // Start recording using a 1s timeslice [ie data is made available every 1s)
            this.media_recorder.start(1000);
            var blob = new Blob(chunks, { type: "video/webm" });
            const recording_url = URL.createObjectURL(blob);
            //const a = document.createElement('a');
            //a.style = "display: none;";
            //a.href = recording_url;
            //a.download = "video.webm";
            //document.body.appendChild(a);
            //// Trigger the file download
            //a.click();
            setTimeout(() => {
                // Clean up - see https://stackoverflow.com/a/48968694 for why it is in a timeout
                URL.revokeObjectURL(recording_url);
                //document.body.removeChild(a);
            }, 0);
        }


        // switch mute one of the tracks, then the other
        function switchStream() {
            current = +!current;
            var tracks = recordingStream.getVideoTracks();
            tracks[current].enabled = true;
            // commented because it seems FF doesn't support canvasTrack's method yet
            // doesn't work in chrome even when there anyway
            //  tracks[current].requestFrame(); 
            tracks[+!current].enabled = false;
        }

        function saveChunks(evt) {
            // store our video's chunks
            if (evt.data.size > 0) {
                chunks.push(evt.data);
            }

        }

        stopRec.onclick = function stopRecording() {
            if (recorder.state !== 'recording') {
                this.disabled = true;
                return;
            }
            // stop everything
            recorder.stop(); // this will trigger exportVideo
            var recording = new Blob(chunks, { type: recorder.mimeType });
            //clearInterval(switchInterval);
            exportVideo();
            //stopCanvasAnim();
            //a.style.display = b.style.display = 'none';
            this.parentNode.innerHTML = "";
        }


        function exportVideo() {
            //  we've got everything
            vid.src = URL.createObjectURL(new Blob(chunks));
        }



      
    </script>
</html>
