'use strict';

/* globals MediaRecorder */
// Spec is at http://dvcs.w3.org/hg/dap/raw-file/tip/media-stream-capture/RecordingProposal.html


var constraints = { audio: true, video: { width: { min: 640, ideal: 640, max: 640 }, height: { min: 421, ideal: 421, max: 421 }, framerate: 60 } };

var recBtn = document.querySelector('button#rec');
var pauseResBtn = document.querySelector('button#pauseRes');
var stopBtn = document.querySelector('button#stop');
//var retakeBtn = document.querySelector('button#retake');
var liveVideoElement = document.querySelector('#live');
var playbackVideoElement = document.querySelector('#playback');
var dataElement = document.querySelector('#data');
var downloadLink = document.querySelector('a#downloadLink');
const downloadButton = document.querySelector('button#download');
let webcamCanvas = document.getElementById("canvas");
let webcamCanvasCtx = webcamCanvas.getContext('2d');
var tempCanvas = document.createElement('canvas');
var tempCanvasCtx = tempCanvas.getContext('2d');

let previousSegmentationComplete = true;

let segmentationProperties = {

    segmentationThreshold: 0.4,

    flipHorizontal: true,
    internalResolution: 'high',
    architecture: 'ResNet50',
    outputStride: 16,

    quantBytes: 4,

}


function onResults(results) {
    // alert(1);

    webcamCanvasCtx.save();
    webcamCanvasCtx.clearRect(0, 0, webcamCanvas.width, webcamCanvas.height);
    webcamCanvasCtx.drawImage(results.segmentationMask, 0, 0,
                        webcamCanvas.width, webcamCanvas.height);

    // Only overwrite existing pixels.
    webcamCanvasCtx.globalCompositeOperation = 'source-in';
    webcamCanvasCtx.fillStyle = '#ffffff';

    webcamCanvasCtx.fillRect(0, 0, webcamCanvas.width, webcamCanvas.height);


    // Only overwrite missing pixels.
    webcamCanvasCtx.globalCompositeOperation = 'source-atop';


    webcamCanvasCtx.drawImage(
        results.image, 0, 0, webcamCanvas.width, webcamCanvas.height);

    webcamCanvasCtx.restore();
    //  alert(2);
    //  recordCanvas(canvasElement, 1000);
}

const selfieSegmentation = new SelfieSegmentation({
    locateFile: (file) => {
        return `https://cdn.jsdelivr.net/npm/@mediapipe/selfie_segmentation/${file}`;
    }
});
selfieSegmentation.setOptions({
    modelSelection: 1,
    selfieMode: true,
    effect: 'mask',

});

selfieSegmentation.onResults(onResults);



var myfile = document.querySelector('#myfile');

liveVideoElement.controls = false;
playbackVideoElement.controls = false;

var mediaRecorder;
var chunks = [];
var count = 0;
var localStream = null;
var soundMeter = null;
var containerType = "video/webm"; //defaults to webm but we switch to mp4 on Safari 14.0.2+

