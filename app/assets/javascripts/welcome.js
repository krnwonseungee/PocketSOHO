$(document).ready(function() {
      $.ajax({
        type: "get",
        dataType: 'json',
        url: "/search_businesses",
      }).done(function(data){
        var availableTags = data

        var bizId = $('#orig-biz-id').val()
        $('#business_name').val(bizId)


        $( "#business_name" ).autocomplete({
          source: availableTags,

          focus: function(event, ui) {
            console.log(u=ui)
            $('#business_name').val(ui.item.value);
          },

          select: function(event, ui) {
            $('#business_name').val(ui.item.value);
            $(this).val(ui.item.label);
            return false;
          }
        });
      })
})
