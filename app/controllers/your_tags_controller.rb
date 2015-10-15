class YourTagsController < ApplicationController
  def new
    #Get all tags
    user = session[:user_id]
    @user = User.find(user)

    #get all tag entries
    tags = Tag.all

    #put all tag_names into an array
    @tags = []

    tags.each do |t|
      @tags.push(t.tag_name)
    end

    #remove duplicates in an array
    @tags = @tags.uniq

   

    #Get my_tags... tags that belong to you

    mtags = YourTag.all.where(user_id:user)
    
    #put it into an array and remove duplicates
    @my_tags = []
    
    mtags.each do |mt|
      @my_tags.push(mt.tag)
    end

    @my_tags= @my_tags.uniq

    #go through my_tags array and use array.delete 

    @my_tags.each do |mt|
        @tags.delete(mt)
    end
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