if (!navigator.mediaDevices.getUserMedia) {
    alert('navigator.mediaDevices.getUserMedia not supported on your browser, use the latest version of Firefox or Chrome');
} else {
    if (window.MediaRecorder == undefined) {
        alert('MediaRecorder not supported on your browser, use the latest version of Firefox or Chrome');
    } else {
        navigator.mediaDevices.getUserMedia(constraints)
			.then(function (stream) {
			    //  localStream = canvas.captureStream(25 /*fps*/);
			    localStream = stream;

			    localStream.getTracks().forEach(function (track) {
			        if (track.kind == "audio") {
			            track.onended = function (event) {
			                log("audio track.onended Audio track.readyState=" + track.readyState + ", track.muted=" + track.muted);
			            }
			        }
			        if (track.kind == "video") {
			            track.onended = function (event) {
			                log("video track.onended Audio track.readyState=" + track.readyState + ", track.muted=" + track.muted);
			            }
			        }
			    });

			    liveVideoElement.srcObject = localStream;
			    liveVideoElement.play();

			    try {
			        window.AudioContext = window.AudioContext || window.webkitAudioContext;
			        window.audioContext = new AudioContext();
			    } catch (e) {
			        log('Web Audio API not supported.');
			    }

			    soundMeter = window.soundMeter = new SoundMeter(window.audioContext);
			    soundMeter.connectToSource(localStream, function (e) {
			        if (e) {
			            log(e);
			            return;
			        } else {
			            /*setInterval(function() {
                           log(Math.round(soundMeter.instant.toFixed(2) * 100));
                       }, 100);*/
			        }
			    });
			    liveVideoElement.onloadedmetadata = () => {
			        webcamCanvas.width = liveVideoElement.videoWidth;
			        webcamCanvas.height = liveVideoElement.videoHeight;
			        tempCanvas.width = liveVideoElement.videoWidth;
			        tempCanvas.height = liveVideoElement.videoHeight;
			    };

			    liveVideoElement.addEventListener("loadeddata", segmentPersons1);
			    //liveVideoElement.addEventListener("loadeddata", segmentPersons);

			}).catch(function (err) {
			    /* handle the error */
			    log('navigator.getUserMedia error: ' + err);
			});
    }
}

function segmentPersons1() {

    if (previousSegmentationComplete) {
        previousSegmentationComplete = false;



        selfieSegmentation.send({ image: liveVideoElement }).then(segmentation => {

            previousSegmentationComplete = true;

        });

    }
    // segmentPersons1();
    //Call this function repeatedly to perform segmentation on all frames of the video.
    window.requestAnimationFrame(segmentPersons1);
    liveVideoElement.hidden = true;
}

function segmentPersons() {
    tempCanvasCtx.drawImage(liveVideoElement, 0, 0);
    if (previousSegmentationComplete) {
        previousSegmentationComplete = false;
        // Now classify the canvas image we have available.
        model.segmentPerson(tempCanvas, segmentationProperties)
            .then(segmentation => {
                processSegmentation(segmentation);
                previousSegmentationComplete = true;

            });
    }
    //Call this function repeatedly to perform segmentation on all frames of the video.
    window.requestAnimationFrame(segmentPersons);
    liveVideoElement.hidden = true;
}


