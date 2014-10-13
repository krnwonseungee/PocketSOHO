window.onLoad = initializeChart();

function initializeChart() {
    var invoices = [];

    function parseInvoiceData(response){
      invoices = response
      var dataObjArr = []
      for (var i = 0; i < invoices.length; i++) {
        // debugger
        var eachInvoice = invoices[i]
        var dataObject = {}
        dueMonth = eachInvoice['due_month']
        floatAmt = parseFloat(eachInvoice['amount'])
        dataObject[dueMonth] = floatAmt
        dataObjArr.push(dataObject)
      }


      console.log(dataObjArr)
    }

    function getInvoices(){
      $.ajax({
        type: 'get',
        url: '/get_invoices',
        dataType: 'json',
      }).done(function(response){
        parseInvoiceData(response);
      })
    }

    getInvoices();

    var ctx = $("#myChart").get(0).getContext("2d");

    var data = {
        labels: ['January', 'February', 'March', 'April', 'May', 'June',
        'July', 'August', 'September', 'October', 'November', 'December'],
        datasets: [
            {
                fillColor: "rgba(220,220,220,0.5)",
                strokeColor: "rgba(220,220,220,1)",
                pointColor: "rgba(220,220,220,1)",
                pointStrokeColor: "#fff",
                data: [65, 59, 90, 81, 56, 55, 40]
            }
        ]
    }

    var myNewChart = new Chart(ctx).Line(data);

    //   createIpsumAjaxRequest: function(){
    //     $.ajax({
    //       type: "get",
    //       url: "/get_ipsum",
    //     }).done(function(data){
    //       view.renderIpsum(data);
    //     })
    //   }
    // }


}
