

app.controller('crtlfilter', function ($scope, $http) {
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
        $("#processing1").show();

        
        $http.get("http://localhost:54863/Search/mulfilterdata?pageIndex=" + $scope.pageIndex + "&pageSize=" + $scope.pageSizeSelected + "&mode=" + $scope.mode + "&year=" + $scope.year + "&from=" + $scope.from + "&to=" + $scope.to + "&header=" + $scope.header + "&keyword=" + $scope.keyword).then(


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










 