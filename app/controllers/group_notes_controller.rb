require 'json' 

class GroupNotesController < ApplicationController
  def create
  	group_note = GroupNote.new(gn_params)
  	if group_note.save
      flash[:message] ='Note Added'
      redirect_to "/groups/select/#{gn_params[:group_id]}"
      # json_data = {message:"success", note_id:gn_params[:note_id],group_id:gn_params[:group_id],user_id:gn_params[:user_id], gn_id:group_note.id}
      # render json:json_data
  	else
  		flash[:message] ='No success'
  		redirect_to "/groups/select/#{gn_params[:group_id]}"
      # json_data = {message:"fail", note_id:gn_params[:note_id],group_id:gn_params[:group_id],user_id:gn_params[:user_id], gn_id:group_note.id}
      # render json:json_data
  	end
  end

  def delete
      if(gn_delete_params[:view] =='true') # if the delete request comes from the groups view page
          group_note = GroupNote.find(gn_delete_params[:gnote]).delete
          flash[:message] ='Note Removed'
           redirect_to "/groups/view/#{gn_delete_params[:group_id]}"
      else
      group_note = GroupNote.find(gn_delete_params[:gnote]).delete
      # flash[:message] ='Note Removed'
      # redirect_to "/groups/view/#{gn_delete_params[:group_id]}"
      json_data = {message:"success", note_id:gn_delete_params[:note_id],group_id:gn_delete_params[:group_id],user_id:gn_delete_params[:user_id]}
      render json:json_data
    end
  end
  

  private
  def gn_params
  	params.require(:group_note).permit(:note_id, :group_id,:user_id)
  end

  def gn_delete_params
  	params.require(:group_note).permit(:note_id,:group_id,:user_id,:gnote,:view)
  end
end
