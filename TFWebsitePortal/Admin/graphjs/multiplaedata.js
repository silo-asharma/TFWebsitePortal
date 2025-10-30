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
var header = getParameterByName('header');
var keyword = getParameterByName('keyword');




app.filter('capitalizeWord', function () {
    return function (text) {
        return (!!text) ? text.charAt(0).toUpperCase() + text.substr(1).toLowerCase() : '';
    }
});

app.controller('datactrl', function ($scope, $http) {
    $scope.maxSize = 5;     // Limit number for pagination display number.  
    $scope.totalCount = 0;  // Total number of items in all pages. initialize as a zero  
    $scope.pageIndex = 1;   // Current page number. First page is 1.-->  
    $scope.pageSizeSelected = 10; // Maximum number of items per page.  
    $scope.mode = mode;
    $scope.from = from;
    $scope.to = to;
    $scope.year = year;
    $scope.header = header;
    $scope.keyword = keyword;
    $scope.getEmployeeList = function () {
        $("#processing").show();
     //   $http.get("http://localhost:54863/Search/GetmulShipment?pageIndex="+$scope.pageIndex +"&pageSize=" +$scope.pageSizeSelected +"&mode=" +$scope.mode+"&year="+$scope.year +"&from="+ $scope.from +"&to=" +$scope.to +"&header=" + $scope.header + "&keyword=" + $scope.keyword).then(
        $http.get("http://indiaexportimportdata.in/Search/GetmulShipment?pageIndex=" + $scope.pageIndex + "&pageSize=" + $scope.pageSizeSelected + "&mode=" + $scope.mode + "&year=" + $scope.year + "&from=" + $scope.from + "&to=" + $scope.to + "&header=" + $scope.header + "&keyword=" + $scope.keyword).then(
   
            function (response) {
               
                $scope.totalCount = response.data.totalCount;
                $scope.employees = response.data.Exports;
                $("#processing").hide();
            },
            function (err) {
                var error = err;
            });
        

    }


   
    
    $scope.getEmployeeList();
  
    $scope.pageChanged = function () {
      
        $scope.getEmployeeList();
    };
  
    $scope.changePageSize = function () {
        $scope.pageIndex = 25;
        $scope.getEmployeeList();
    };  
  
 
         
    



});










 