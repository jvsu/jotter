class YourTagsController < ApplicationController
  def new
    #Get all tags
    user = session[:user_id]
    @user = User.find(user)

    # get tags for the view
    tags = YourTag.tags(user)
   
    @my_tags = tags[:my_tags]
    @tags = tags[:tags]

  end

  def create
  end

  def index
  end

  def view
  end

  def all
  end
end
