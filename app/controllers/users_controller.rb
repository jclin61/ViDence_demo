class UsersController < ApplicationController
	# before_action :signed_in_user, only: [:edit, :update, :destroy]
  	before_action :correct_user,   only: [:edit, :update, :destroy]
  	before_action :admin_user,     only: :destroy

	def index
		@users= User.all
	end

  	def new
  		@user = User.new
  	end

  	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to root_path, flash: { message: "Registration Successful, Please Login" }
		else
			redirect_to new_user_path, flash: { errors: @user.errors.full_messages }
		end
	end

	def show

	end
	
	def change_password
		@user = User.find(params[:id])
	end

  	def edit
  	 	@user = User.find(params[:id])
 	end

	def update
		user = User.find(params[:id])
	    
			clean_params = current_user.admin? ? admin_params : user_params

	 	if user.update(admin_params)
	 		redirect_to edit_user_path, flash: { message: "Update sucessful" }
	 	else
	 	 	redirect_to edit_user_path(user), flash: { errors: user.errors.full_messages }
	 	end
	end

	def destroy
  		@user = User.find(params[:id])

    	if current_user?(@user)
      	flash[:error] = "Can't delete self"
    	else
      	@user.destroy
      	flash[:success] = "User deleted."
    	end
    	
    	redirect_to user_path
  	end



	private

	def user_params
		params.require(:user).permit(:username, :first_name, :last_name, :email, :password, :password_confirmation, :location)
	end

	def admin_params
    	params.require(:user).permit(:username, :first_name, :last_name, :email, :password, :password_confirmation, :location, :user_level)
 	end

 	def admin_user
  		redirect_to root_path unless current_user.admin?
 	end

 	def signed_in_user
    	redirect_to new_user_path, notice: "Please sign in." unless signed_in? 
  	end

  	def correct_user
    	@user = User.find(params[:id])
    	redirect_to root_path, flash: { message: "Action not authorized" } unless (current_user?(@user) or session[:user_level] == 9)
  	end

end
