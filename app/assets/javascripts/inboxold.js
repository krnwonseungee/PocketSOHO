// //isolates user id by parsing through URL
// var userId = window.location.href.split("/")[4]
// // console.log(a=userId)

// // creates inbox controller
// app.controller('inboxController', ['$scope', '$http', function($scope, $http){

//   $http.get("/users/" + userId + "/conversations.json").success(function(data){
//     $scope.messages = data;
//     console.log(b=$scope.messages)
//   })
// }])
