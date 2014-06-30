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
      url: "/conversations/results",
      data: { pgsearch: inboxSearchTerm },
      success: function(){ console.log("success") }
    }).done(function(data){
      console.log(data)
    })
  },
}

$(document).ready(function(){
  inboxController.bind();
})

inboxController = new Inbox.Controller
