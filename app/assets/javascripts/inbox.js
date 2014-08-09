Inbox = {}
Inbox.controller = function(){}


Inbox.controller.prototype = {
  bind: function(){
    $("#convos_results").keyup(function(e){
      e.preventDefault();
      var inboxSearchTerm = $( '#convos_results' ).val();
      // console.log(inboxSearchTerm)
      inboxcontroller.searchBarSubmit(inboxSearchTerm);
    })
  },

  searchBarSubmit: function(searchTerm){
    $.ajax({
      type: 'post',
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      url: "/conversations/results",
      data: { search_term: searchTerm },
      dataType: 'json',
      success: function(){ console.log("success") },
      error: function(){ console.log("error") },
    }).done(function(data){
      console.log(data)
    })
  },
}

$(document).ready(function(){
  inboxcontroller.bind();
})

inboxcontroller = new Inbox.controller
//
