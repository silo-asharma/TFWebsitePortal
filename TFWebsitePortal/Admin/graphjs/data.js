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

app.controller('datactrl', function ($scope, $http) {
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

        

        $http.get("http://indiaexportimportdata.in/Search/GetShipment?type=json&pageIndex="+$scope.pageIndex + "&pageSize=" + $scope.pageSizeSelected + "&mode=" + $scope.mode + "&from=" + $scope.from + "&to=" + $scope.to + "&year=" + $scope.year + "&opt=" + $scope.opt + "&product=" + $scope.product + "&mproduct=" + $scope.mproduct + "&chapter=" + $scope.chapter +"&hscode=" + $scope.hscode +"&mhscode=" +$scope.mhscode + "&importer=" +$scope.importer +"&exporter=" +$scope.exporter +"&port=" +$scope.port +"&country=" +$scope.country + "&unit=" + $scope.unit).then(



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
  
 
         
    //$scope.loadrecord = function (id) {
    //    $http.get("/Home/Get_databyid?id=" + id).then(function (d) {
    //        $scope.register = d.data[0];
    //    }, function (error) {
    //        alert('Failed');
    //    });
    //};


    $scope.loadrecord = function (id) {
        alert("hello");
        
    };




});










 