function processSegmentation(segmentation) {
    var imgData = tempCanvasCtx.getImageData(0, 0, webcamCanvas.width, webcamCanvas.height);
    //Loop through the pixels in the image
    for (let i = 0; i < imgData.data.length; i += 4) {
        let pixelIndex = i / 4;
        //Make the pixel transparent if it does not belong to a person using the body-pix model's output data array.
        //This removes all pixels corresponding to the background.
        if (segmentation.data[pixelIndex] == 0) {
            imgData.data[i + 3] = 0;
        }
    }

    //Draw the updated image on the canvas



    webcamCanvasCtx.imageSmoothingEnabled = true;
    webcamCanvasCtx.putImageData(imgData, 0, 0);

    liveVideoElement.hidden = true;
}
function onBtnRecordClicked() {
    var cStream;
    if (localStream == null) {
        alert('Camera and Microphone Access Required (In order to continue with this interview, you must allow this webpage access to your camera and microphone.)');
    } else {
        recBtn.disabled = true;
        pauseResBtn.disabled = false;
        stopBtn.disabled = false;

        cStream = webcamCanvas.captureStream(30 /*fps*/);
        cStream.addTrack(localStream.getAudioTracks()[0]);
        //cStream.putImageData(canvas.getImageData())[0];

        chunks = [];

        /* use the stream */
        log('Start recording...');
        if (typeof MediaRecorder.isTypeSupported == 'function') {
            /*
				MediaRecorder.isTypeSupported is a function announced in https://developers.google.com/web/updates/2016/01/mediarecorder and later introduced in the MediaRecorder API spec http://www.w3.org/TR/mediastream-recording/
			*/
            if (MediaRecorder.isTypeSupported('video/webm;codecs=vp9')) {
                var options = { mimeType: 'video/webm;codecs=vp9' };
            } else if (MediaRecorder.isTypeSupported('video/webm;codecs=h265')) {
                var options = { mimeType: 'video/webm;codecs=h265' };
            } else if (MediaRecorder.isTypeSupported('video/webm')) {
                var options = { mimeType: 'video/webm' };
            } else if (MediaRecorder.isTypeSupported('video/mp4')) {
                //Safari 14.0.2 has an EXPERIMENTAL version of MediaRecorder enabled by default
                containerType = "video/mp4";
                var options = { mimeType: 'video/mp4' };
            }
            log('Using ' + options.mimeType);
            //alert(options.mimeType);
            mediaRecorder = new MediaRecorder(cStream, options);
        } else {
            log('isTypeSupported is not supported, using default codecs for browser');
            mediaRecorder = new MediaRecorder(cStream);
        }

        mediaRecorder.ondataavailable = function (e) {
            log('mediaRecorder.ondataavailable, e.data.size=' + e.data.size);
            if (e.data && e.data.size > 0) {
                chunks.push(e.data);
            }
        };

        mediaRecorder.onerror = function (e) {
            log('mediaRecorder.onerror: ' + e);
        };

        mediaRecorder.onstart = function () {
            log('mediaRecorder.onstart, mediaRecorder.state = ' + mediaRecorder.state);

            localStream.getTracks().forEach(function (track) {
                if (track.kind == "audio") {
                    log("onstart - Audio track.readyState=" + track.readyState + ", track.muted=" + track.muted);
                }
                if (track.kind == "video") {
                    log("onstart - Video track.readyState=" + track.readyState + ", track.muted=" + track.muted);
                }
            });

        };

        mediaRecorder.onstop = function () {
            log('mediaRecorder.onstop, mediaRecorder.state = ' + mediaRecorder.state);

            //var recording = new Blob(chunks, {type: containerType});
            var recording = new Blob(chunks, { type: mediaRecorder.mimeType });


            //alert(recording);

            downloadLink.href = URL.createObjectURL(recording);
            //alert(URL.createObjectURL(recording));
            /* 
				srcObject code from https://developer.mozilla.org/en-US/docs/Web/API/HTMLMediaElement/srcObject
			*/

            /*if ('srcObject' in playbackVideoElement) {
			  try {
			    playbackVideoElement.srcObject = recording;
			  } catch (err) {
			    if (err.name != "TypeError") {
			      throw err;
			    }*/
            // Even if they do, they may only support MediaStream
            playbackVideoElement.src = URL.createObjectURL(recording);
            /*  }
			} else {
			  playbackVideoElement.src = URL.createObjectURL(recording);
			} */


            playbackVideoElement.controls = true;
            //playbackVideoElement.play();

            var rand = Math.floor((Math.random() * 10000000));
            switch (containerType) {
                case "video/mp4":
                    var name = "video_" + rand + ".mp4";
                    break;
                default:
                    var name = "video_" + rand + ".webm";
            }

            downloadLink.innerHTML = 'Download ' + name;

            downloadLink.setAttribute("download", name);
            downloadLink.setAttribute("name", name);
            myfile.setAttribute("value", recording);
            //alert('ok');
            //var xhr = new XMLHttpRequest();
            ////creating form data to append files
            //var fd = new FormData();
            ////append the recorded blob
            //fd.append("video", recording);
            ////send data to server..............
            //xhr.send(fd);
            //alert('ok');
        };
        downloadButton.addEventListener('click', () => {
            //const blob = new Blob(chunks, { type: 'video/webm' });
            //const url = window.URL.createObjectURL(blob);
            //const a = document.createElement('a');
            //a.style.display = 'none';
            //a.href = url;
            //a.download = 'test.webm';
            //document.body.appendChild(a);
            //a.click();
            ////alert(blob);
            //var formData = new FormData();
            //formData.append('videoblob', blob);
            //formData.append('name', 'ss');
            //const xhr = $.ajaxSettings.xhr();
            //xhr.open("POST", "test.ashx");
            //xhr.send(formData);
            //xhr.onreadystatechange = function () {
            //    //alert(xhr.readyState);
            //    //Call a function when the state changes.
            //    if (xhr.readyState == XMLHttpRequest.DONE) {

            //        if (xhr.responseText != null && xhr.responseText.trim() != "") {

            //            alert(xhr.responseText);

            //            return;
            //        }
            //    }
            //}
            // $.ajax({
            //     type: 'POST',
            //     url: "Create_Video_Interview.aspx/save",
            //     data: formData,
            //     cache: false,
            //     dataType: 'json',
            //     contentType: 'multipart/form-data',
            //     processData: false,
            //     success: function (result) {
            //         if (result) {
            //             // alert(result);
            //         }
            //     },
            //     error: function (result) {
            //         // alert(result);
            //         //console.log(result);
            //     }
            // });
            // //alert(url);
            // //PostBlob(blob);

            //// alert(blob);
            // setTimeout(() => {
            //     document.body.removeChild(a);
            //     window.URL.revokeObjectURL(url);
            // }, 100);

        });
        function PostBlob(blob) {

            var formData = new FormData();
            formData.append('videoblob', blob);

            alert("h3")
            // POST the Blob
            //$.ajax({
            //    type: 'POST',
            //    url: "Create_Video_Interview.aspx/save",
            //    data: formData,
            //    contentType: false,
            //    processData: false,
            //    success: function (result) {
            //        if (result) {
            //          console.log(result);
            //        }
            //    },
            //    error: function (result) {
            //        // alert(result);
            //        console.log(result);
            //    }
            //})
        }
        function OnSuccess(response) {
            alert(response.d);
        }
        mediaRecorder.onpause = function () {
            log('mediaRecorder.onpause, mediaRecorder.state = ' + mediaRecorder.state);
        }

        mediaRecorder.onresume = function () {
            log('mediaRecorder.onresume, mediaRecorder.state = ' + mediaRecorder.state);
        }

        mediaRecorder.onwarning = function (e) {
            log('mediaRecorder.onwarning: ' + e);
        };

        pauseResBtn.textContent = "Pause";

        mediaRecorder.start(1000);

        cStream.getTracks().forEach(function (track) {
            log(track.kind + ":" + JSON.stringify(track.getSettings()));
            console.log(track.getSettings());
        })
    }
}
function onBtnReTakeClicked() {
    var cStream;
    if (localStream == null) {
        alert('Camera and Microphone Access Required (In order to continue with this interview, you must allow this webpage access to your camera and microphone.)');
    } else {
        playbackVideoElement.muted = true;
        recBtn.disabled = true;
        pauseResBtn.disabled = false;
        stopBtn.disabled = false;
        cStream = webcamCanvas.captureStream(60 /*fps*/);
        cStream.addTrack(localStream.getAudioTracks()[0]);
        //cStream.putImageData(canvas.getImageData())[0];

        chunks = [];

        /* use the stream */
        log('Start recording...');
        if (typeof MediaRecorder.isTypeSupported == 'function') {
            /*
				MediaRecorder.isTypeSupported is a function announced in https://developers.google.com/web/updates/2016/01/mediarecorder and later introduced in the MediaRecorder API spec http://www.w3.org/TR/mediastream-recording/
			*/
            if (MediaRecorder.isTypeSupported('video/webm;codecs=vp9')) {
                var options = { mimeType: 'video/webm;codecs=vp9' };
            } else if (MediaRecorder.isTypeSupported('video/webm;codecs=h264')) {
                var options = { mimeType: 'video/webm;codecs=h264' };
            } else if (MediaRecorder.isTypeSupported('video/webm')) {
                var options = { mimeType: 'video/webm' };
            } else if (MediaRecorder.isTypeSupported('video/mp4')) {
                //Safari 14.0.2 has an EXPERIMENTAL version of MediaRecorder enabled by default
                containerType = "video/mp4";
                var options = { mimeType: 'video/mp4' };
            }
            log('Using ' + options.mimeType);
            mediaRecorder = new MediaRecorder(cStream, options);
        } else {
            log('isTypeSupported is not supported, using default codecs for browser');
            mediaRecorder = new MediaRecorder(cStream);
        }

        mediaRecorder.ondataavailable = function (e) {
            log('mediaRecorder.ondataavailable, e.data.size=' + e.data.size);
            if (e.data && e.data.size > 0) {
                chunks.push(e.data);
            }
        };

        mediaRecorder.onerror = function (e) {
            log('mediaRecorder.onerror: ' + e);
        };

        mediaRecorder.onstart = function () {
            log('mediaRecorder.onstart, mediaRecorder.state = ' + mediaRecorder.state);

            localStream.getTracks().forEach(function (track) {
                if (track.kind == "audio") {
                    log("onstart - Audio track.readyState=" + track.readyState + ", track.muted=" + track.muted);
                }
                if (track.kind == "video") {
                    log("onstart - Video track.readyState=" + track.readyState + ", track.muted=" + track.muted);
                }
            });

        };

        mediaRecorder.onstop = function () {
            log('mediaRecorder.onstop, mediaRecorder.state = ' + mediaRecorder.state);

            //var recording = new Blob(chunks, {type: containerType});
            var recording = new Blob(chunks, { type: mediaRecorder.mimeType });


            //alert(recording);

            downloadLink.href = URL.createObjectURL(recording);
            //alert(URL.createObjectURL(recording));
            /* 
				srcObject code from https://developer.mozilla.org/en-US/docs/Web/API/HTMLMediaElement/srcObject
			*/

            /*if ('srcObject' in playbackVideoElement) {
			  try {
			    playbackVideoElement.srcObject = recording;
			  } catch (err) {
			    if (err.name != "TypeError") {
			      throw err;
			    }*/
            // Even if they do, they may only support MediaStream
            playbackVideoElement.src = URL.createObjectURL(recording);
            /*  }
			} else {
			  playbackVideoElement.src = URL.createObjectURL(recording);
			} */


            playbackVideoElement.controls = true;
            //playbackVideoElement.play();

            var rand = Math.floor((Math.random() * 10000000));
            switch (containerType) {
                case "video/mp4":
                    var name = "video_" + rand + ".mp4";
                    break;
                default:
                    var name = "video_" + rand + ".webm";
            }

            downloadLink.innerHTML = 'Download ' + name;

            downloadLink.setAttribute("download", name);
            downloadLink.setAttribute("name", name);
            myfile.setAttribute("value", recording);
            //alert('ok');
            //var xhr = new XMLHttpRequest();
            ////creating form data to append files
            //var fd = new FormData();
            ////append the recorded blob
            //fd.append("video", recording);
            ////send data to server..............
            //xhr.send(fd);
            //alert('ok');
        };
        downloadButton.addEventListener('click', () => {
            //const blob = new Blob(chunks, { type: 'video/webm' });
            //const url = window.URL.createObjectURL(blob);
            //const a = document.createElement('a');
            //a.style.display = 'none';
            //a.href = url;
            //a.download = 'test.webm';
            //document.body.appendChild(a);
            //a.click();
            ////alert(blob);
            //var formData = new FormData();
            //formData.append('videoblob', blob);
            //formData.append('name', 'ss');
            //const xhr = $.ajaxSettings.xhr();
            //xhr.open("POST", "test.ashx");
            //xhr.send(formData);
            //xhr.onreadystatechange = function () {
            //    //alert(xhr.readyState);
            //    //Call a function when the state changes.
            //    if (xhr.readyState == XMLHttpRequest.DONE) {

            //        if (xhr.responseText != null && xhr.responseText.trim() != "") {

            //            alert(xhr.responseText);

            //            return;
            //        }
            //    }
            //}
            // $.ajax({
            //     type: 'POST',
            //     url: "Create_Video_Interview.aspx/save",
            //     data: formData,
            //     cache: false,
            //     dataType: 'json',
            //     contentType: 'multipart/form-data',
            //     processData: false,
            //     success: function (result) {
            //         if (result) {
            //             // alert(result);
            //         }
            //     },
            //     error: function (result) {
            //         // alert(result);
            //         //console.log(result);
            //     }
            // });
            // //alert(url);
            // //PostBlob(blob);

            //// alert(blob);
            // setTimeout(() => {
            //     document.body.removeChild(a);
            //     window.URL.revokeObjectURL(url);
            // }, 100);

        });
        function PostBlob(blob) {

            var formData = new FormData();
            formData.append('videoblob', blob);

            alert("h3")
            // POST the Blob
            //$.ajax({
            //    type: 'POST',
            //    url: "Create_Video_Interview.aspx/save",
            //    data: formData,
            //    contentType: false,
            //    processData: false,
            //    success: function (result) {
            //        if (result) {
            //          console.log(result);
            //        }
            //    },
            //    error: function (result) {
            //        // alert(result);
            //        console.log(result);
            //    }
            //})
        }
        function OnSuccess(response) {
            alert(response.d);
        }
        mediaRecorder.onpause = function () {
            log('mediaRecorder.onpause, mediaRecorder.state = ' + mediaRecorder.state);
        }

        mediaRecorder.onresume = function () {
            log('mediaRecorder.onresume, mediaRecorder.state = ' + mediaRecorder.state);
        }

        mediaRecorder.onwarning = function (e) {
            log('mediaRecorder.onwarning: ' + e);
        };

        pauseResBtn.textContent = "Pause";

        mediaRecorder.start(1000);

        cStream.getTracks().forEach(function (track) {
            log(track.kind + ":" + JSON.stringify(track.getSettings()));
            console.log(track.getSettings());
        })
    }
}
navigator.mediaDevices.ondevicechange = function (event) {
    log("mediaDevices.ondevicechange");
    /*
	if (localStream != null){
		localStream.getTracks().forEach(function(track) {
			if(track.kind == "audio"){
				track.onended = function(event){
					log("audio track.onended");
				}
			}
		});
	}
	*/
}

