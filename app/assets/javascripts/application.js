
//= require jquery3

//= require jquery_ujs
//= require jquery-ui


//= require popper
//= require rails-ujs
//= require bootstrap-sprockets



//= users

//= require sb-admin

//= require sb-admin-datatables


//= require jquery.dataTables

//= require turbolinks

//= require_tree .


/*

$(function() {
    // Add click event binding to `Save search` link
    $("#postdate").on("click", function(event) {
       //event.preventDefault(); // don't trigger default

        // get the value inside the text field
        var dFrom = $("#dateFrom").val();
        var dTo = $("#dateTo").val();
      

       $.post('/base-report.pdf?', {format: 'pdf',date_from: dFrom, date_to: dTo}, function(data) {
            // log the result from the server, or whatever...
            console.log(data);

        }); 
    });
}); 
*/


/*
$(function() {
    // Add click event binding to `Save search` link
    $("#dateFrom").on("change", function(event) {
        event.preventDefault(); // don't trigger default

        // get the value inside the text field
        var dFrom = $("#dateFrom").val();
        //var dTo = $("#dateTo").val();

        $.post('/base-report', { date_from: dFrom}, function(data) {
            // log the result from the server, or whatever...
            console.log(data);
        });
    });
});


*/


/*

$(function() {
    // Add click event binding to `Save search` link
    $("#dateTo").on("change", function(event) {
        event.preventDefault(); // don't trigger default

        // get the value inside the text field
        var dFrom = $("#dateFrom").val();
        var dTo = $("#dateTo").val();
        //var dTo = $("#dateTo").val();

        $.post('/base-report', { date_from: dFrom, date_to: dTo}, function(data) {
            // log the result from the server, or whatever...
            console.log(data);
        });
    });
});

*/



jQuery(function(){
   var value = 0;
   $("a#postdate").on("click", function(event) {
   	event.preventDefault();
      
      // value = $("#dateFrom").val();

      // alert(value);

      //alert('printed');
       $("a#postdate").attr("href", function(i) {




       location.href = $(this).attr('href') + 'date_from=' + encodeURIComponent($('#dateFrom').val()) + '&date_to='+encodeURIComponent($('#dateTo').val());
          //return href + 'date_from='.text(value); 

      
        });

    });
});