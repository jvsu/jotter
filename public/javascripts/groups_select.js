	$(document).ready(function(){
			//Video Player
			$("a").click(function(event){
				id_name = $(this).attr("id");
				if(id_name[0]=='v')
				{
					// video_code = id_name.slice(1);
					var st_index_start = id_name.indexOf("+");
					var st_index_end = id_name.indexOf("_");
					var start_time = id_name.substring(st_index_start+1,st_index_end);
					var last_index = id_name.length
					var video_code = id_name.substring(st_index_end+1,last_index)
					$("#video").html("<iframe id='ytplayer' type='text/html' width='640' height='390' src=http://www.youtube.com/embed/"+video_code+"?autoplay=1&start="+start_time+"></iframe>");
					return false;
				}		
			})
		//add and remove button
		$("form").submit(function(){
			$.post($(this).attr('action'),$(this).serialize(),function(data){
				if(data.action =='add' && data.message=='success')
				{
					// add remove button
					// add gn_note
					$("#form_"+data.note_id).html("<form id='remove_"+data.note_id+"' action='/groupnotes/delete' method='post'><input name='authenticity_token' value='<%= form_authenticity_token %>' type='hidden'><input type='hidden' name='group_note[note_id]' value="+data.note_id+"><input type='hidden' name='group_note[group_id]' value="+data.group_id+"><input type='hidden' name='group_note[user_id]' value="+data.user_id+"><input type='hidden' name='group_note[gnote]' value="+data.gn_id+"><input type='submit' value='Remove' id='remove_button' class='btn btn-danger'></form>");
				}
				else if(data.action=='remove' && data.message=='success')
				{
					$("#form_"+data.note_id).html("<form id='add_1_"+data.note_id+"' action='/groupnotes/create' method='post'><input name='authenticity_token' value='<%= form_authenticity_token %>' type='hidden'><input type='hidden' name='group_note[note_id]' value="+data.note_id+"><input type='hidden' name='group_note[group_id]' value="+data.group_id+"><input type='hidden' name='group_note[user_id]' value="+data.user_id+"><input type='submit' value='Add' id='submit_1' class='btn btn-success'></form>");
				}
				else{
					alert("Error Occurred");
				}
			},"json");
			return false;
		})
	})	// document.ready 	
	// dynamic button

	$(document).on('submit','form',function(){
		$.post($(this).attr('action'),$(this).serialize(),function(data){
			if(data.action =='add' && data.message=='success')
			{
				// add remove button
				$("#form_"+data.note_id).html("<form id='remove_"+data.note_id+"' action='/groupnotes/delete' method='post'><input name='authenticity_token' value='<%= form_authenticity_token %>' type='hidden'><input type='hidden' name='group_note[note_id]' value="+data.note_id+"><input type='hidden' name='group_note[group_id]' value="+data.group_id+"><input type='hidden' name='group_note[user_id]' value="+data.user_id+"><input type='hidden' name='group_note[gnote]' value="+data.gn_id+"><input type='submit' value='Remove' id='remove_button' class='btn btn-danger'></form>");
			}
			else if(data.action=='remove' && data.message=='success')
			{
				$("#form_"+data.note_id).html("<form id='add_1_"+data.note_id+"' action='/groupnotes/create' method='post'><input name='authenticity_token' value='<%= form_authenticity_token %>' type='hidden'><input type='hidden' name='group_note[note_id]' value="+data.note_id+"><input type='hidden' name='group_note[group_id]' value="+data.group_id+"><input type='hidden' name='group_note[user_id]' value="+data.user_id+"><input type='submit' value='Add' id='submit_1' class='btn btn-success'></form>");
			}
			else{
				alert("Error Occurred");
			}
		},"json");
		return false;
	})