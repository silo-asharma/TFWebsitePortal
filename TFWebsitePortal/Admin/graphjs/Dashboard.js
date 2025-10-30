   var myApp = angular.module('myApp', ['ng-fusioncharts']);
   myApp.controller('MyController', function ($scope, $http) {
            $scope.FullList = [];
            $scope.Name = [];
            $scope.Total = [];
            var ports1 = {};
             var series1 = [];
            $scope.getEmployeeList = function () {

                $http.get("http://indiaexportimportdata.in/api/GetChart?cha=85").then(

            function (response) {


                var chartData1 = response.data.charts;

                var i;
                for (i = 0; i < chartData1.length; i++) {

                    if (typeof ports1[chartData1[i].label] === 'undefined') {
                        ports1[chartData1[i].label] = [];
                    }
                    ports1[chartData1[i].label].push(chartData1[i].value);

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

$scope.myDataSource = dataSource
});

