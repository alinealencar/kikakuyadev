function daysInMonth(month, year) {
  return new Date(year, month, 0).getDate();
}

$('#year, #month').change(function() {

  if ($('#year').val().length > 0 && $('#month').val().length > 0) {
    $('#day').prop('disabled', false);
    $('#day').find('option').remove();

    var daysInSelectedMonth = daysInMonth($('#month').val(), $('#year').val());

    for (var i = 1; i <= daysInSelectedMonth; i++) {
      $('#day').append($("<option></option>").attr("value", i).text(i));
    }

  } else {
    $('#day').prop('disabled', true);
  }

});