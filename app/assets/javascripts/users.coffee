$(document).ready ->
  $('.new_user').hide()
  $('body').on 'click', '#add_user', -> $('.new_user').slideDown()

$('.new_user').on 'ajax:seccess', ->
  console.log('User was created ny AJAX')

$('.destroy_user').on 'ajax:seccess', ->
  $(this).closest('tr').remote()

$('#myAlert').on 'closed.bs.alert', ->
  $('#close').on event, -> alert("ASDFASDVSFv")
  false