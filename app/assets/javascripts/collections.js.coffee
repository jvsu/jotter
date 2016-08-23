# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
//= require jquery
//= require jquery_ujs

$(document).ready ->
  $('.pub_info').hide()
  $('button').click (event) ->
    id_name = $(this).attr('id')
    if id_name[0] == 'v'
      # video_code = id_name.slice(1);
      st_index_start = id_name.indexOf('+')
      st_index_end = id_name.indexOf('_')
      start_time = id_name.substring(st_index_start + 1, st_index_end)
      last_index = id_name.length
      video_code = id_name.substring(st_index_end + 1, last_index)
      $('#video').html '<iframe id=\'ytplayer\' type=\'text/html\' width=\'640\' height=\'390\' src=http://www.youtube.com/embed/' + video_code + '?autoplay=1&start=' + start_time + '></iframe>'
      return false
    if id_name[0] == 'b'
      pub_index_start = id_name.indexOf('_')
      pub_index_end = id_name.indexOf('+')
      id = id_name.substring(pub_index_start + 1, pub_index_end)
      open_div = 'pub' + id
      $('#' + open_div).toggle()
      return false
    return
  $('form').submit ->
    $.post $(this).attr('action'), $(this).serialize(), ((data) ->
      # Hide the form div
      $('#pub' + data.collection_id).hide()
      # Change the button
      $('#pbutton' + data.collection_id).html '<a href=\'/tags/unshare/' + data.collection_id + '\' class=\'btn btn-link\'>UnShare</a>'
      return
    ), 'json'
    false
  return

