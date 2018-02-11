


jQuery(function() {
  var departments;
  $('#user_department_id').parent().hide();
  departments = $('#user_department_id').html();
  console.log(departments);
  return $('#user_sector_id').change(function() {
    var sector, escaped_sector, options;
    sector = $('#user_sector_id :selected').text();
    escaped_sector = sector.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
    options = $(departments).filter("optgroup[label=" + escaped_sector + "]").html();
    console.log(options);
    if (options) {
      $('#user_department_id').html(options);
      return $('#user_department_id').parent().show();
    } else {
      $('#user_department_id').empty();
      return $('#user_department_id').parent().hide();
    }
  });
});
