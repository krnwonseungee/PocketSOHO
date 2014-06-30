Inbox = {}
Inbox.Controller = function(){}


Inbox.Controller.prototype = {
  bind: function(){
    $('#inbox-searchbar').keyup(function(){
      console.log('poo');
    })
  }
}

$(document).ready(function(){
  Inbox.Controller.bind();
})
