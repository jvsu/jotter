class SessionsController < ApplicationController
  def home
    
  end


  def index
  end

  def sign_in
  	@user = User.find_by_email(login_params[:email])
  	if @user && @user.authenticate(login_params[:password])
  		session[:user_id] = @user.id
  		redirect_to '/homes/index'
  	else
  		flash[:login_message]= 'Email or Password Not Correct'
  		redirect_to '/sessions/index'
  	end
  end

  def sign_up
  	@user = User.new(user_params)
  	if @user.save
  		session[:user_id] = @user.id
  		redirect_to "/homes/index"
  	else
    
      #if 'password can't be blank' shows up 
      errors = @user.errors.full_messages
      blank_password_count = errors.count("Password can't be blank")

      if blank_password_count >1
        #remove extra message prompt around 
        errors.slice!(errors.index("Password can't be blank"))
        flash[:su_message]= errors
        redirect_to "/sessions/index"
      else
        
        flash[:su_message]= errors
        redirect_to "/sessions/index"
      end
      # render json:@user.errors.full_messages

  		# flash[:message] = @user.errors.full_messages
  		# redirect_to "/sessions/index"
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
