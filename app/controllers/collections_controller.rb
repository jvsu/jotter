class CollectionsController < ApplicationController
 def create
  collection = Collection.new(collection_params)
  if collection.save
    redirect_to "/notes/new/#{collection.id}"
  else  
    message = collection.errors.full_messages
    flash[:message] = message
    redirect_to "/homes/index"
  end

  end

  def all
    @user = User.find(session[:user_id])
    @collections = Collection.all.where(user_id:@user.id)
    @notes = Note.all.where(user_id:@user.id)
  end

  def retrieve
  end

  def update
  end

  def destroy
     collection_id = params[:collection_id]
    delete_collection = Collection.find(params[:collection_id]).delete
    flash[:message] = 'Collection Deleted'
    redirect_to "/collections/all"
  end
private
  def collection_params
    params.require(:collection).permit(:name, :url, :user_id)
  
  end
end
