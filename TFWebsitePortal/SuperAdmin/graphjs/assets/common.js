var app = angular.module('myApp', ['ui.bootstrap', 'ng-fusioncharts']);
//var app = angular.module('myApp', ['ui.bootstrap', 'ng-fusioncharts']).service('reportService', reportService);
function getParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, '\\$&');
    var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, ' '));
}



var mode = getParameterByName('mode');
var from = getParameterByName('from');
var to = getParameterByName('to');
var year = getParameterByName('year');
var opt = getParameterByName('opt');
var product = getParameterByName('product');
var mproduct = getParameterByName('mproduct');
var chapter = getParameterByName('chapter');
var hscode = getParameterByName('hscode');
var mhscode = getParameterByName('mhscode');
var importer = getParameterByName('importer');
var exporter = getParameterByName('exporter');
var country = getParameterByName('country');
var port = getParameterByName('port');
var unit = getParameterByName('unit');



app.filter('capitalizeWord', function () {
    return function (text) {
        return (!!text) ? text.charAt(0).toUpperCase() + text.substr(1).toLowerCase() : '';
    }
});

app.controller('datacommonctrl', function ($scope, $http) {
    $scope.maxSize = 5;     // Limit number for pagination display number.  
    $scope.totalCount = 0;  // Total number of items in all pages. initialize as a zero  
    $scope.pageIndex = 1;   // Current page number. First page is 1.-->  
    $scope.pageSizeSelected = 25; // Maximum number of items per page.  
    $scope.mode = mode;
    $scope.from = from;
    $scope.to = to;
    $scope.year = year;
    $scope.opt = opt;
    $scope.product = product.split(' ').join('_').trim();
    $scope.mproduct = mproduct.split(' ').join('_').trim();
    $scope.chapter = chapter;
    $scope.hscode = hscode;
    $scope.mhscode = mhscode.split(' ').join('_').trim();
    $scope.importer = importer.split(' ').join('_').trim();
    $scope.exporter = exporter.split(' ').join('_').trim();
    $scope.port = port;
    $scope.country = country;
    $scope.unit = unit;


    $scope.getEmployeeList = function () {

        $("#processing").show();



        $http.get("http://localhost:54863/Search/GetShipment?type=json&pageIndex=" + $scope.pageIndex + "&pageSize=" + $scope.pageSizeSelected + "&mode=" + $scope.mode + "&from=" + $scope.from + "&to=" + $scope.to + "&year=" + $scope.year + "&opt=" + $scope.opt + "&product=" + $scope.product + "&mproduct=" + $scope.mproduct + "&chapter=" + $scope.chapter + "&hscode=" + $scope.hscode + "&mhscode=" + $scope.mhscode + "&importer=" + $scope.importer + "&exporter=" + $scope.exporter + "&port=" + $scope.port + "&country=" + $scope.country + "&unit=" + $scope.unit).then(



            function (response) {


                $scope.totalCount = response.data.totalCount;
                $scope.employees = response.data.Exports;
                $scope.imports = response.data.Imports;
                $("#processing").hide();
            },
            function (err) {
                var error = err;
            });


    }

    //-----Data Binding----------------

    //Loading employees list on first time  
    $scope.getEmployeeList();

    //This method is calling from pagination number  
    $scope.pageChanged = function () {

        $scope.getEmployeeList();
    };

    //This method is calling from dropDown  
    $scope.changePageSize = function () {
        $scope.pageIndex = 25;
        $scope.getEmployeeList();
    };



    //price----------compare------------


    $scope.maxSize = 5;     // Limit number for pagination display number.  
    $scope.totalCount = 0;  // Total number of items in all pages. initialize as a zero  
    $scope.pageIndex = 1;   // Current page number. First page is 1.-->  
    $scope.pageSizeSelected = 25; // Maximum number of items per page.  
    $scope.mode = mode;
    $scope.from = from;
    $scope.to = to;
    $scope.opt = opt;
    $scope.year = year;
    $scope.product = product.split(' ').join('_')
    $scope.mproduct = mproduct.split(' ').join('_');
    $scope.chapter = chapter;
    $scope.hscode = hscode;
    $scope.mhscode = mhscode.split(' ').join('_');
    $scope.importer = importer.split(' ').join('_');
    $scope.exporter = exporter.split(' ').join('_');;
    $scope.port = port;
    $scope.country = country;
    $scope.unit = unit;
    $scope.Name = [];
    $scope.Total = [];







    $scope.getCompareGraph = function () {

     
 

        $http.get("http://localhost:54863/search/GetComparelist?type=json&pageIndex=" + $scope.pageIndex + "&pageSize=" + $scope.pageSizeSelected + "&mode=" + $scope.mode + "&from=" + $scope.from + "&to=" + $scope.to + "&year=" + $scope.year + "&opt=" + $scope.opt + "&product=" + $scope.product + "&mproduct=" + $scope.mproduct + "&chapter=" + $scope.chapter + "&hscode=" + $scope.hscode + "&mhscode=" + $scope.mhscode + "&importer=" + $scope.importer + "&exporter=" + $scope.exporter + "&port=" + $scope.port + "&country=" + $scope.country + "&unit=" + $scope.unit).then(

            //$http.get("http://indiaexportimportdata.in/api/GetComparedata?type=json&pageindex=1&pagesize=25&mode=" + $scope.mode + "&from=" + $scope.from + "&to=" + $scope.to + "&year=" + $scope.year + "&product=" + $scope.product + "&chapter=" + $scope.chapter + "&hscode=" + $scope.hscode + "&importer=" + $scope.importer + "&exporter=" + $scope.exporter + "&port=" + $scope.port + "&country=" + $scope.country + "&unit=" + $scope.unit).then(



            function (response) {

           

                $scope.comparesummary = response.data.importsummaries;
                $scope.comparecountry = response.data.compareCountries;
                $scope.compareport = response.data.comparePorts;
                $scope.compareexporter = response.data.compareExporters;
                $scope.compareImporter = response.data.compareImporters;
                $scope.compareUnit = response.data.compareUnits;

                //------------------------Compare Country wise-----------------------------
                var chartData2 = response.data.compareCountries;
                if (chartData2 != null) {
                    var k;
                    var cats2 = [];
                    var ports2 = {};
                    var series2 = [];
                    for (k = 0; k < chartData2.length; k++) {
                        if (cats2.indexOf(chartData2[k].name) < 0) {
                            cats2.push(chartData2[k].name);
                        }
                        // console.log(cats2);
                        if (typeof ports2[chartData2[k].countryName] === 'undefined') {
                            ports2[chartData2[k].countryName] = [];
                        }
                        ports2[chartData2[k].countryName].push(parseFloat(chartData2[k].total));

                        if ((k + 1) == chartData2.length) {
                            Object.keys(ports2).forEach(function (key) {
                                var portData2 = {
                                    name: key,
                                    data: ports2[key]
                                };
                                series2.push(portData2);
                                //console.log(portData2);
                            });
                            setTimeout(function (data) {
                                compareCountry(data);
                            }, 1000, { cats2: cats2, series2: series2 });
                        }
                    }


                }

                //------------------------Compare Port wise-----------------------------
                var chartData3 = response.data.comparePorts;
                if (chartData3 != null) {
                    var l;
                    var cats3 = [];
                    var ports3 = {};
                    var series3 = [];
                    for (l = 0; l < chartData3.length; l++) {
                        if (cats3.indexOf(chartData3[l].name) < 0) {
                            cats3.push(chartData3[l].name);
                        }
                        // console.log(cats2);
                        if (typeof ports3[chartData3[l].portName] === 'undefined') {
                            ports3[chartData3[l].portName] = [];
                        }
                        ports3[chartData3[l].portName].push(parseFloat(chartData3[l].total));

                        if ((l + 1) == chartData3.length) {
                            Object.keys(ports3).forEach(function (key) {
                                var portData3 = {
                                    name: key,
                                    data: ports3[key]
                                };
                                series3.push(portData3);
                                console.log(portData3);
                            });
                            setTimeout(function (data) {
                                comparePort(data);
                            }, 1000, { cats3: cats3, series3: series3 });
                        }
                    }
                }
                //------------------------Compare Importer wise-----------------------------
                var chartData4 = response.data.compareImporters;
                if (chartData4 != null) {
                    var m;
                    var cats4 = [];
                    var ports4 = {};
                    var series4 = [];
                    for (m = 0; m < chartData4.length; m++) {
                        if (cats4.indexOf(chartData4[m].name) < 0) {
                            cats4.push(chartData4[m].name);
                        }
                        // console.log(cats2);
                        if (typeof ports4[chartData4[m].ImporterName] === 'undefined') {
                            ports4[chartData4[m].ImporterName] = [];
                        }
                        ports4[chartData4[m].ImporterName].push(parseFloat(chartData4[m].total));

                        if ((m + 1) == chartData4.length) {
                            Object.keys(ports4).forEach(function (key) {
                                var portData4 = {
                                    name: key,
                                    data: ports4[key]
                                };
                                series4.push(portData4);
                                //  console.log(portData4);
                            });
                            setTimeout(function (data) {
                                compareImpoter(data);
                            }, 1000, { cats4: cats4, series4: series4 });
                        }
                    }
                }

                //------------------------Compare Supplier wise-----------------------------
                var chartData5 = response.data.compareExporters;
                if (chartData5 != null) {
                    var n;
                    var cats5 = [];
                    var ports5 = {};
                    var series5 = [];
                    for (n = 0; n < chartData5.length; n++) {
                        if (cats5.indexOf(chartData5[n].name) < 0) {
                            cats5.push(chartData5[n].name);
                        }

                        if (typeof ports5[chartData5[n].ExporterName] === 'undefined') {
                            ports5[chartData5[n].ExporterName] = [];
                        }
                        ports5[chartData5[n].ExporterName].push(parseFloat(chartData5[n].total));

                        if ((n + 1) == chartData5.length) {
                            Object.keys(ports5).forEach(function (key) {
                                var portData5 = {
                                    name: key,
                                    data: ports5[key]
                                };
                                series5.push(portData5);

                            });
                            setTimeout(function (data) {
                                compareSupplier(data);
                            }, 1000, { cats5: cats5, series5: series5 });
                        }
                    }

                }


                //------------------------Compare Units wise-----------------------------
                var chartData6 = response.data.compareUnits;
                if (chartData6 != null) {
                    var p;
                    var cats6 = [];
                    var ports6 = {};
                    var series6 = [];
                    for (p = 0; p < chartData6.length; p++) {
                        if (cats6.indexOf(chartData6[p].name) < 0) {
                            cats6.push(chartData6[p].name);
                        }

                        if (typeof ports6[chartData6[p].unitName] === 'undefined') {
                            ports6[chartData6[p].unitName] = [];
                        }
                        ports6[chartData6[p].unitName].push(parseFloat(chartData6[p].total));

                        if ((p + 1) == chartData6.length) {
                            Object.keys(ports6).forEach(function (key) {
                                var portData6 = {
                                    name: key,
                                    data: ports6[key]
                                };
                                series6.push(portData6);

                            });
                            setTimeout(function (data) {
                                compareUnit(data);
                            }, 1000, { cats6: cats6, series6: series6 });
                        }
                    }

                }

            },

            function (err) {
                var error = err;
            });


    }

    function compareCountry(chartData1) {

        Highcharts.chart('price-analysis43', {
            chart: {
                type: 'area'
            },
            title: {
                text: 'Total Value Of  Comparison Top Countries In USD By Date '
            },

            xAxis: {
                categories: chartData1.cats2,
                tickmarkPlacement: 'on',
                title: {
                    enabled: false
                }
            },
            yAxis: {
                title: {
                    text: 'Value In USD'
                },
                labels: {
                    formatter: function () {
                        return this.value / 1000;
                    }
                }
            },
            tooltip: {
                split: true,
                valueSuffix: '$USD'
            },
            exporting: {
                enabled: false
            },

            plotOptions: {
                area: {
                    stacking: 'normal',
                    lineColor: '#666666',
                    lineWidth: 1,
                    marker: {
                        lineWidth: 1,
                        lineColor: '#666666'
                    }
                }
            },
            series: chartData1.series2
        });
    }

    function comparePort(chartData3) {



        Highcharts.chart('price-analysis1', {
            chart: {
                type: 'area'
            },
            title: {
                text: 'Total Value Of  Comparison Top Ports In USD By Date '
            },

            xAxis: {
                categories: chartData3.cats3,
                tickmarkPlacement: 'on',
                title: {
                    enabled: false
                }
            },
            yAxis: {
                title: {
                    text: 'Value In USD'
                },
                labels: {
                    formatter: function () {
                        return this.value / 1000;
                    }
                }
            },
            tooltip: {
                split: true,
                valueSuffix: '$USD'
            },
            plotOptions: {
                area: {
                    stacking: 'normal',
                    lineColor: '#666666',
                    lineWidth: 1,
                    marker: {
                        lineWidth: 1,
                        lineColor: '#666666'
                    }
                }
            },
            series: chartData3.series3
        });
    }

    function compareImpoter(chartData4) {

        Highcharts.chart('linerchart2', {
            chart: {
                type: 'area'
            },
            title: {
                text: 'Total Value Of  Comparison Top Importers In USD By Date '
            },

            xAxis: {
                categories: chartData4.cats4,
                tickmarkPlacement: 'off',
                title: {
                    enabled: false
                }
            },
            yAxis: {
                title: {
                    text: 'Value In USD'
                },
                labels: {
                    formatter: function () {
                        return this.value / 1000;
                    }
                }
            },
            tooltip: {
                split: true,
                valueSuffix: '$USD'
            },
            plotOptions: {
                area: {
                    stacking: 'normal',
                    lineColor: '#666666',
                    lineWidth: 1,
                    marker: {
                        lineWidth: 1,
                        lineColor: '#666666'
                    }
                }
            },
            series: chartData4.series4
        });
    }

    function compareSupplier(chartData5) {

        Highcharts.chart('price-analysis2', {
            chart: {
                type: 'area'
            },
            title: {
                text: 'Total Value Of  Comparison Top Supplier In USD By Date '
            },

            xAxis: {
                categories: chartData5.cats5,
                tickmarkPlacement: 'off',
                title: {
                    enabled: false
                }
            },
            yAxis: {
                title: {
                    text: 'Value In USD'
                },
                labels: {
                    formatter: function () {
                        return this.value / 1000;
                    }
                }
            },
            tooltip: {
                split: true,
                valueSuffix: '$USD'
            },
            plotOptions: {
                area: {
                    stacking: 'normal',
                    lineColor: '#666666',
                    lineWidth: 1,
                    marker: {
                        lineWidth: 1,
                        lineColor: '#666666'
                    }
                }
            },
            series: chartData5.series5
        });
    }


    function compareUnit(chartData6) {

        Highcharts.chart('price-analysisUnit1', {
            chart: {
                type: 'area'
            },
            title: {
                text: 'Total Value Of  Comparison Units  In USD By Date '
            },

            xAxis: {
                categories: chartData6.cats6,
                tickmarkPlacement: 'off',
                title: {
                    enabled: false
                }
            },
            yAxis: {
                title: {
                    text: 'Value In USD'
                },
                labels: {
                    formatter: function () {
                        return this.value / 1000;
                    }
                }
            },
            tooltip: {
                split: true,
                valueSuffix: '$USD'
            },
            plotOptions: {
                area: {
                    stacking: 'normal',
                    lineColor: '#666666',
                    lineWidth: 1,
                    marker: {
                        lineWidth: 1,
                        lineColor: '#666666'
                    }
                }
            },
            series: chartData6.series6
        });
    }

    //------------------End Compare Grapha---------------------

//-------dashboardgraph------start
    $scope.maxSize = 5;     // Limit number for pagination display number.  
    $scope.totalCount = 0;  // Total number of items in all pages. initialize as a zero  
    $scope.pageIndex = 1;   // Current page number. First page is 1.-->  
    $scope.pageSizeSelected = 25; // Maximum number of items per page.  
    $scope.mode = mode;
    $scope.from = from;
    $scope.to = to;
    $scope.year = year;
    $scope.opt = opt;
    $scope.product = product.split(' ').join('_').trim();
    $scope.mproduct = mproduct.split(' ').join('_').trim();
    $scope.chapter = chapter;
    $scope.hscode = hscode;
    $scope.mhscode = mhscode.split(' ').join('_');
    $scope.importer = importer.split(' ').join('_').trim();
    $scope.exporter = exporter.split(' ').join('_').trim();
    $scope.port = port;
    $scope.country = country;
    $scope.unit = unit;

    $scope.getDashboardGraph = function () {

   

        $http.get("http://localhost:54863/Search/GetDashboardlist?type=json&pageIndex=" + $scope.pageIndex + "&pageSize=" + $scope.pageSizeSelected + "&mode=" + $scope.mode + "&from=" + $scope.from + "&to=" + $scope.to + "&year=" + $scope.year + "&opt=" + $scope.opt + "&product=" + $scope.product + "&mproduct=" + $scope.mproduct + "&chapter=" + $scope.chapter + "&hscode=" + $scope.hscode + "&mhscode=" + $scope.mhscode + "&importer=" + $scope.importer + "&exporter=" + $scope.exporter + "&port=" + $scope.port + "&country=" + $scope.country + "&unit=" + $scope.unit).then(


            function (response) {
       
                $scope.Importers = response.data.CountryTotals;
                $scope.portt = response.data.PortTotals;
                $scope.unt = response.data.UnitTotals;
                $scope.uimp = response.data.Importers;
                $scope.uexp = response.data.Consinees;
                $scope.uhs = response.data.MonthNameTotals;
                var countryArr = [];
                for (var i in $scope.Importers) {
                    var seriedata2 = new Array($scope.Importers[i].name, parseFloat($scope.Importers[i].total));
                    countryArr.push(seriedata2);
                }

                marketshareporttotal(countryArr);
                marketshareportdetailstotal(countryArr);
                marketshareportdetailexstotal(countryArr);

                ///---month----
                var monthArr = [];

                for (var i in $scope.uhs) {
                    var seriedata3 = new Array($scope.uhs[i].name, parseFloat($scope.uhs[i].total));
                    monthArr.push(seriedata3);
                }
               
                monthtotal(monthArr);
                monthdeatilstotal(monthArr);
                exporterArrmonthstotal(monthArr);

                 ///---unit----

                var unitArr = [];

                for (var i in $scope.unt) {
                    var seriedata4 = new Array($scope.unt[i].name, parseFloat($scope.unt[i].total));
                    unitArr.push(seriedata4);
                }

                unittotal(unitArr);
                unitdetaitotal(unitArr);
                unitdetaiextotal(unitArr);

                ///---importer----

                var importerArr = [];

                for (var i in $scope.uimp) {
                    var seriedata5 = new Array($scope.uimp[i].name, parseFloat($scope.uimp[i].total));
                    importerArr.push(seriedata5);
                }

                importerArrtotal(importerArr);
                importerdetailArrtotal(importerArr);

                ///---exporter----

                var exporterArr = [];

                for (var i in $scope.uexp) {
                    var seriedata6 = new Array($scope.uexp[i].name, parseFloat($scope.uexp[i].total));
                    exporterArr.push(seriedata6);
                }

                exporterArrtotal(exporterArr);
                exporterArrdetailstotal(exporterArr);



                ///---exporter----

                var portArr = [];

                for (var i in $scope.portt) {
                    var seriedata7 = new Array($scope.portt[i].name, parseFloat($scope.portt[i].total));
                    portArr.push(seriedata7);
                }

                portArrtotal(portArr);
                portArrdetailstotal(portArr);
                portArrdetailsexptotal(portArr);




            },

           
            function (err) {
                var error = err;
            });
      

        
    }

    //country--------------
    function marketshareporttotal(series) {


        Highcharts.chart('pie-chart2', {
            colors: ['#058DC7', '#50B432', '#ED561B', '#DDDF00', '#24CBE5', '#64E572', '#FF9655', '#FFF263', '#6AF9C4'],
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false,
                type: 'pie'
            },
            title: {
                text: 'Country',
              
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.y}</b>'
            },
            plotOptions: {
                pie: {
                    size: '80%',
                    innerSize: 100,
                    depth: 45,
                  
                    dataLabels: {
                        enabled: false,
                        
                        format: '{point.name}'
                    }
                }
            },
            legend: {
                align: 'right',
                verticalAlign: 'top',
                layout: 'vertical',
                x: 0,
                y: 100
            },
            series: [{
                name: 'Value In USD:',
              
                colorByPoint: true,
                data: series,
                
            }]
                
        });
    }
    //month----------------

    function monthtotal(series) {


        Highcharts.chart('pie-chart3', {
 
                 
            
            chart: {
                
                
                className: 'dark-container',
                plotBackgroundColor: '#fff',
                plotBorderColor: '#f1ca17',
               
                sliced: true,
                selected: true,
                showInLegend: false,
                type: 'pie',
                options3d: {
                    enabled: true,
                    alpha: 45
                }
            },
            title: {
                text: 'Month '
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.y}</b>'
            },
            plotOptions: {
                pie: {
                    size: '80%',
                    innerSize: 100,
                    depth: 45,
                    dataLabels: {
                        enabled: false,
                        format: '{point.name}'
                    }
                }
            },
            series: [{
                name: 'Value In USD:',
                colorByPoint: true,
                data: series,

            }]
        });
    }
    //unit--------------
    function unittotal(series) {


        Highcharts.chart('pie-chart4', {
            chart: {
                className: 'dark-container',

                sliced: true,
                selected: true,
                showInLegend: false,
                type: 'pie',
                options3d: {
                    enabled: true,
                    alpha: 45
                }
            },
            title: {
                text: 'Unit'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.y}</b>'
            },
            plotOptions: {
                pie: {
                    size: '80%',
                    innerSize: 100,
                    showInLegend: false,
                    depth: 45,
                    dataLabels: {
                        enabled: false,
                        format: '{point.name}'
                    }
                }
            },
            series: [{
                name: 'Sum of Qty',
                showInLegend: false, 
                colorByPoint: true,
                data: series,

            }]
        });
    }


    //importer--------------
    function importerArrtotal(series) {


        Highcharts.chart('pie-chart5', {
            chart: {
                className: 'dark-container',

                sliced: true,
                selected: true,
                showInLegend: false,
                type: 'column',
                options3d: {
                    enabled: true,
                    alpha: 45
                }
            },
            title: {
                text: 'Importer'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.y}</b>'
            },
            plotOptions: {
                pie: {
                    size: '80%',
                    innerSize: 100,
                    depth: 45,
                    dataLabels: {
                        enabled: true,
                        format: '{point.name}'
                    }
                }
            },
            series: [{
                name: 'Value In USD:',
                colorByPoint: true,
                data: series,

            }]
        });
    }


    //exporter--------------
    function exporterArrtotal(series) {


        Highcharts.chart('pie-chart6', {
            chart: {
                className: 'dark-container',

                sliced: true,
                selected: true,
                showInLegend: false,
                type: 'column',
                options3d: {
                    enabled: true,
                    alpha: 45
                }
            },
            title: {
                text: 'Exporter'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.y}</b>'
            },
            plotOptions: {
                pie: {
                    size: '80%',
                    innerSize: 100,
                    depth: 45,
                    dataLabels: {
                        enabled: false,
                        format: '{point.name}'
                    }
                }
            },
            series: [{
                name: 'Value In USD:',
                colorByPoint: true,
                data: series,

            }]
        });
    }


    //Port--------------
    function portArrtotal(series) {


        Highcharts.chart('pie-chart7', {
            chart: {
                className: 'dark-container',

                sliced: true,
                selected: true,
                showInLegend: false,
                type: 'pie',
                options3d: {
                    enabled: true,
                    alpha: 45
                }
            },
            title: {
                text: 'Port'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.y}</b>'
            },
            plotOptions: {
                pie: {
                    size: '80%',
                    innerSize: 100,
                    depth: 45,
                    dataLabels: {
                        enabled: false,
                        format: '{point.name}'
                    }
                }
            },
            series: [{
                name: 'Value In USD:',
                colorByPoint: true,
                data: series,

            }]
        });
    }


    //Importerdetail--------------
    function importerdetailArrtotal(series) {


        Highcharts.chart('pie-chart8', {
            chart: {
                className: 'dark-container',

                sliced: true,
                selected: true,
                showInLegend: false,
                type: 'column',
                options3d: {
                    enabled: true,
                    alpha: 45
                }
            },
            title: {
                text: 'Importers'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.y}</b>'
            },
            plotOptions: {
                pie: {
                    size: '80%',
                    innerSize: 100,
                    depth: 45,
                    dataLabels: {
                        enabled: false,
                        format: '{point.name}'
                    }
                }
            },
            series: [{
                name: 'Value In USD:',
                colorByPoint: true,
                data: series,

            }]
        });
    }

    //Importermonthdetail--------------
    function monthdeatilstotal(series) {


        Highcharts.chart('pie-chart9', {
            chart: {
                className: 'dark-container',

                sliced: true,
                selected: true,
                showInLegend: false,
                type: 'pie',
                options3d: {
                    enabled: true,
                    alpha: 45
                }
            },
            title: {
                text: 'Month'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.y}</b>'
            },
            plotOptions: {
                pie: {
                    size: '80%',
                    innerSize: 100,
                    depth: 45,
                    dataLabels: {
                        enabled: false,
                        format: '{point.name}'
                    }
                }
            },
            series: [{
                name: 'Value In USD:',
                colorByPoint: true,
                data: series,

            }]
        });
    }

    //Importerunitdetail--------------
    function unitdetaitotal(series) {


        Highcharts.chart('pie-chart10', {
            chart: {
                className: 'dark-container',

                sliced: true,
                selected: true,
                showInLegend: false,
                type: 'pie',
                options3d: {
                    enabled: true,
                    alpha: 45
                }
            },
            title: {
                text: 'Unit'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.y}</b>'
            },
            plotOptions: {
                pie: {
                    size: '80%',
                    innerSize: 100,
                    depth: 45,
                    dataLabels: {
                        enabled: false,
                        format: '{point.name}'
                    }
                }
            },
            series: [{
                name: 'Sum of Qty.',
                colorByPoint: true,
                data: series,

            }]
        });
    }


    //Importerunitdetail--------------
    function marketshareportdetailstotal(series) {


        Highcharts.chart('pie-chart11', {
            chart: {
                className: 'dark-container',

                sliced: true,
                selected: true,
                showInLegend: false,
                type: 'pie',
                options3d: {
                    enabled: true,
                    alpha: 45
                }
            },
            title: {
                text: 'Country'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.y}</b>'
            },
            plotOptions: {
                pie: {
                    size: '80%',
                    innerSize: 100,
                    depth: 45,
                    dataLabels: {
                        enabled: false,
                        format: '{point.name}'
                    }
                }
            },
            series: [{
                name: 'Value In USD:',
                colorByPoint: true,
                data: series,

            }]
        });
    }


    //Importerportdetail--------------
    function portArrdetailstotal(series) {


        Highcharts.chart('pie-chart12', {
            chart: {
                className: 'dark-container',

                sliced: true,
                selected: true,
                showInLegend: false,
                type: 'pie',
                options3d: {
                    enabled: true,
                    alpha: 45
                }
            },
            title: {
                text: 'Port'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.y}</b>'
            },
            plotOptions: {
                pie: {
                    size: '80%',
                    innerSize: 100,
                    depth: 45,
                    dataLabels: {
                        enabled: false,
                        format: '{point.name}'
                    }
                }
            },
            series: [{
                name: 'Value In USD:',
                colorByPoint: true,
                data: series,

            }]
        });
    }

    //exporterportdetail--------------
    function exporterArrdetailstotal(series) {


        Highcharts.chart('pie-chart13', {
            chart: {
                className: 'dark-container',

                sliced: true,
                selected: true,
                showInLegend: false,
                type: 'column',
                options3d: {
                    enabled: true,
                    alpha: 45
                }
            },
            title: {
                text: 'Exporter'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.y}</b>'
            },
            plotOptions: {
                pie: {
                    size: '80%',
                    innerSize: 100,
                    depth: 45,
                    dataLabels: {
                        enabled: false,
                        format: '{point.name}'
                    }
                }
            },
            series: [{
                name: 'Value In USD:',
                colorByPoint: true,
                data: series,

            }]
        });
    }

    //exporterpormonthdetail--------------
    function exporterArrmonthstotal(series) {


        Highcharts.chart('pie-chart14', {
            chart: {
                className: 'dark-container',

                sliced: true,
                selected: true,
                showInLegend: false,
                type: 'pie',
                options3d: {
                    enabled: true,
                    alpha: 45
                }
            },
            title: {
                text: 'Month'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.y}</b>'
            },
            plotOptions: {
                pie: {
                    size: '80%',
                    innerSize: 100,
                    depth: 45,
                    dataLabels: {
                        enabled: false,
                        format: '{point.name}'
                    }
                }
            },
            series: [{
                name: 'Value In USD:',
                colorByPoint: true,
                data: series,

            }]
        });
    }


    //exporterporUnitdetail--------------
    function unitdetaiextotal(series) {


        Highcharts.chart('pie-chart15', {
            chart: {
                className: 'dark-container',

                sliced: true,
                selected: true,
                showInLegend: false,
                type: 'pie',
                options3d: {
                    enabled: true,
                    alpha: 45
                }
            },
            title: {
                text: 'Unit'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.y}</b>'
            },
            plotOptions: {
                pie: {
                    size: '80%',
                    innerSize: 100,
                    depth: 45,
                    dataLabels: {
                        enabled: false,
                        format: '{point.name}'
                    }
                }
            },
            series: [{
                name: 'Sum of Qty',
                colorByPoint: true,
                data: series,

            }]
        });
    }

    //exporterporcountrydetail--------------
    function marketshareportdetailexstotal(series) {


        Highcharts.chart('pie-chart16', {
            chart: {
                className: 'dark-container',

                sliced: true,
                selected: true,
                showInLegend: false,
                type: 'pie',
                options3d: {
                    enabled: true,
                    alpha: 45
                }
            },
            title: {
                text: 'Country'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.y}</b>'
            },
            plotOptions: {
                pie: {
                    size: '80%',
                    innerSize: 100,
                    depth: 45,
                    dataLabels: {
                        enabled: false,
                        format: '{point.name}'
                    }
                }
            },
            series: [{
                name: 'Value In USD:',
                colorByPoint: true,
                data: series,

            }]
        });
    }

    //exporterporPortdetail--------------
    function portArrdetailsexptotal(series) {


        Highcharts.chart('pie-chart17', {
            chart: {
                className: 'dark-container',

                sliced: true,
                selected: true,
                showInLegend: false,
                type: 'pie',
                options3d: {
                    enabled: true,
                    alpha: 45
                }
            },
            title: {
                text: 'Port'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.y}</b>'
            },
            plotOptions: {
                pie: {
                    size: '80%',
                    innerSize: 100,
                    depth: 45,
                    dataLabels: {
                        enabled: false,
                        format: '{point.name}'
                    }
                }
            },
            series: [{
                name: 'Value In USD:',
                colorByPoint: true,
                data: series,

            }]
        });
    }


    //----------------end----dashboard--------------------





    //start--------------------suplierdetails-----------------



    $scope.maxSize = 5;     // Limit number for pagination display number.  
    $scope.totalCount = 0;  // Total number of items in all pages. initialize as a zero  
    $scope.pageIndex = 1;   // Current page number. First page is 1.-->  
    $scope.pageSizeSelected = 25; // Maximum number of items per page.  
    $scope.mode = mode;
    $scope.from = from;
    $scope.to = to;
    $scope.year = year;
    $scope.opt = opt;
    $scope.product = product.split(' ').join('_').trim();
    $scope.mproduct = mproduct.split(' ').join('_').trim();
    $scope.chapter = chapter;
    $scope.hscode = hscode;
    $scope.mhscode = mhscode.split(' ').join('_');
    $scope.importer = importer.split(' ').join('_').trim();
    $scope.exporter = exporter.split(' ').join('_').trim();
    $scope.port = port;
    $scope.country = country;
    $scope.unit = unit;

    $scope.getDashboardexporter = function () {


        
        $http.get("http://localhost:54863/Search/GetSupplierlist?type=json&pageIndex=" + $scope.pageIndex + "&pageSize=" + $scope.pageSizeSelected + "&mode=" + $scope.mode + "&from=" + $scope.from + "&to=" + $scope.to + "&year=" + $scope.year + "&opt=" + $scope.opt + "&product=" + $scope.product + "&mproduct=" + $scope.mproduct + "&chapter=" + $scope.chapter + "&hscode=" + $scope.hscode + "&mhscode=" + $scope.mhscode + "&importer=" + $scope.importer + "&exporter=" + $scope.exporter + "&port=" + $scope.port + "&country=" + $scope.country + "&unit=" + $scope.unit).then(


            function (response) {

                $scope.exports = response.data.ExDdetails;
                $scope.unitpie = response.data.Unitdetails;
                $scope.countrytpie = response.data.countryDetails;
                $scope.portpie = response.data.portdetails;
                $scope.monthexp = response.data.impdetails;
                $scope.hshexp = response.data.hscodeDetails;
                $scope.producthexp = response.data.productDetails;


                var exportsArr = [];
                for (var i in $scope.exports) {
                    var seriedata2 = new Array($scope.exports[i].name, parseFloat($scope.exports[i].total));
                    exportsArr.push(seriedata2);
                }
                exporterdeatilstotal(exportsArr);

                ///---------------importer------details---

                var importerArr = [];
                for (var i in $scope.monthexp) {
                    var seriedata3 = new Array($scope.monthexp[i].name, parseFloat($scope.monthexp[i].total));
                    importerArr.push(seriedata3);
                }
                importerdeatilstotal(importerArr);

              ///---------------Hscode------details---

                var hscoderArr = [];
                for (var i in $scope.hshexp) {
                    var seriedata4 = new Array($scope.hshexp[i].name, parseFloat($scope.hshexp[i].total));
                    hscoderArr.push(seriedata4);
                }
                hscodedeatilstotal(hscoderArr);

                ///---------------PRODUCT------details---

                var productArr = [];
                for (var i in $scope.producthexp) {
                    var seriedata5 = new Array($scope.producthexp[i].name, parseFloat($scope.producthexp[i].total));
                    productArr.push(seriedata5);
                }
                productdeatilstotal(productArr);

                ///---------------unit------details---

                var unitArr = [];
                for (var i in $scope.unitpie) {
                    var seriedata6 = new Array($scope.unitpie[i].name, parseFloat($scope.unitpie[i].total));
                    unitArr.push(seriedata6);
                }
                unitdeatilstotal(unitArr);

                ///---------------Country------details---

                var countryArr = [];
                for (var i in $scope.countrytpie) {
                    var seriedata7 = new Array($scope.countrytpie[i].name, parseFloat($scope.countrytpie[i].total));
                    countryArr.push(seriedata7);
                }
                countrydeatilstotal(countryArr);

                ///---------------Port------details---

                var portArr = [];
                for (var i in $scope.portpie) {
                    var seriedata8 = new Array($scope.portpie[i].name, parseFloat($scope.portpie[i].total));
                    portArr.push(seriedata8);
                }
                portdeatilstotal(portArr);


            },

            function (err) {
                var error = err;
            });



    }

    //country--------------
    function exporterdeatilstotal(series) {


        Highcharts.chart('pie-chart20', {
            chart: {
                className: 'dark-container',

                sliced: true,
                selected: true,
                showInLegend: false,
                type: 'column',
                options3d: {
                    enabled: true,
                    alpha: 45
                }
            },
            title: {
                text: 'Exporter'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.y}</b>'
            },
            plotOptions: {
                pie: {
                    size: '80%',
                    innerSize: 100,
                    depth: 45,
                    dataLabels: {
                        enabled: false,
                        format: '{point.name}'
                    }
                }
            },
            series: [{
                name: 'Value In USD:',
                colorByPoint: true,
                data: series,

            }]
        });
    }

    //importer---details--------
    function importerdeatilstotal(series) {


        Highcharts.chart('pie-chart21', {
            chart: {
                className: 'dark-container',

                sliced: true,
                selected: true,
                showInLegend: false,
                type: 'pie',
                options3d: {
                    enabled: true,
                    alpha: 45
                }
            },
            title: {
                text: 'Importer'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.y}</b>'
            },
            plotOptions: {
                pie: {
                    size: '80%',
                    innerSize: 100,
                    depth: 45,
                    dataLabels: {
                        enabled: false,
                        format: '{point.name}'
                    }
                }
            },
            series: [{
                name: 'Value In USD:',
                colorByPoint: true,
                data: series,

            }]
        });
    }

    //hscode---details--------
    function hscodedeatilstotal(series) {


        Highcharts.chart('pie-chart22', {
            chart: {
                className: 'dark-container',

                sliced: true,
                selected: true,
                showInLegend: false,
                type: 'line',
                options3d: {
                    enabled: true,
                    alpha: 45
                }
            },
            title: {
                text: 'Hs Code'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.y}</b>'
            },
            plotOptions: {
                pie: {
                    size: '80%',
                    innerSize: 100,
                    depth: 45,
                    dataLabels: {
                        enabled: false,
                        format: '{point.name}'
                    }
                }
            },
            series: [{
                name: 'Value In USD:',
                colorByPoint: true,
                data: series,

            }]
        });
    }
    //product---details--------
    function productdeatilstotal(series) {


        Highcharts.chart('pie-chart23', {
            chart: {
                className: 'dark-container',

                sliced: true,
                selected: true,
                showInLegend: false,
                type: 'pie',
                options3d: {
                    enabled: true,
                    alpha: 45
                }
            },
            title: {
                text: 'Product'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.y}</b>'
            },
            plotOptions: {
                pie: {
                    size: '80%',
                    innerSize: 100,
                    depth: 45,
                    dataLabels: {
                        enabled: false,
                        format: '{point.name}'
                    }
                }
            },
            series: [{
                name: 'Value In USD:',
                colorByPoint: true,
                data: series,

            }]
        });
    }

    //Unit---details--------
    function unitdeatilstotal(series) {


        Highcharts.chart('pie-chart24', {
            chart: {
                className: 'dark-container',

                sliced: true,
                selected: true,
                showInLegend: false,
                type: 'pie',
                options3d: {
                    enabled: true,
                    alpha: 45
                }
            },
            title: {
                text: 'Unit'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.y}</b>'
            },
            plotOptions: {
                pie: {
                    size: '80%',
                    innerSize: 100,
                    depth: 45,
                    dataLabels: {
                        enabled: false,
                        format: '{point.name}'
                    }
                }
            },
            series: [{
                name: 'Sum of Qty',
                colorByPoint: true,
                data: series,

            }]
        });
    }

    //Country---details--------

    function countrydeatilstotal(series) {


        Highcharts.chart('pie-chart25', {
            chart: {
                className: 'dark-container',

                sliced: true,
                selected: true,
                showInLegend: false,
                type: 'pie',
                options3d: {
                    enabled: true,
                    alpha: 45
                }
            },
            title: {
                text: 'Country'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.y}</b>'
            },
            plotOptions: {
                pie: {
                    size: '80%',
                    innerSize: 100,
                    depth: 45,
                    dataLabels: {
                        enabled: false,
                        format: '{point.name}'
                    }
                }
            },
            series: [{
                name: 'Value In USD:',
                colorByPoint: true,
                data: series,

            }]
        });
    }

    //Port---details--------

    function portdeatilstotal(series) {


        Highcharts.chart('pie-chart26', {
            chart: {
                className: 'dark-container',

                sliced: true,
                selected: true,
                showInLegend: false,
                type: 'pie',
                options3d: {
                    enabled: true,
                    alpha: 45
                }
            },
            title: {
                text: 'Port'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.y}</b>'
            },
            plotOptions: {
                pie: {
                    size: '80%',
                    innerSize: 100,
                    depth: 45,
                    dataLabels: {
                        enabled: false,
                        format: '{point.name}'
                    }
                }
            },
            series: [{
                name: 'Value In USD:',
                colorByPoint: true,
                data: series,

            }]
        });
    }

    //end--------------------------supplier------details------------------

    // Filter
    // Filter

    $scope.getfilter = function () {

        $scope.maxSize = 5;     // Limit number for pagination display number.  
        $scope.totalCount = 0;  // Total number of items in all pages. initialize as a zero  
        $scope.pageIndex = 1;   // Current page number. First page is 1.-->  
        $scope.pageSizeSelected = 25; // Maximum number of items per page.  
        $scope.mode = mode;
        $scope.from = from;
        $scope.to = to;
        $scope.year = year;
        $scope.opt = opt;
        $scope.product = product.split(' ').join('_').trim();
        $scope.mproduct = mproduct.split(' ').join('_').trim();
        $scope.chapter = chapter;
        $scope.hscode = hscode;
        $scope.mhscode = mhscode.split(' ').join('_').trim();
        $scope.importer = importer.split(' ').join('_').trim();
        $scope.exporter = exporter.split(' ').join('_').trim();
        $scope.port = port;
        $scope.country = country;
        $scope.unit = unit;


        $("#processing1").show();


        $http.get("http://localhost:54863/Search/filterdata?type=json&pageIndex=" + $scope.pageIndex + "&pageSize=" + $scope.pageSizeSelected + "&mode=" + $scope.mode + "&from=" + $scope.from + "&to=" + $scope.to + "&year=" + $scope.year + "&opt=" + $scope.opt + "&product=" + $scope.product + "&mproduct=" + $scope.mproduct + "&chapter=" + $scope.chapter + "&hscode=" + $scope.hscode + "&mhscode=" + $scope.mhscode + "&importer=" + $scope.importer + "&exporter=" + $scope.exporter + "&port=" + $scope.port + "&country=" + $scope.country + "&unit=" + $scope.unit).then(

            //$http.get("http://indiaexportimportdata.in/api/filter?type=json&pageIndex=" + $scope.pageIndex + "&pageSize=" + $scope.pageSizeSelected + "&mode=" + $scope.mode + "&from=" + $scope.from + "&to=" + $scope.to + "&year=" + $scope.year + "&product=" + $scope.product + "&mproduct=" + $scope.mproduct + "&chapter=" + $scope.chapter + "&hscode=" + $scope.hscode + "&mhscode=" + $scope.mhscode + "&importer=" + $scope.importer + "&exporter=" + $scope.exporter + "&port=" + $scope.port + "&country=" + $scope.country + "&unit=" + $scope.unit).then(


            function (response) {



                $scope.hscodesu = response.data.HsCodes;
                $scope.portes = response.data.Ports;
                $scope.countr = response.data.Countries;
                $scope.uni = response.data.Units;

                $("#processing1").hide();

            },
            function (err) {
                var error = err;
            });


    }


    $scope.getfilter();



   

   









});

  
