function onBtnStopClicked() {
    //var form = document.forms[0];

    //var selectElement = form.querySelector('input[name="reTakeB"]');

    mediaRecorder.stop();
    playbackVideoElement.hidden = true;
    recBtn.disabled = true;
    pauseResBtn.disabled = true;
    stopBtn.disabled = true;
    //retakeBtn.disabled = false;
    playbackVideoElement.muted = true;
}

function onPauseResumeClicked() {
    if (pauseResBtn.textContent === "Pause") {
        pauseResBtn.textContent = "Resume";
        mediaRecorder.pause();
        stopBtn.disabled = true;
    } else {
        pauseResBtn.textContent = "Pause";
        mediaRecorder.resume();
        stopBtn.disabled = false;
    }
    recBtn.disabled = true;
    pauseResBtn.disabled = false;
}

function onStateClicked() {

    if (mediaRecorder != null && localStream != null && soundMeter != null) {
        log("mediaRecorder.state=" + mediaRecorder.state);
        log("mediaRecorder.mimeType=" + mediaRecorder.mimeType);
        log("mediaRecorder.videoBitsPerSecond=" + mediaRecorder.videoBitsPerSecond);
        log("mediaRecorder.audioBitsPerSecond=" + mediaRecorder.audioBitsPerSecond);

        localStream.getTracks().forEach(function (track) {
            if (track.kind == "audio") {
                log("Audio: track.readyState=" + track.readyState + ", track.muted=" + track.muted);
            }
            if (track.kind == "video") {
                log("Video: track.readyState=" + track.readyState + ", track.muted=" + track.muted);
            }
        });

        log("Audio activity: " + Math.round(soundMeter.instant.toFixed(2) * 100));
    }

}

