class SessionController < ApplicationController
  def login
	@user = User.find_by(email: login_params[:email])
	if @user && @user.authenticate(login_params[:password])
		puts 'true'
		session[:user_id] = @user.id
		redirect_to "/"
	else
		puts 'false'
		flash[:errors] = 'Invalid Credentials'
		redirect_to root_path
	end
  end

  def destroy
	session[:user_id] = nil
	redirect_to '/'
  end

  private 
  def login_params
	params.require(:login).permit(:email, :password)
  end
end
