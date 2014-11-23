$(document).ready(function(){
  bindInvoiceTypeEvents()
})

function bindInvoiceTypeEvents () {
  $('.paid').click(function () {
    $('.paid-invoices').css("display", "block")
    $('.unpaid-invoices').css("display", "none")

    $('.paid').css("background-color", "#F48A1F")
    $('.unpaid').css("background-color", "#8CC640")
  })

  $('.unpaid').click(function () {
    $('.unpaid-invoices').css("display", "block")
    $('.paid-invoices').css("display", "none")

    $('.unpaid').css("background-color", "#F48A1F")
    $('.paid').css("background-color", "#8CC640")
  })
}
