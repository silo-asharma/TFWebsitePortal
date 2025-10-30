app.controller('priceCtrl', function ($scope, $http) {

    $scope.maxSize = 5;     // Limit number for pagination display number.  
    $scope.totalCount = 0;  // Total number of items in all pages. initialize as a zero  
    $scope.pageIndex = 1;   // Current page number. First page is 1.-->  
    $scope.pageSizeSelected = 25; // Maximum number of items per page.  

    $scope.mode = mode;
    $scope.from = from;
    $scope.to = to;
    $scope.year = year;
    $scope.product = product;
    $scope.chapter = chapter;
    $scope.hscode = hscode;
    $scope.importer = importer;
    $scope.exporter = exporter;
    $scope.port = port;
    $scope.country = country;
    $scope.unit = unit;







    $scope.getCompareGraph = function () {

        $http.get("http://indiaexportimportdata.in/Search/GetComparedata?type=json&pageindex=1&pagesize=25+&mode="+$scope.mode + "&from=" + $scope.from + "&to=" + $scope.to + "&year=" + $scope.year + "&product=" + $scope.product + "&chapter=" + $scope.chapter + "&hscode=" + $scope.hscode + "&importer=" + $scope.importer + "&exporter=" + $scope.exporter + "&port=" + $scope.port + "&country=" + $scope.country + "&unit=" + $scope.unit).then(
       // $http.get("http://indiaexportimportdata.in/api/GetComparedata?type=json&pageindex=1&pagesize=25+&mode=" + $scope.mode + "&from=" + $scope.from + "&to=" + $scope.to + "&year=" + $scope.year + "&product=" + $scope.product + "&chapter=" + $scope.chapter + "&hscode=" + $scope.hscode + "&importer=" + $scope.importer + "&exporter=" + $scope.exporter + "&port=" + $scope.port + "&country=" + $scope.country + "&unit=" + $scope.unit).then(

      

            function (response) {



                $scope.comparesummary = response.data.importsummaries;
                $scope.comparecountry = response.data.compareCountries;
                $scope.compareport = response.data.comparePorts;
                $scope.compareexporter = response.data.compareExporters;
                $scope.compareImporter = response.data.compareImporters;
                $scope.compareUnit = response.data.CompareUnits;

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
                                console.log(portData2);
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
                                console.log(portData4);
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


            },

            function (err) {
                var error = err;
            });


    }

    $scope.getCompareGraph();


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



});