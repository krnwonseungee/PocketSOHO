//isolates user id by parsing through URL
var userId = window.location.href.split("/")[4]

///////////////////////////////////////////////////////////////
// creates inbox controller
app.filter('offset', function() {
  return function(messages, start) {
    // debugger
    start = parseInt(start, 10);
    return messages.slice(start);
  };
});


app.controller('inboxController', ['$scope', '$http', function($scope, $http){

  $http.get("/users/" + userId + "/conversations.json").success(function(data){
    $scope.messages = data;
    console.log(b=$scope.messages)
  });

  $scope.inboxSearchWords = "";

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

      $scope.itemsPerPage = 4;
      $scope.currentPage = 0;

      $scope.range = function() {
          var rangeSize = 0;
          var ret = [];
          var start;

          start = $scope.currentPage;
          if ( start > $scope.pageCount()-rangeSize ) {
            start = $scope.pageCount()-rangeSize+1;
          }

          for (var i=start; i<start+rangeSize; i++) {
            ret.push(i);
          }
          return ret;
        };

        $scope.firstPage = function(){
          return ($scope.currentPage = 0)
        }

        $scope.lastPage = function(){
          return ($scope.currentPage = $scope.pageCount())
        }

        $scope.prevPage = function() {
          if ($scope.currentPage > 0) {
            $scope.currentPage--;
          }
        };

        $scope.prevPageDisabled = function() {
          if ($scope.currentPage === 0){
            return true;
          }
          else {
            return false;
            }
        };

        $scope.pageCount = function() {
          // debugger
          return Math.ceil($scope.filtered.length/$scope.itemsPerPage)-1;
        };

        $scope.nextPage = function() {
          if ($scope.currentPage < $scope.pageCount()) {
            $scope.currentPage++;
          }
        };

        $scope.nextPageDisabled = function() {
          console.log('CURRENTPAGE' + $scope.currentPage)
          console.log('PAGECOUNT' + $scope.pageCount())

          if ($scope.currentPage === $scope.pageCount()){
            return true
          }
          else {
            return false
          }
        };

        $scope.setPage = function(n) {
          $scope.currentPage = n;
        };
}])
