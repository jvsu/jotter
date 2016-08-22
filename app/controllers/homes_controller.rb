class HomesController < ApplicationController
  def index
  	# if person is logged in then get his credentials
  	if session[:user_id]
		@user = User.find(session[:user_id])
		@collections = Collection.all.where(:user_id=>@user.id)  
		collection_tags = Tag.collection_tag(session[:user_id])
		@suggestions = Collection.find(collection_tags)
  	else
  		
  	end
  end
end
