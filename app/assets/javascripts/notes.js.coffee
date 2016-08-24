# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
//= require jquery
//= require jquery_ujs


$(document).ready ->
  if $('#new_note_body').length > 0
    $('#note').submit ->
      $.post $(this).attr('action'), $(this).serialize(), ((data) ->
        if data.success == 'true'
          $('#notes_flow').prepend '<div class=\'note\'><a href=\'/notes/retrieve/' + data.note_id + '\'>Note View</a><p class=\'note_time\'>' + data.start_timeh + ' H ' + data.start_time1 + ' M ' + data.start_time2 + ' S </p><a class=\'note_content\' href=\'\' id=\'v+' + data.time + '_' + data.url + '\'>' + data.notes + '</a></div>'
        else
          alert data.messages
        return
      ), 'json'
      false
    $('a').click (event) ->
      id_name = $(this).attr('id')
      if id_name[0] == 'v'
        # video_code = id_name.slice(1);
        st_index_start = id_name.indexOf('+')
        st_index_end = id_name.indexOf('_')
        start_time = id_name.substring(st_index_start + 1, st_index_end)
        last_index = id_name.length
        video_code = id_name.substring(st_index_end + 1, last_index)
        $('#video').html '<iframe id=\'ytplayer\' type=\'text/html\' width=\'640\' height=\'390\' src=https://www.youtube.com/embed/' + video_code + '?autoplay=1&start=' + start_time + '></iframe>'
        return false
      return
    $(document).on 'click', 'a', (event) ->
      id_name = $(this).attr('id')
      if id_name[0] == 'v'
        # video_code = id_name.slice(1);
        st_index_start = id_name.indexOf('+')
        st_index_end = id_name.indexOf('_')
        start_time = id_name.substring(st_index_start + 1, st_index_end)
        last_index = id_name.length
        video_code = id_name.substring(st_index_end + 1, last_index)
        $('#video').html '<iframe id=\'ytplayer\' type=\'text/html\' width=\'640\' height=\'400\' src=https://www.youtube.com/embed/' + video_code + '?autoplay=1&start=' + start_time + '></iframe>'
        return false
      return
  else if $('#notes_retrieve').length > 0
    $('#edit').hide()
    $(document).on 'click', '#edit_button', ->
      $('#edit').toggle()
      return
    $('#edit_note').submit ->
      $.post $(this).attr('action'), $(this).serialize(), ((data) ->
        $('#text_note').html '<textarea name=\'note[notes]\' id=\'text_note\'>' + data.notes + '</textarea>'
        $('#note').html '<p id=\'note\'>' + data.notes + '</p>'
        return
      ), 'json'
      false
    $('#edit_time_form').submit ->
      $.post $(this).attr('action'), $(this).serialize(), ((data) ->
        $('#time_stamph').html '<input type=\'number\' name=\'note[start_timeh]\' placeholder=\'' + data.time_h + '\' id=\'time_stamph\'>'
        $('#time_stamp1').html '<input type=\'number\' name=\'note[start_time1]\' placeholder=\'' + data.time_m + '\' id=\'time_stamp1\'>'
        $('#time_stamp2').html '<input type=\'number\' name=\'note[start_time2]\' placeholder=' + data.time_s + ' id=\'time_stamp2\'>'
        alert 'Time Updated'
        return
      ), 'json'
      false
  return