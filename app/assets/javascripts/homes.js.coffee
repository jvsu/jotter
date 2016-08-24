# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
//= require jquery
//= require jquery_ujs

$(document).ready ->
  $('#new_note').hide()
  # Add Note/ Remove Note Function
  $('button').click ->
    id = $(this).attr('id')
    if id != 'new_note_button'
      start_index = id.indexOf('s')
      mid_index = id.indexOf('_')
      end_index = id.indexOf('+')
      collection_id = id.substring(start_index + 1, mid_index)
      user_id = id.substring(mid_index + 1, end_index)
      $.get '/saves/create', {
        collection_id: collection_id
        user_id: user_id
      }, (data) ->
        if data.message == 'success'
          $('#coll' + data.collection_id).fadeOut()
        else
          alert 'Error'
        return
      return false
    return
  return
$(document).on 'click', '#new_note_button', ->
  $('#new_note').toggle()
  return

