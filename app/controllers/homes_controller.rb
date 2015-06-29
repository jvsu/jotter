class HomesController < ApplicationController
  def index
  	if session[:user_id]
		@user = User.find(session[:user_id])
		@collections = Collection.all.where(:user_id=>@user.id)  
  	else
  		
  	end
  end
end
