app = angular.module('pocketSOHO', ['ui.bootstrap']);

// $('a[href^=#]').on('click',function(e) {
//     e.preventDefault();
//     $(document).scrollTop($('#about').position().top+40);
//     // 40 pixels is specific to this case
// });

welcome = {}
welcome.controller = function(){}

welcome.controller.prototype = {
  bind: function(){
    smoothScroll();
  }

}
// debugger

function smoothScroll() {
    $(function() {
      $('a[href*=#]:not([href=#])').click(function() {
        if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
          var target = $(this.hash);
          target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
          if (target.length) {
            $('html,body').animate({
              scrollTop: target.offset().top
            }, 1000);
            return false;
          }
        }
      });

      $('#logo').click(function(){
        $('#logo').animate({
          scrollTop: 0
        }, 2000);
      });
    });
}

$(document).ready(function(){
  welcomeController.bind();
})

welcomeController = new welcome.controller
