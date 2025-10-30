//Hot products
 var donut = new Morris.Donut({
    element: 'hotproducts',
    data: [
      {label: "Mobile", value: 13},
      {label: "Notebook ", value: 17},
      {label: "Desktop ", value: 65}
    ],
	 hoverCallback: function(index, options, content, row) {
        alert();
    },
	formatter: function (x) { return x + "%"},
    colors: ["#dc3545", "#28a745", "#007bff"],
  });
  for(i = 0; i < donut.segments.length; i++) {
    // Remove hover handlers:
    donut.segments[i].handlers['hover'] = [];

    // If you want select functionality through click:
    donut.segments[i].handlers['click'] = [
	donut.select,];
	donut.segments[i].handlers['click'].push( function(i){
		$('.smalltext').css('fontSize','10');
	});
}
$('#hotproducts').on('hover',function(){
$('#hotproducts text:last-child').addClass('largetext');
$('#hotproducts text:nth-last-child(2)').addClass('smalltext'); 
});
$('#hotproducts text:last-child').addClass('largetext');
$('#hotproducts text:nth-last-child(2)').addClass('smalltext'); 
//Product slider
 $('.product-slider').owlCarousel({
    loop:true,
    margin:0,
    nav:true,
	dots:false,
	autoplay:true,
	autoplayTimeout:5000,
    autoplayHoverPause:true,
    responsive:{
        0:{
            items:1
        },
        600:{
            items:1
        },
        1000:{
            items:1
        }
    }
})

  // Country wise revenue

  var options = {
    chart: {
      height: 300,
      type: "radialBar",
      parentHeightOffset: 0
    },
    colors: ["#007bff", "#ffc107","#28a745"],
    grid: {
      borderColor: "rgba(255, 255, 255, 1)",
      padding: {
        top: 0,
		bottom:0
      }
    },
    plotOptions: {
      radialBar: {
        dataLabels: {
          total: {
            show: true,
            label: 'USA'
          }
        }
      }
    },
    series: [80,60,40],
    labels: ["UK", "France", "UAE"]
  };
  
  var chart = new ApexCharts(document.querySelector("#countryrevenue"), options);
  
  chart.render();
  
  var chartAreaBounds = chart.w.globals.dom.baseEl.querySelector('.apexcharts-inner').getBoundingClientRect();
// LINE CHART

      var lineCtx = document.getElementById('chart-line-2').getContext('2d');

      var dataLine = {
        labels: ["Mon", "Tue", "Wen", "Thu", "Fri", "Sat", "Sun"],
        datasets: [
          {
            label: "My First dataset",
            fill: true,
            backgroundColor: "rgba(76,175,80,0.2)",
            borderColor: "#4caf50",
          
            borderDashOffset: 0.0,
                  borderWidth: 2,
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
            data: [2000,1000, 3300, 100,2000,6000, 2500],
            spanGaps: false
          },
			{
					label: 'Dashed',
					fill: true,
					backgroundColor: "rgba(153,171,181,0.2)",
            borderColor: "#99abb5",
				borderWidth: 1,
					borderDash: [3, 5],
				 pointBorderWidth: 0,
      pointHoverRadius: 0,
      pointHoverBackgroundColor: "rgba(75,192,192,1)",
      pointHoverBorderColor: "rgba(220,220,220,1)",
      pointHoverBorderWidth: 0,
	   
      pointRadius: 0,
      pointHitRadius: 0,
					data: [4500,6000, 1500, 4000, 100,4500, 4000],
				  
				}
        ]
      };

      new Chart(lineCtx, {
        type: 'line',
        data: dataLine,
		   
        options: {
			 animation: {
        duration: 1000,
		easing:'linear'
    },
			legend: {
            display: false,
           
        },
			
          scales: {
            xAxes: [{
				
				ticks: {
					display: false,	
						 beginAtZero:true,
						 padding:15,	
    
        },
				 gridLines : {
					  drawTicks:false,
					  
                 zeroLineColor: 'rgba(153,171,181,0.2)',
                        color: 'rgba(153,171,181,0.2)',
                       
                        drawBorder: true,
					 beginAtZero:true,
					 
			    
            }
				
			}],
			     yAxes: [{
					 
					 ticks: {
					display: false,	
            max: 10000,
            min: 0,
            stepSize: 2500,
			padding:15,			
						     
        },
					  gridLines : {
                drawTicks:false,
					 beginAtZero:true,
						  zeroLineColor: '#FFF',
                        color: '#FFF',
						  drawBorder: false,
            }
				 }]
          }
        }
      });

    