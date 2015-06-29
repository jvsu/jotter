require 'json' 

class GroupsController < ApplicationController

  def create
    group = Group.new(groups_params)

    if group.save
      json_data = {name:groups_params[:name], group_id:group.id,success:'true',user_id:group.user_id}
      render json:json_data
    else
     json_data = {name:"Name required", success:'false'}
      render json:json_data
    end
  end

  def view
    @user = User.find(session[:user_id])
    @group = Group.find(params[:group_id])
    @group_notes = GroupNote.all.where(:user_id=>@user.id, :group_id=>@group.id)
    
  end

  def all
    @user = User.find(session[:user_id])
    @groups = Group.all.where(:user_id=>@user.id)
  end

  def select
    @user = User.find(session[:user_id])
    @collections = Collection.all.where(:user_id=>@user.id)
    @notes = Note.all.where(:user_id=>@user.id)
     @group_id = params[:group_id]
    @group_notes = GroupNote.all.where(:user_id=>@user.id, :group_id=>@group_id)

    # Note the best code makes the feature work
    no_notes =[]
    @all_notes =[]
    group =[]

    @group_notes.each do |gn|
      group<<gn.note_id
    end

    @notes.each do |note|
        @all_notes<< note.id
    end

    group.each do |id|
      @all_notes.delete(id)
    end
  end
  
  def delete
    group = Group.find(params[:group_id])
    group_owner = group.user_id.to_i
    requesting_user = params[:user_id]
    requesting_user = requesting_user.to_i  

    if group_owner == requesting_user
      group_delete = Group.find(params[:group_id]).delete
      flash[:message] ="Group Deleted"
      redirect_to '/groups/all'
    
    else
      flash[:message] ="Group Not Deleted"
       redirect_to '/groups/all'
    
    end


  end

  private
  def groups_params
      params.require(:group).permit(:name, :user_id)
  end
end
