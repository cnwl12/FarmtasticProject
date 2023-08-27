// Call the dataTables jQuery plugin
$(document).ready(function() {
  $('#dataTable').DataTable({
    "order": [
      [0, "desc"]
    ]
  });
  
  $('#dataTable2').DataTable({
    "order": [
      [0, "asc"]
    ]
  });


$('#dataTable3').DataTable({
    "order": [
      [0, "asc"]
    ]
  });
  
  $('#dataTable4').DataTable({
    "order": [
      [0, "asc"]
    ]
  });
});