$(document).ready(function(){
  bindInvoiceTypeEvents()
})

function bindInvoiceTypeEvents () {
  $('.today').click(function () {
    colorOrange('.today')
    colorGreen('.tomorrow')
    colorGreen('.all')

    render('.appts-today')
    disappear('.appts-tomorrow')
    disappear('.appts-all')
  })

  $('.tomorrow').click(function () {
    colorOrange('.tomorrow')
    colorGreen('.today')
    colorGreen('.all')

    render('.appts-tomorrow')
    disappear('.appts-today')
    disappear('.appts-all')
  })

  $('.all').click(function () {
    colorOrange('.all')
    colorGreen('.today')
    colorGreen('.tomorrow')

    render('.appts-all')
    disappear('.appts-today')
    disappear('.appts-tomorrow')
  })
}

function colorOrange (btnClass) {
  $(btnClass).css("background-color", "#F48A1F")
}

function colorGreen (btnClass) {
  $(btnClass).css("background-color", "#8CC640")
}

function disappear (tableClass) {
  $(tableClass).css("display", "none")
}

function render (tableClass) {
  $(tableClass).css("display", "block")
}
