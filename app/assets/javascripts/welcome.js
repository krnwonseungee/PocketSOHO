$(document).ready(function() {
      $.ajax({
        type: "get",
        dataType: 'json',
        url: "/search_businesses",
      }).done(function(data){
        var availableTags = data

        $( "#business_name" ).autocomplete({
          source: availableTags
        });
      })
})
