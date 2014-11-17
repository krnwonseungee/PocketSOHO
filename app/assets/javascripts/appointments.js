app.controller('appointmentsController', ['$scope', '$http', function($scope, $http){
  $http.get("/appointments.json").success(function(data){
    $scope.appointments = data[0];
    $scope.apptDates = data[1];
    console.log(data)
  });

  $scope.apptSearchWords = "";
}])
