//isolates user id by parsing through URL
var userId = window.location.href.split("/")[4]

///////////////////////////////////////////////////////////////
// creates inbox controller
app.controller('inboxController', ['$scope', '$http', function($scope, $http){

  $http.get("/users/" + userId + "/conversations.json").success(function(data){
    $scope.messages = data;
    console.log(b=$scope.messages)
  });

  $scope.searchWords = "";

  $scope.getReadStatus = function(message){
    if(message.read_by_current_user == false){
      return "bold";
    }
    else {
      return "normal";
    }
  }
}])
