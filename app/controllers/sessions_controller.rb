class SessionsController < ApplicationController
  def index
  end

  def sign_in
  	@user = User.find_by_email(login_params[:email])
  	if @user && @user.authenticate(login_params[:password])
  		session[:user_id] = @user.id
  		redirect_to '/homes/index'
  	else
  		flash[:message]= 'Email or Password Not Correct'
  		redirect_to '/sessions/index'
  	end
  end

  def sign_up
  	@user = User.new(user_params)
  	if @user.save
  		session[:user_id] = @user.id
  		redirect_to "/homes/index"
  	else
  
  		flash[:message] = @user.errors.full_messages
  		redirect_to "/sessions/index"
  	end
  end

  def destroy
  	 session[:user_id] = nil
    flash[:message]= "You Are Logged Off"
    redirect_to '/sessions/index'
  end
  private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :password, :email, :user_name, :email)
	end

	def login_params
		params.require(:user).permit(:email, :password)
	end
end