function log(message) {
    dataElement.innerHTML = dataElement.innerHTML + '<br>' + message;
    console.log(message)
}

// Meter class that generates a number correlated to audio volume.
// The meter class itself displays nothing, but it makes the
// instantaneous and time-decaying volumes available for inspection.
// It also reports on the fraction of samples that were at or near
// the top of the measurement range.
function SoundMeter(context) {
    this.context = context;
    this.instant = 0.0;
    this.slow = 0.0;
    this.clip = 0.0;
    this.script = context.createScriptProcessor(2048, 1, 1);
    var that = this;
    this.script.onaudioprocess = function (event) {
        var input = event.inputBuffer.getChannelData(0);
        var i;
        var sum = 0.0;
        var clipcount = 0;
        for (i = 0; i < input.length; ++i) {
            sum += input[i] * input[i];
            if (Math.abs(input[i]) > 0.99) {
                clipcount += 1;
            }
        }
        that.instant = Math.sqrt(sum / input.length);
        that.slow = 0.95 * that.slow + 0.05 * that.instant;
        that.clip = clipcount / input.length;
    };
}

SoundMeter.prototype.connectToSource = function (stream, callback) {
    console.log('SoundMeter connecting');
    try {
        this.mic = this.context.createMediaStreamSource(stream);
        this.mic.connect(this.script);
        // necessary to make sample run, but should not be.
        this.script.connect(this.context.destination);
        if (typeof callback !== 'undefined') {
            callback(null);
        }
    } catch (e) {
        console.error(e);
        if (typeof callback !== 'undefined') {
            callback(e);
        }
    }
};
SoundMeter.prototype.stop = function () {
    this.mic.disconnect();
    this.script.disconnect();
};


