class SavesController < ApplicationController
  def create
  	s = Save.new(user_id:params[:user_id],collection_id:params[:collection_id])

  	if s.save
  		json_data ={message:"success", collection_id:params[:collection_id], user_id:params[:user_id]}
  		render json:json_data
  	else
  		json_data ={message:"fail"}
  	end
  	
  end

  def new
  end

  def all
  	@user = User.find(session[:user_id])
  	s = Save.where(user_id:@user.id)
  	ids=[]
  	s.each do |saves|
  		ids.push(saves.collection_id)
  	end
  	@collections= Collection.find(ids)
  	@notes = Note.all
  end

  def show
  	 @collection = Collection.find(params[:collection_id])
   	 @user = User.find(session[:user_id])
   	 @existing_notes = Note.where(:collection_id=>@collection.id)

  end
  def select
      @user = User.find(session[:user_id])
      saves = Save.where(user_id:session[:user_id])
      collections_id = []
      saves.each do |s|
        collections_id.push(s.collection_id)
      end
      @collections = Collection.find(collections_id) #these are collections that you saved
      @group_id = params[:group_id]
      @notes = Note.all # all notes
      @group_notes = GroupNote.where(:user_id=>@user.id,:group_id=>@group_id)
      

  end
  def destroy
    save = Save.where(user_id:params[:user_id], collection_id:params[:collection_id])
    delete = Save.find(save[0][:id]).delete
    flash[:message] = 'Collection Deleted'
    redirect_to "/saves/all" 

  end


end
