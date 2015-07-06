require 'json' 

class PointsController < ApplicationController

  def create
    point = Point.new(points_params)
    if point.save
      #for Ajax
      # json_data = {success:"true",point_id:point.id ,description:points_params[:description],explanation:points_params[:explanation],paper:points_params[:paper_id], user_id:points_params[:user_id]}
      # render json:json_data
      flash[:message]='Point Added'
      redirect_to "/papers/new/#{points_params[:paper_id]}"
    else
      flash[:message]='Error Please Resubmit'
      redirect_to "/papers/new/#{points_params[:paper_id]}"
      #for ajax
      # json_data = {success:'false',message:"Did not create"}
      # render json:json_data
    end
  end

  def edit
    if points_edit_params[:type] == "description"
  
      edit_point = Point.find(points_edit_params[:point_id]).update(description:points_edit_params[:description])
      json_data = {success:"true",point_id:points_edit_params[:point_id] ,description:points_edit_params[:description],paper:points_edit_params[:paper_id], user_id:points_edit_params[:user_id],type:points_edit_params[:type]}
      render json:json_data
    elsif points_edit_params[:type]=="explanation"
      edit_point = Point.find(points_edit_params[:point_id]).update(explanation:points_edit_params[:explanation])
      json_data = {success:"true",point_id:points_edit_params[:point_id] ,explanation:points_edit_params[:explanation],paper:points_edit_params[:paper_id], user_id:points_edit_params[:user_id],type:points_edit_params[:type]}
      render json:json_data
      
    else
       render json:"Did not work" 
    end
  end

  def delete
    #you own the point
    point_owner = params[:user_id]
    point_owner = point_owner.to_i
    if session[:user_id]== point_owner
      point_delete = Point.find(params[:point_id]).delete
      flash[:message]='Point Deleted'
      redirect_to "/papers/new/#{params[:paper_id]}"

   else
      flash[:message]= "You don't have the priviledges to delete Point"
      redirect_to "/papers/new/#{params[:paper_id]}"

   end
  end
  private
  
  def points_params
    params.require(:point).permit(:description, :explanation, :user_id, :paper_id)
  end

  def points_edit_params
    params.require(:point).permit(:description,:explanation, :user_id,:paper_id, :type, :point_id)
  end
end
