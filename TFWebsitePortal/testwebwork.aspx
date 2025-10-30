<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testwebwork.aspx.cs" Inherits="Extuent.testwebwork" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script>
 window.onload = function () {

var options = {
	animationEnabled: true,
	title: {
		text: ""
	},
	data: [{
		type: "funnel",
		indexLabel: "{label} - {y}",
		toolTipContent: "<b>{label}</b>: {y} <b>({percentage}%)</b>",
		neckWidth: 150,
		neckHeight: 100,
		valueRepresents: "area",
		dataPoints: [
			
			{ y: 1448, label: "Qualified" },
			{ y: 1243, label: "Interviewed" },
			{ y: 241, label: "Offers Extended" },
			{ y: 207, label: "Filled" }
		]
	}]
};
calculatePercentage();
$("#chartContainer").CanvasJSChart(options);

function calculatePercentage() {
	var dataPoint = options.data[0].dataPoints;
	var total = dataPoint[0].y;
	for (var i = 0; i < dataPoint.length; i++) {
		if (i == 0) {
			options.data[0].dataPoints[i].percentage = 100;
		} else {
			options.data[0].dataPoints[i].percentage = ((dataPoint[i].y / total) * 100).toFixed(2);
		}
	}
}

}
</script>

</head>
<body>
    <form id="form1" runat="server">
<div id="chartContainer" style="height: 300px; width: 50%;"></div>
<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>

        </form>

</body>
</html>
