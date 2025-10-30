<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sign-up.aspx.cs" Inherits="Extuent.sign_up" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<base target="_blank">
	<title>Media Recorder API Demo - addpipe.com</title>
		
	<link rel="stylesheet" href="css/main.css" />
</head>
<body>
    <form id="form1" runat="server">
   <div>
	<div>
		<video id="live" controls autoplay playsinline muted></video> <video id="playback" controls autoplay style="visibility:hidden"></video><br>
		<div id="controls">
			<button id="rec" onclick="onBtnRecordClicked()">Record</button>
			<button id="pauseRes"   onclick="onPauseResumeClicked()" disabled>Pause</button>
			<button id="stop"  onclick="onBtnStopClicked()" disabled>Stop</button>
			<%--<button id="stateButton" onclick="onStateClicked()">trace state</button>--%>
		</div>
	</div>
	<a id="downloadLink" download="mediarecorder.webm" name="mediarecorder.webm" href></a>
	<p id="data" style="visibility:hidden;"></p>
	<script src="js/adapter-latest.js"></script>
	<script src="js/main.js"></script>
</div>




    </form>
</body>
</html>
