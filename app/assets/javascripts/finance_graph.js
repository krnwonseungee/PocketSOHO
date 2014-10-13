window.onLoad = initializeChart();

function initializeChart() {
    var invoices = []
    var monthLabelList = []
    var amountList = []
    var myData = []

    function parseInvoiceData(response){
      invoices = response
      for (var i = 0; i < invoices.length; i++) {
        var eachInvoice = invoices[i]
        var dataObject = {}
        dueMonth = eachInvoice['due_month']
        monthLabelList.push(dueMonth)
        floatAmt = parseFloat(eachInvoice['amount'])
        // dataObject[dueMonth] = floatAmt
        // dataObjArr.push(dataObject)
      }
      setMonthLabelList(monthLabelList)
      console.log(monthLabelList)
    }

    $.ajax({
      type: 'get',
      url: '/get_invoices',
      dataType: 'json',
      success: function(response){
        myData = response
        var totalRevenue = 0;
          for (var i=0; i < myData.length; i++) {
            var eachInvoice = myData[i]
            var floatAmt = parseFloat(eachInvoice['amount'])
            totalRevenue += floatAmt
            amountList.push(totalRevenue)
            dueMonth = eachInvoice['due_month']
            monthLabelList.push(dueMonth)
          }

          var ctx = $("#myChart").get(0).getContext("2d");

          var data = {
              labels: monthLabelList,
              datasets: [
                  {
                      fillColor: "rgba(220,220,220,0.5)",
                      strokeColor: "rgba(220,220,220,1)",
                      pointColor: "rgba(220,220,220,1)",
                      pointStrokeColor: "#fff",
                      data: amountList
                  }
              ]
          }

          var myNewChart = new Chart(ctx).Line(data, {bezierCurve: false});
      }
    })
}
