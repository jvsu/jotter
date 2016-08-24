$(document).ready(function(){

	$(".pub_info").hide();

			$("button").click(function(event){
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

				if(id_name[0]=='b')
				{
					var pub_index_start = id_name.indexOf("_");
					var pub_index_end = id_name.indexOf("+");
					var id = id_name.substring(pub_index_start+1, pub_index_end);
					var open_div = "pub"+id
					$("#"+open_div).toggle();
					return false;
				}
			})
		$('form').submit(function(){
			$.post($(this).attr('action'),$(this).serialize(),function(data){
				// Hide the form div
					$("#pub"+data.collection_id).hide();
				// Change the button
				$("#pbutton"+data.collection_id).html("<a href='/tags/unshare/"+data.collection_id+"'>UnPublish</a>");
			},"json");
			return false;
		})
	})