class NoteSupportsController < ApplicationController
  def create
    support= PointSupport.new(:user_id=>support_params[:user_id],:note_id=>support_params[:note_id], :point_id=>support_params[:point_id])
    if support.save
      flash[:message] ="Note Added"
      redirect_to "/notesupports/group/#{support_params[:group_id]}/#{support_params[:point_id]}"
    else 
      flash[:message] ="Not Added"
      redirect_to "/notesupports/group/#{support_params[:group_id]}/#{support_params[:point_id]}"
    end
  end

  def all_groups
     @user = User.find(session[:user_id])
    @groups = Group.where(:user_id=>@user.id)
    @point_id = params[:point_id]
    @point = Point.find(@point_id)
  end

  def group
       @user = User.find(session[:user_id])
      @group = Group.find(params[:group_id])
     @group_notes = GroupNote.where(:user_id=>@user.id, :group_id=>@group.id)
     @point_id = params[:point_id]
  end
private

  def support_params
    params.require(:support).permit( :user_id, :note_id, :point_id, :group_id )
  end

end
