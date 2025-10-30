
var LoginID = "";
var KeywordLabels;
var KeywordsDatasets1;
var aaa = '';
var arrKeywordsLabels = [];
var brrTotalvalueKeywords = [];
var ShipmentLabels;
var ShipmentDatasets1;
var bbb = '';
var arrShipmentLabels = [];
var brrTotalvalueShipment = [];
function getExportimportDataKeywors() {

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "dashboard.aspx/GetListofKeywords",
        data: JSON.stringify({ LoginID: LoginID }),
        dataType: "json",
        success: function (data) {
            if (data.d.length > 0) {


                var aData = data.d;
                KeywordLabels = aData[0];
                KeywordsDatasets1 = aData[1];
                ShipmentLabels = aData[2];
                ShipmentDatasets1 = aData[3];

                $.each(KeywordLabels, function (index, val) {

                    aaa = "\"" + val + "\"";
                    arrKeywordsLabels.push(aaa);
                });

                $.each(KeywordsDatasets1, function (index, val) {

                    brrTotalvalueKeywords.push(val);

                });

                $.each(ShipmentLabels, function (index, val) {

                    aaa = "\"" + val + "\"";
                    arrShipmentLabels.push(aaa);
                });

                $.each(ShipmentDatasets1, function (index, val) {

                    brrTotalvalueShipment.push(val);

                });
                renderGraphData();
            }
            else {
                response([{ label: 'No Records Found', val: -1 }]);
            }
        },
        error: function (result) {
         //   alert("Error");
        }
    });
}

var renderGraphData = () =>{
    var lineCtx = document.getElementById('chart-line-2').getContext('2d');

    var dataLine = {
        labels: arrShipmentLabels,
        datasets: [
          {
              label: "Task completed",
              fill: true,
              backgroundColor: "rgba(76,175,80,0.6)",
              borderColor: "rgba(76,175,80,0.8)",

              borderDashOffset: 0.0,
              borderWidth: 5,
              pointBorderColor: "#4caf50",
              pointBackgroundColor: "#fff",
              pointHoverRadius: 5,
              pointHoverBackgroundColor: "#FFF",
              pointHoverBorderColor: "#4caf50",
              pointHoverBorderWidth: 2,
              shadowOffsetX: 0,

              shadowOffsetY: 0,

              shadowBlur: 0,


              pointRadius: 1,
              pointHitRadius: 15,
              data: brrTotalvalueShipment,
              spanGaps: false
          }
        ]
    };

    new Chart(lineCtx, {
        type: 'line',
        data: dataLine,

        options: {
            animation: {
                duration: 1000,
                easing: 'linear'
            },
            legend: {
                display: false,

            },

            scales: {
                xAxes: [{
                    display: false,
                    ticks: {
                        beginAtZero: true,
                        padding: 15,

                    },
                    gridLines: {
                        drawTicks: false,
                        drawBorder: false,
                        zeroLineColor: 'rgba(153,171,181,0)',
                        color: 'rgba(153,171,181,0)',

                        drawBorder: true,
                        beginAtZero: true,


                    }

                }],
                yAxes: [{
                    display: false,
                    ticks: {

                        max: 20,
                        min: 0,
                        stepSize: 4,
                        padding: 15,

                    },
                    gridLines: {
                        drawBorder: false,
                        drawTicks: false,
                        beginAtZero: true,
                        zeroLineColor: '#FFF',
                        color: '#FFF',
                        drawBorder: false,
                    }
                }]
            }
        }
    });
    //Project Slider
    $('.project-slider').owlCarousel({
        loop: true,
        margin: 10,
        nav: true,
        dots: false,
        autoplay: true,
        autoplayTimeout: 5000,
        autoplayHoverPause: true,
        responsive: {
            0: {
                items: 1
            },
            600: {
                items: 1
            },
            1000: {
                items: 1
            }
        }
    })
    //projeck workload
    new Chart(document.getElementById('projectworkload'), {
        type: 'doughnut',
        data: {
            labels:
            arrKeywordsLabels,
            datasets:
                [{
                    'label': 'My First Dataset',
                    data:
                        brrTotalvalueKeywords,

                    backgroundColor:
                        ['#28a745',
                        '#dc3545',
                        '#ffc107'],
                }]

        },

        options: {

            responsive: true,
            legend: { position: 'right' },

            maintainAspectRatio: false,
        }
    });

}
// LINE CHART

$(getExportimportDataKeywors);

$(document).ready(function(){
	// Tasklist check
         $('input[name="task"]').click(function(){

            if($(this).prop("checked") == true){

                    $(this).parents('.task-box').addClass('task-complete');

            }

            else if($(this).prop("checked") == false){

                 $(this).parents('.task-box').removeClass('task-complete');

            }

        });
  //Counter
$('.counter').counterUp({
        delay: 50,
        time: 2000
    });
});

