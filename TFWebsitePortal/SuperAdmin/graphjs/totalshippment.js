
app.controller('crtltotal', function ($scope, $http) {
    $scope.maxSize = 5;     // Limit number for pagination display number.  
    $scope.totalCount = 0;  // Total number of items in all pages. initialize as a zero  
    $scope.pageIndex = 1;   // Current page number. First page is 1.-->  
    $scope.pageSizeSelected = 20; // Maximum number of items per page.  
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
    $scope.importer = importer;
    $scope.exporter = exporter;
    $scope.port = port;
    $scope.country = country;
    $scope.unit = unit;
   
    
    $scope.getEmployeeList = function () {
        
        $http.get("http://indiaexportimportdata.in/Search/totalshippment?type=json&pageIndex=" + $scope.pageIndex + "&pageSize=" + $scope.pageSizeSelected + "&mode=" + $scope.mode + "&from=" + $scope.from + "&to=" + $scope.to + "&year=" + $scope.year + "&opt=" + $scope.opt + "&product=" + $scope.product + "&mproduct=" + $scope.mproduct + "&chapter=" + $scope.chapter + "&hscode=" + $scope.hscode + "&mhscode=" + $scope.mhscode + "&importer=" + $scope.importer + "&exporter=" + $scope.exporter + "&port=" + $scope.port + "&country=" + $scope.country + "&unit=" + $scope.unit).then(


       // $http.get("http://indiaexportimportdata.in/api/totalresult?type=json&pageIndex=" + $scope.pageIndex + "&pageSize=" + $scope.pageSizeSelected + "&mode=" + $scope.mode + "&from=" + $scope.from + "&to=" + $scope.to + "&year=" + $scope.year + "&product=" + $scope.product + "&mproduct=" + $scope.mproduct + "&chapter=" + $scope.chapter + "&hscode=" + $scope.hscode + "&mhscode=" + $scope.mhscode + "&importer=" + $scope.importer + "&exporter=" + $scope.exporter + "&port=" + $scope.port + "&country=" + $scope.country + "&unit=" + $scope.unit).then(


            function (response) {
               
                
                $scope.totalCount = response.data.totalCount;
                $scope.hscodesu = response.data.HsCodes;
                $scope.portes = response.data.Ports;
                $scope.countr = response.data.Countries;
                $scope.uni = response.data.Units;
                $scope.employees = response.data.Exports;
                $scope.imports = response.data.Imports;
               
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

 

});










 