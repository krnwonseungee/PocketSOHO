window.onLoad = initializeChart();

function initializeChart() {
    function getInvoices(){
      // debugger
      $.ajax({
        type: 'get',
        url: '/get_invoices',
        dataType: 'json',
        // error: console.log('error!'),
        // success: console.log('success!')
      }).done(function(response){
        console.log(response)
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
            },
            {
                fillColor: "rgba(151,187,205,0.5)",
                strokeColor: "rgba(151,187,205,1)",
                pointColor: "rgba(151,187,205,1)",
                pointStrokeColor: "#fff",
                data: [28, 48, 40, 19, 96, 27, 100]
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
