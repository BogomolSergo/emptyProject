# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  $('.new_user').hide()
  $('body').on 'click', '#add_user', ->
    $('.new_user').slideDown()
  false