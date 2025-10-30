

var CompanyName = "";
$(getdata);
function getdata() {

    transferdata();
}


var aLabels;
var aDatasets1;
var a='', b='';

var arr = [];
var brr = [];
var CountryLabels;
var CountryDatasets1;
var aa = '', bb = '';
var arrCountryLabels = [];
var brrTotalvalueCountry = [];
var UnitsLabels;
var UnitsDatasets1;
var cc = '';
var arrUnitsLabels = [];
var brrTotalvalueUnits = [];
var PortsLabels;
var PortsDatasets1;
var dd = '';
var arrPortsLabels = [];
var brrTotalvaluePorts = [];
var ExportImportLabels;
var ExportimportDatasets1;
var aa = '';
var arrExportimportLabels = [];
var brrTotalvalueExport = [];
var brrTotalvalueImport = [];
var countriesGDPgdp = '';
var countriesGDP = '';

var arrimp = [];
var brrimp = [];
var arrimpCountryLabels = [];
var brrimpTotalvalueCountry = [];
var arrimpUnitsLabels = [];
var brrimpTotalvalueUnits = [];
var arrimpPortsLabels = [];
var brrimpTotalvaluePorts = [];

var renderGraphData = () => {
    'use strict';

    // Bar chart
    if ($('#chartjsBar').length) {
        new Chart($("#chartjsBar"), {
            type: 'bar',
            data: {
                labels: arr,
                datasets: [
                  {
                      label: "Export($)",
                      backgroundColor: ["#007bff", "#ffc107", "#6c757d", "#dc3545", "#28a745", "#800080", "#FFFF00", "#00FF00", "#FF00FF", "#FFA500", "#800000", "#008000", "#43C6DB", "#8AFB17", "#9F000F", "#E41B17", "#F6358A", "#A23BEC", "#E238EC"],
                      data: brr
                  }
                ]
            },
            options: {
                legend: { display: false },
            }
        });
    }

    if ($('#chartjsPie').length) {
        new Chart($('#chartjsPie'), {
            type: 'pie',
            data: {
                labels: arrCountryLabels,
                datasets: [{
                    label: "Export($)",
                    backgroundColor: ["#007bff", "#ffc107", "#6c757d", "#dc3545", "#28a745", "#800080", "#FFFF00", "#00FF00", "#FF00FF", "#FFA500", "#800000", "#008000", "#43C6DB", "#8AFB17", "#9F000F", "#E41B17", "#F6358A", "#A23BEC", "#E238EC"],
                    data: brrTotalvalueCountry
                }]
            }
        });
    }
    if ($('#chartjsPie1').length) {
        new Chart($('#chartjsPie1'), {
            type: 'pie',
            data: {
                labels: arrUnitsLabels,
                datasets: [{
                    label: "Export Value In USD($)",
                    backgroundColor: ["#007bff", "#ffc107", "#6c757d", "#dc3545", "#28a745", "#800080", "#FFFF00", "#00FF00", "#FF00FF", "#FFA500", "#800000", "#008000", "#43C6DB", "#8AFB17", "#9F000F", "#E41B17", "#F6358A", "#A23BEC", "#E238EC"],
                    data: brrTotalvalueUnits
                }]
            }
        });
    }

    if ($('#chartjsPie2').length) {
        new Chart($('#chartjsPie2'), {
            type: 'pie',
            data: {
                labels: arrPortsLabels,
                datasets: [{
                    label: "Export Value In USD($)",
                    backgroundColor: ["#007bff", "#ffc107", "#6c757d", "#dc3545", "#28a745", "#800080", "#FFFF00", "#00FF00", "#FF00FF", "#FFA500", "#800000", "#008000", "#43C6DB", "#8AFB17", "#9F000F", "#E41B17", "#F6358A", "#A23BEC", "#E238EC"],
                    data: brrTotalvaluePorts
                }]
            }
        });
    }
  



    // Apex Area chart start
   
    var options = {
        chart: {
            type: "area",
            height: '300',
            parentHeightOffset: 0,
            foreColor: "#999",
            stacked: true,
            dropShadow: {
                enabled: true,
                enabledSeries: [0],
                top: -2,
                left: 2,
                blur: 5,
                opacity: 0.06
            }
        },
        colors: ["#28a745", "#ffc107"],
        stroke: {
            curve: "smooth",
            width: 3
        },
        dataLabels: {
            enabled: false
        },
        series: [{
            name: 'Export:',
            data: generateDayWiseTimeSeries(0, 30)
        }, {
            name: 'Import:',
            data: generateDayWiseTimeSeries(1, 30)
        }],
        markers: {
            size: 0,
            strokeColor: "#fff",
            strokeWidth: 3,
            strokeOpacity: 1,
            fillOpacity: 1,
            hover: {
                size: 6
            }
        },
        xaxis: {
            type: "datetime",
            axisBorder: {
                show: false
            },
            axisTicks: {
                show: false
            }
        },
        yaxis: {
            tickAmount: 4,
            min: 0,
            labels: {
                offsetX: 24,
                offsetY: -5
            },
            tooltip: {
                enabled: true
            }
        },
        grid: {
            borderColor: "rgba(77, 138, 240, .1)",
            padding: {
                left: -5,
                right: 5,
                bottom: 0
            }
        },
        tooltip: {
            x: {
                format: "dd MMM yyyy"
            },
        },
        legend: {
            position: 'top',
            horizontalAlign: 'left'
        },
        fill: {
            type: "solid",
            fillOpacity: 0.7
        }
    };

    var chart = new ApexCharts(document.querySelector("#apexArea"), options);

    chart.render();

    function generateDayWiseTimeSeries(s, count) {

        var values = [brrTotalvalueExport, brrTotalvalueImport];
        var i = 0;
        var series = [];
        var x = new Date("1 Nov 2012").getTime();
        while (i < count) {
            series.push([x, values[s][i]]);
            x += 86400000;
            i++;
        }
        return series;
    }
    // Apex Area chart end

    if ($('#chartjsDoughnut').length) {
        new Chart($('#chartjsDoughnut'), {
            type: 'doughnut',
            data: {
                labels: ["Africa", "Asia", "Europe"],
                datasets: [
                  {
                      label: "Population (millions)",
                      backgroundColor: ["#007bff", "#28a745", "#dc3545"],
                      data: [2478, 4267, 1334]
                  }
                ]
            }
        });
    }

    if ($('#chartjsArea').length) {
        new Chart($('#chartjsArea'), {
            type: 'line',
            data: {
                labels: [1500, 1600, 1700, 1750, 1800, 1850, 1900, 1950, 1999, 2050],
                datasets: [{
                    data: [86, 114, 106, 106, 107, 111, 133, 221, 783, 2478],
                    label: "Africa",
                    borderColor: "#007bff",
                    backgroundColor: "rgba(0,123,255,0.5)",
                    fill: true
                }, {
                    data: [282, 350, 411, 502, 635, 809, 947, 1402, 3700, 5267],
                    label: "Asia",
                    borderColor: "#dc3545",
                    backgroundColor: "rgba(220,53,69,0.5)",
                    fill: true
                }
                ]
            }
        });
    }
    if ($('#chartjsBubble').length) {
        new Chart($('#chartjsBubble'), {
            type: 'bubble',
            data: {
                labels: "Africa",
                datasets: [
                  {
                      label: ["China"],
                      backgroundColor: "#007bff",
                      borderColor: "#007bff",
                      data: [{
                          x: 21269017,
                          y: 5.245,
                          r: 15
                      }]
                  }, {
                      label: ["Denmark"],
                      backgroundColor: "#dc3545",
                      borderColor: "#dc3545",
                      data: [{
                          x: 258702,
                          y: 7.526,
                          r: 10
                      }]
                  }, {
                      label: ["Germany"],
                      backgroundColor: "#28a745",
                      borderColor: "#28a745",
                      data: [{
                          x: 3979083,
                          y: 6.994,
                          r: 15
                      }]
                  }, {
                      label: ["Japan"],
                      backgroundColor: "#ffc107",
                      borderColor: "#ffc107",
                      data: [{
                          x: 4931877,
                          y: 5.921,
                          r: 15
                      }]
                  }
                ]
            },
            options: {
                scales: {
                    yAxes: [{
                        scaleLabel: {
                            display: true,
                            labelString: "Happiness"
                        }
                    }],
                    xAxes: [{
                        scaleLabel: {
                            display: true,
                            labelString: "GDP (PPP)"
                        }
                    }]
                }
            }
        });
    }

    if ($('#chartjsRadar').length) {
        new Chart($('#chartjsRadar'), {
            type: 'radar',
            data: {
                labels: ["Africa", "Asia", "Europe", "Latin America", "North America"],
                datasets: [
                  {
                      label: "1950",
                      fill: true,
                      backgroundColor: "#28a745",
                      borderColor: "rgba(40,167,69,0.7)",
                      pointBorderColor: "#FFF",
                      pointBackgroundColor: "#CCC",
                      data: [8.77, 55.61, 21.69, 6.62, 6.82]
                  }, {
                      label: "2050",
                      fill: true,
                      backgroundColor: "#dc3545",
                      borderColor: "rgba(220,53,63,0.7)",
                      pointBorderColor: "#cc3240",
                      pointBackgroundColor: "#FFF",
                      pointBorderColor: "#CCC",
                      data: [25.48, 54.16, 7.61, 8.06, 4.45]
                  }
                ]
            }
        });
    }

    if ($('#chartjsPolarArea').length) {
        new Chart($('#chartjsPolarArea'), {
            type: 'polarArea',
            data: {
                labels: ["Africa", "Asia", "Europe", "Latin America"],
                datasets: [
                  {
                      label: "Population (millions)",
                      backgroundColor: ["#007bff", "#ffc107", "#28a745", "#dc3545"],
                      data: [2478, 5267, 734, 784]
                  }
                ]
            }
        });
    }

    if ($('#chartjsGroupedBar').length) {
        new Chart($('#chartjsGroupedBar'), {
            type: 'bar',
            data: {
                labels: ["1900", "1950", "1999", "2050"],
                datasets: [
                  {
                      label: "Africa",
                      backgroundColor: "#28a745",
                      data: [133, 221, 783, 2478]
                  }, {
                      label: "Europe",
                      backgroundColor: "#dc3545",
                      data: [408, 547, 675, 734]
                  }
                ]
            }
        });
    }

    if ($('#chartjsMixedBar').length) {
        new Chart($('#chartjsMixedBar'), {
            type: 'bar',
            data: {
                labels: ["1900", "1950", "1999", "2050"],
                datasets: [{
                    label: "Europe",
                    type: "line",
                    borderColor: "#ffc107",
                    backgroundColor: "rgba(0,0,0,0)",
                    data: [408, 547, 675, 734],
                    fill: false
                }, {
                    label: "Africa",
                    type: "line",
                    borderColor: "#6c757d",
                    backgroundColor: "rgba(0,0,0,0)",
                    data: [133, 221, 783, 2478],
                    fill: false
                }, {
                    label: "Europe",
                    type: "bar",
                    backgroundColor: "#28a745",
                    // backgroundColor: "rgba(0,0,0,0)",
                    data: [408, 547, 675, 734],
                }, {
                    label: "Africa",
                    type: "bar",
                    backgroundColor: "#dc3545",
                    backgroundColorHover: "#dc3545",
                    // backgroundColor: "rgba(0,0,0,0)",
                    data: [133, 221, 783, 2478]
                }
                ]
            }
        });
    }
}
var renderGraphDataLine = () => {
    'use strict';
    if ($('#chartjsLine').length) {


        new Chart($('#chartjsLine'), {
            type: 'line',
            data: {
                labels: arrExportimportLabels,
                datasets: [{
                    data: brrTotalvalueExport,
                    label: "Export",
                    borderColor: "#007bff",
                    backgroundColor: "rgba(0,0,0,0)",
                    fill: false
                }, {
                    data: brrTotalvalueImport,
                    label: "Import",
                    borderColor: "#dc3545",
                    backgroundColor: "rgba(0,0,0,0)",
                    fill: false
                }
                ]
            }
        });
    }
}
function getdataExportImport() {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "companysearch.aspx/getExportImportChartData",
        data: JSON.stringify({ CompanyName: CompanyName}),
        dataType: "json",
        success: function (data) {
            if (data.d.length > 0) {
                var aData = data.d;
                aLabels = aData[0];
                aDatasets1 = aData[1];
                CountryLabels = aData[2];
                CountryDatasets1 = aData[3];
                UnitsLabels = aData[4];
                UnitsDatasets1 = aData[5];
                PortsLabels = aData[6];
                PortsDatasets1 = aData[7];
                $.each(aLabels, function (index, val) {
                    a = "\"" + val + "\"";
                    arr.push(a);
                });
                $.each(aDatasets1, function (index, val) {
                    brr.push(val);
                });

                $.each(CountryLabels, function (index, val) {
                    aa = "\"" + val + "\"";
                    arrCountryLabels.push(aa);
                });
                $.each(CountryDatasets1, function (index, val) {
                    brrTotalvalueCountry.push(val);
                });
                $.each(UnitsLabels, function (index, val) {

                    cc = "\"" + val + "\"";
                    arrUnitsLabels.push(cc);
                });
                $.each(UnitsDatasets1, function (index, val) {

                    brrTotalvalueUnits.push(val);

                });
                $.each(PortsLabels, function (index, val) {

                    dd = "\"" + val + "\"";
                    arrPortsLabels.push(dd);
                });
                $.each(PortsDatasets1, function (index, val) {

                    brrTotalvaluePorts.push(val);

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
};

function getdataImport() {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "companysearch.aspx/getImportChartData",
        data: JSON.stringify({ CompanyName: CompanyName }),
        dataType: "json",
        success: function (data) {
            if (data.d.length > 0) {
                var aData = data.d;
                aLabels = aData[0];
                aDatasets1 = aData[1];
                CountryLabels = aData[2];
                CountryDatasets1 = aData[3];
                UnitsLabels = aData[4];
                UnitsDatasets1 = aData[5];
                PortsLabels = aData[6];
                PortsDatasets1 = aData[7];
                $.each(aLabels, function (index, val) {
                    a = "\"" + val + "\"";
                    arrimp.push(a);
                });
                $.each(aDatasets1, function (index, val) {
                    brrimp.push(val);
                });

                $.each(CountryLabels, function (index, val) {
                    aa = "\"" + val + "\"";
                    arrimpCountryLabels.push(aa);
                });
                $.each(CountryDatasets1, function (index, val) {
                    brrimpTotalvalueCountry.push(val);
                });
                $.each(UnitsLabels, function (index, val) {

                    cc = "\"" + val + "\"";
                    arrimpUnitsLabels.push(cc);
                });
                $.each(UnitsDatasets1, function (index, val) {

                    brrimpTotalvalueUnits.push(val);

                });
                $.each(PortsLabels, function (index, val) {

                    dd = "\"" + val + "\"";
                    arrimpPortsLabels.push(dd);
                });
                $.each(PortsDatasets1, function (index, val) {

                    brrimpTotalvaluePorts.push(val);

                });


                renderGraphDataImport();
            }
            else {
                response([{ label: 'No Records Found', val: -1 }]);
            }
        },
        error: function (result) {
           // alert("Error");
        }
    });
};
$(getdataExportImport);

$(getdataImport);

var renderGraphDataImport = () => {
    'use strict';

    // Bar chart
    if ($('#chartjsBar').length) {
        new Chart($("#chartjsimpBar"), {
            type: 'bar',
            data: {
                labels: arrimp,
                datasets: [
                  {
                      label: "Import($)",
                      backgroundColor: ["#007bff", "#ffc107", "#6c757d", "#dc3545", "#28a745", "#800080", "#FFFF00", "#00FF00", "#FF00FF", "#FFA500", "#800000", "#008000", "#43C6DB", "#8AFB17", "#9F000F", "#E41B17", "#F6358A", "#A23BEC", "#E238EC"],
                      data: brrimp
                  }
                ]
            },
            options: {
                legend: { display: false },
            }
        });
    }

    if ($('#chartjsPie').length) {
        new Chart($('#chartjsimpPie'), {
            type: 'pie',
            data: {
                labels: arrimpCountryLabels,
                datasets: [{
                    label: "Import($)",
                    backgroundColor: ["#007bff", "#ffc107", "#6c757d", "#dc3545", "#28a745", "#800080", "#FFFF00", "#00FF00", "#FF00FF", "#FFA500", "#800000", "#008000", "#43C6DB", "#8AFB17", "#9F000F", "#E41B17", "#F6358A", "#A23BEC", "#E238EC"],
                    data: brrimpTotalvalueCountry
                }]
            }
        });
    }
    if ($('#chartjsPie1').length) {
        new Chart($('#chartjsimpPie1'), {
            type: 'pie',
            data: {
                labels: arrimpUnitsLabels,
                datasets: [{
                    label: "Import Value In USD($)",
                    backgroundColor: ["#007bff", "#ffc107", "#6c757d", "#dc3545", "#28a745", "#800080", "#FFFF00", "#00FF00", "#FF00FF", "#FFA500", "#800000", "#008000", "#43C6DB", "#8AFB17", "#9F000F", "#E41B17", "#F6358A", "#A23BEC", "#E238EC"],
                    data: brrimpTotalvalueUnits
                }]
            }
        });
    }

    if ($('#chartjsPie2').length) {
        new Chart($('#chartjsimpPie2'), {
            type: 'pie',
            data: {
                labels: arrimpPortsLabels,
                datasets: [{
                    label: "Import Value In USD($)",
                    backgroundColor: ["#007bff", "#ffc107", "#6c757d", "#dc3545", "#28a745", "#800080", "#FFFF00", "#00FF00", "#FF00FF", "#FFA500", "#800000", "#008000", "#43C6DB", "#8AFB17", "#9F000F", "#E41B17", "#F6358A", "#A23BEC", "#E238EC"],
                    data: brrimpTotalvaluePorts
                }]
            }
        });
    }
}

function getQueryValues(Mode, Year, MonthFrom, MonthTo, ProductName, HsCode, Chapter, Importer, Exporter, Country, Port, Unit)
{
    Mode = Mode;
    Year = Year;
    MonthFrom = MonthFrom;
    MonthTo = MonthTo;
    ProductName = ProductName;
    HsCode = HsCode;
    Chapter = Chapter;
    Importer = Importer;
    Exporter = Exporter;
    Country = Country;
    Port = Port;
    Unit = Unit;
}
