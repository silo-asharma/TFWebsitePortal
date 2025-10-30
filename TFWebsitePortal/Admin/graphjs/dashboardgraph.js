       var myApp = angular.module('myApp', ['ng-fusioncharts']);

        //STEP 2 - Chart Data

myApp.controller('portctrl', function ($scope, $http) {
            // datasource
            $scope.FullList = [];
            $scope.Name = [];
            $scope.Total = [];
            var ports1 = {};
            var series1 = [];
            $scope.getEmployeeList = function () {

                $http.get("http://indiaexportimportdata.in/api/demodata?ch=10").then(

                    function (response) {


                        var chartData1 = response.data.portCharts;

                        var i;
                        for (i = 0; i < chartData1.length; i++) {


                            if (typeof ports1[chartData1[i].name] === 'undefined') {
                                ports1[chartData1[i].name] = [];
                            }


                            ports1[chartData1[i].name].push(chartData1[i].sum);

                            if ((i + 1) == chartData1.length) {
                                Object.keys(ports1).forEach(function (key) {
                                    var portData1 = {
                                        label: key,
                                        value: ports1[key]
                                    };
                                    series1.push(portData1);
                                });
                            }
                        }
                    },
                    function (err) {
                        var error = err;
                    });

            }

            $scope.getEmployeeList();
            const dataSource = {
                chart: {

                    caption: "Monthly Revenue",
                    subCaption: "Last year",
                    xAxisName: "Month",
                    yAxisName: "Amount (In USD)",
                    numberPrefix: "$",
                    theme: "fusion",
                    showlabels: "0"

                },

                "data": series1
            };

    $scope.portdata = dataSource
        });