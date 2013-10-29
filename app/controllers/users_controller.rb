class UsersController < ApplicationController

	def index
		@users= User.all
	end

  	def new
  		@user = User.new
  	end

  	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to new_user_path, flash: { message: "Registration Successfull" }
		else
			redirect_to new_user_path, flash: { errors: @user.errors.full_messages }
		end
	end

	def show

	end
	

  	def edit
  	 	@user = User.find(params[:id])
 	end

	def update
		user = User.find(params[:id])
	    
			clean_params = current_user.admin? ? admin_params : user_params

	 	if @user.update(clean_params)
	 		redirect_to @user, flash: { message: "Update sucessful" }
	 	else
	 	 	redirect_to edit_user_path(@user), flash: { errors: @user.errors.full_messages }
	 	end
	 end



	private

	def user_params
		params.require(:user).permit(:username, :first_name, :last_name, :email, :password, :password_confirmation, :location)
	end

end
