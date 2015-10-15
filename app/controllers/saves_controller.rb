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
  	s = Save.all.where(user_id:@user.id)
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
   	 @existing_notes = Note.all.where(:collection_id=>@collection.id)

  end


end
