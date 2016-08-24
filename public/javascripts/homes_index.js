$(document).ready(function(){
			$("#new_note").hide();

			// Add Note/ Remove Note Function
			$("button").click(function(){
				var id = $(this).attr("id");
				if(id !="new_note_button") 
				{
				var start_index = id.indexOf("s");
				var mid_index = id.indexOf("_");
				var end_index = id.indexOf("+");
				var collection_id = id.substring(start_index+1, mid_index);
				var user_id = id.substring(mid_index+1, end_index);
				$.get("/saves/create",{collection_id:collection_id, user_id:user_id},function(data){
					if(data.message == 'success'){
						$("#coll"+data.collection_id).fadeOut();
					}
					else{
						alert("Error");
					}			
				})
				return false;
				}
			});
		});

		$(document).on('click','#new_note_button',function(){
			$("#new_note").toggle();
		})