require 'json'  
class TagsController < ApplicationController
  def share
    string = tag_params[:tag_name]
    # split string into an array
    share_collection = Tag.share(string,tag_params[:collection_id])
    if share_collection == false
         json_data = {status:"fail"}
         render json:json_data

    else
      json_data = {status:"good",collection_id:tag_params[:collection_id]}
      render json:json_data
    end
   

  end

  def add
    your_tag = YourTag.new(tag:params[:tag], user_id:params[:user_id])
    if your_tag.save
      json_data ={message:"success",tag:params[:tag], method:'add', user_id:params[:user_id]}
      render json:json_data
    end
    
  end

  def remove
    user = session[:user_id]
    your_tag = YourTag.all.where(tag:params[:tag],user_id:user)
    delete = YourTag.find(your_tag[0]).delete
    json_data ={message:"success",tag:params[:tag], method:"remove"}
    render json:json_data
  end

  def new
  end

  def all
  end

  def unshare
    #find the collection id and change share to false
    unshare = Collection.find(params[:collection_id]).update(share:false)
    #Get all the tags with Collection id 
    record = Tag.all.where(collection_id:params[:collection_id])

    #delete everything on the tag table with the collection_id
    record.each do |r|
      Tag.find(r.id).delete
    end

    redirect_to "/collections/all"

  end
  private
    def tag_params
        params.require(:tag).permit(:tag_name, :collection_id)
    end
end
