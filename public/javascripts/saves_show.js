	$(document).ready(function(){
			$("#note").submit(function(){
				$.post($(this).attr('action'),$(this).serialize(),function(data){
					if(data.success=='true')
					{
						$("#notes_flow").prepend("<div class='note'><a href='/notes/retrieve/"+data.note_id+"'>Note View</a><p class='note_time'>"+data.start_timeh+" H "+data.start_time1+" M "+data.start_time2+" S </p><a class='note_content' href='' id='v+"+data.time+"_"+data.url+"'>"+data.notes+"</a></div>");
					}
					else
					{
						alert(data.messages);
					}
				}, "json");
				return false;
			})
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
		})
		
	$(document).on('click',"a",function(event){
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
	});