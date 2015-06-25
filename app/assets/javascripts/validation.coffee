$ ->
  $('#status').click ()->
    $('#response-btn').prop('disabled', false) if $('input:radio:checked').length is 1

