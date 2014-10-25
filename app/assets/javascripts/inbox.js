//isolates user id by parsing through URL
var userId = window.location.href.split("/")[4]

///////////////////////////////////////////////////////////////
// creates inbox controller
app.controller('inboxController', ['$scope', '$http', 'searchFilterFilter', function($scope, $http, searchFilterFilter){

  //pagination
   $scope.currentPage = 1;
   $scope.numPerPage = 9;
   $scope.maxPageRange = 5;
   $scope.filteredMessages = []

  $scope.$watch('currentPage + numPerPage', function() {
    $scope.numPages = function () {
      return Math.ceil($scope.results.length / $scope.numPerPage);
    };
    var begin = (($scope.currentPage - 1) * $scope.numPerPage)
    end = begin + $scope.numPerPage;
    debugger

    $scope.filteredMessages = searchFilterFilter( $scope.searchWords, $scope.messages ).slice(begin, end);
   });

  $http.get("/users/" + userId + "/conversations.json").success(function(data){
    $scope.messages = data;
    // console.log($scope.messages)
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

  $scope.noResults = function(numberResults){
    if(numberResults == 0){
      return "block"
    }
    else{
      return "none"
    }
  }

  $scope.results = function(numberResults){
    if(numberResults !== 0){
      return "block"
    }
    else{
      return "none"
    }
  }
}])

angular.module('app.filter', []).filter('searchFilter', function(){
  return function(searchWords, messages){
    var filtered = []

    angular.forEach(messages, function(message){
      if( searchWord == "" || message.sender_name.indexOf(searchWord) != -1 ){
        filtered.push(message)
      }
    })
    console.log(c=filtered)
    return filtered
  }
})

