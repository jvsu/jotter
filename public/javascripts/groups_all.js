	$(document).ready(function(){
			$("#new_group_form").submit(function(){
				$.post($(this).attr('action'),$(this).serialize(),function(data){
					if (data.success =='true') 
					{
						$("#all_groups").prepend("<div class='group'><h4 class='group_name'><a href='/groups/view/"+data.group_id+"'>"+data.name+"</a></h4><a class='delete' href='/groups/delete/"+data.group_id+"/"+data.user_id+"'>Delete</a></div>")
					}
					else
					{
						alert(data.name)
					};

				},"json")
				return false;
			})
		})