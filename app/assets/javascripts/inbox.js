//isolates user id by parsing through URL
var userId = window.location.href.split("/")[4]
// console.log(a=userId)

// creates inbox controller
app.controller('inboxController', ['$scope', '$http', function($scope, $http){

  $scope.test = "Test Value"

  // $http.get("/users/" + userId + "/conversations.json").success(function(data){
  //   $scope.messages = data;
  //   console.log(b=$scope.messages)
  // })
}])


// Inbox = {}
// Inbox.controller = function(){}


// Inbox.controller.prototype = {
//   bind: function(){
//     $("#convos_results").keyup(function(e){
//       e.preventDefault();
//       var inboxSearchTerm = $( '#convos_results' ).val();
//       // console.log(inboxSearchTerm)
//       inboxcontroller.searchBarSubmit(inboxSearchTerm);
//     })
//   },

//   searchBarSubmit: function(searchTerm){
//     $.ajax({
//       type: 'post',
//       beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
//       url: "/conversations/results",
//       data: { search_term: searchTerm },
//       dataType: 'json',
//       success: function(){ console.log("success") },
//       error: function(){ console.log("error") },
//     }).done(function(data){
//       console.log(data)
//     })
//   },
// }

// $(document).ready(function(){
//   inboxcontroller.bind();
// })

// inboxcontroller = new Inbox.controller
// //
