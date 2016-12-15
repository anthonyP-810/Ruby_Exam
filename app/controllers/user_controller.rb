class UserController < ApplicationController
  def index
	
  end

  def create
	user = User.create(post_params)
		if user.valid?
			user.save
			session[:user_id] = user.id
			redirect_to "/dashboard/#{user.id}"
		else
			flash[:message] = 'Invalid credentials'
			redirect_to '/'
	end
  end

  def edit
  end

  def destroy
  end

  def show
  end


  private
	def post_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	end
end
