app.controller('appointmentsController', ['$scope', '$http', function($scope, $http){
  $http.get("/appointments.json").success(function(data){
    $scope.appointments = data[0];
    $scope.apptDates = data[1];
    console.log(data)
  });

  $scope.apptSearchWords = "";

  $scope.noResults = function(date, apptSearchWords) {
    var matchingDateAppts = []
    for (i=0; i< $scope.appointments.length; i++){
      appt = $scope.appointments[i]
      if (appt.readable_date == date) {
        matchingDateAppts.push(appt)
      }
    }

    var numTimesMatching = 0
      // debugger
    for (i=0; i< matchingDateAppts.length; i++){
     appt = matchingDateAppts[i]
      if (_.contains(appt.readable_date, apptSearchWords)) {
        numTimesMatching++
      }
    }

    if (numTimesMatching > 0) {
      return 'block'
    }
    else {
      return 'none'
    }

  }
}])
