Inbox = {}
Inbox.Controller = function(){}


Inbox.Controller.prototype = {
  bind: function(){
    $('body').on("keyup", "#inbox-searchbar", function(){
      var inboxSearchTerm = $( '#inbox-searchbar' ).val();
      inboxController.searchBarSubmit(inboxSearchTerm);
    })
  },

  searchBarSubmit: function(searchTerm){
    $.ajax({
      type: 'post',
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      url: "/conversations/results",
      data: { search_term: searchTerm },
      success: function(){ console.log("success") },
      error: function(){ console.log("error") },
    }).done(function(data){
      console.log(data)
    })
  },
}

$(document).ready(function(){
  inboxController.bind();
})

inboxController = new Inbox.Controller
