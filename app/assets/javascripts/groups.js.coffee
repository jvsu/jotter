# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

//= require jquery
//= require jquery_ujs

$(document).ready ->
  # get the class then get the id 
  if $('#group_all_page').length > 0
    $('#new_group_form').submit ->
      $.post $(this).attr('action'), $(this).serialize(), ((data) ->
        if data.success == 'true'
          $('#all_groups').prepend '<div class=\'group\'><h4 class=\'group_name\'><a href=\'/groups/view/' + data.group_id + '\'>' + data.name + '</a></h4><a class=\'delete\' href=\'/groups/delete/' + data.group_id + '/' + data.user_id + '\'>Delete</a></div>'
        else
          alert data.name
        return
      ), 'json'
      false
  else if $('#groups_select_page').length > 0
    $('a').click (event) ->
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
      return
    $('form').submit ->
      $.post $(this).attr('action'), $(this).serialize(), ((data) ->
        if data.action == 'add' and data.message == 'success'
          # add remove button
          # add gn_note
          $('#form_' + data.note_id).html '<form id=\'remove_' + data.note_id + '\' action=\'/groupnotes/delete\' method=\'post\'><input name=\'authenticity_token\' value=\'<%= form_authenticity_token %>\' type=\'hidden\'><input type=\'hidden\' name=\'group_note[note_id]\' value=' + data.note_id + '><input type=\'hidden\' name=\'group_note[group_id]\' value=' + data.group_id + '><input type=\'hidden\' name=\'group_note[user_id]\' value=' + data.user_id + '><input type=\'hidden\' name=\'group_note[gnote]\' value=' + data.gn_id + '><input type=\'submit\' value=\'Remove\' id=\'remove_button\' class=\'btn btn-danger\'></form>'
        else if data.action == 'remove' and data.message == 'success'
          $('#form_' + data.note_id).html '<form id=\'add_1_' + data.note_id + '\' action=\'/groupnotes/create\' method=\'post\'><input name=\'authenticity_token\' value=\'<%= form_authenticity_token %>\' type=\'hidden\'><input type=\'hidden\' name=\'group_note[note_id]\' value=' + data.note_id + '><input type=\'hidden\' name=\'group_note[group_id]\' value=' + data.group_id + '><input type=\'hidden\' name=\'group_note[user_id]\' value=' + data.user_id + '><input type=\'submit\' value=\'Add\' id=\'submit_1\' class=\'btn btn-success\'></form>'
        else
          alert 'Error Occurred'
        return
      ), 'json'
      false
    $(document).on 'submit', 'form', ->
      $.post $(this).attr('action'), $(this).serialize(), ((data) ->
        if data.action == 'add' and data.message == 'success'
          # add remove button
          $('#form_' + data.note_id).html '<form id=\'remove_' + data.note_id + '\' action=\'/groupnotes/delete\' method=\'post\'><input name=\'authenticity_token\' value=\'<%= form_authenticity_token %>\' type=\'hidden\'><input type=\'hidden\' name=\'group_note[note_id]\' value=' + data.note_id + '><input type=\'hidden\' name=\'group_note[group_id]\' value=' + data.group_id + '><input type=\'hidden\' name=\'group_note[user_id]\' value=' + data.user_id + '><input type=\'hidden\' name=\'group_note[gnote]\' value=' + data.gn_id + '><input type=\'submit\' value=\'Remove\' id=\'remove_button\' class=\'btn btn-danger\'></form>'
        else if data.action == 'remove' and data.message == 'success'
          $('#form_' + data.note_id).html '<form id=\'add_1_' + data.note_id + '\' action=\'/groupnotes/create\' method=\'post\'><input name=\'authenticity_token\' value=\'<%= form_authenticity_token %>\' type=\'hidden\'><input type=\'hidden\' name=\'group_note[note_id]\' value=' + data.note_id + '><input type=\'hidden\' name=\'group_note[group_id]\' value=' + data.group_id + '><input type=\'hidden\' name=\'group_note[user_id]\' value=' + data.user_id + '><input type=\'submit\' value=\'Add\' id=\'submit_1\' class=\'btn btn-success\'></form>'
        else
          alert 'Error Occurred'
        return
      ), 'json'
      false
  else if $('#groups_view_page').length > 0
    $('a').click (event) ->
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
      return
  return