//browser ID
function getBrowser() {
    var nVer = navigator.appVersion;
    var nAgt = navigator.userAgent;
    var browserName = navigator.appName;
    var fullVersion = '' + parseFloat(navigator.appVersion);
    var majorVersion = parseInt(navigator.appVersion, 10);
    var nameOffset, verOffset, ix;

    // In Opera, the true version is after "Opera" or after "Version"
    if ((verOffset = nAgt.indexOf("Opera")) != -1) {
        browserName = "Opera";
        fullVersion = nAgt.substring(verOffset + 6);
        if ((verOffset = nAgt.indexOf("Version")) != -1)
            fullVersion = nAgt.substring(verOffset + 8);
    }
        // In MSIE, the true version is after "MSIE" in userAgent
    else if ((verOffset = nAgt.indexOf("MSIE")) != -1) {
        browserName = "Microsoft Internet Explorer";
        fullVersion = nAgt.substring(verOffset + 5);
    }
        // In Chrome, the true version is after "Chrome"
    else if ((verOffset = nAgt.indexOf("Chrome")) != -1) {
        browserName = "Chrome";
        fullVersion = nAgt.substring(verOffset + 7);
    }
        // In Safari, the true version is after "Safari" or after "Version"
    else if ((verOffset = nAgt.indexOf("Safari")) != -1) {
        browserName = "Safari";
        fullVersion = nAgt.substring(verOffset + 7);
        if ((verOffset = nAgt.indexOf("Version")) != -1)
            fullVersion = nAgt.substring(verOffset + 8);
    }
        // In Firefox, the true version is after "Firefox"
    else if ((verOffset = nAgt.indexOf("Firefox")) != -1) {
        browserName = "Firefox";
        fullVersion = nAgt.substring(verOffset + 8);
    }
        // In most other browsers, "name/version" is at the end of userAgent
    else if ((nameOffset = nAgt.lastIndexOf(' ') + 1) <
		   (verOffset = nAgt.lastIndexOf('/'))) {
        browserName = nAgt.substring(nameOffset, verOffset);
        fullVersion = nAgt.substring(verOffset + 1);
        if (browserName.toLowerCase() == browserName.toUpperCase()) {
            browserName = navigator.appName;
        }
    }
    // trim the fullVersion string at semicolon/space if present
    if ((ix = fullVersion.indexOf(";")) != -1)
        fullVersion = fullVersion.substring(0, ix);
    if ((ix = fullVersion.indexOf(" ")) != -1)
        fullVersion = fullVersion.substring(0, ix);

    majorVersion = parseInt('' + fullVersion, 10);
    if (isNaN(majorVersion)) {
        fullVersion = '' + parseFloat(navigator.appVersion);
        majorVersion = parseInt(navigator.appVersion, 10);
    }


    return browserName;
}

