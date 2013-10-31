class SessionsController < ApplicationController
	def create
		user = User.find_by(username: params[:user][:username]).try(:authenticate, params[:user][:password])
		if user === false || user.nil?
			redirect_to new_user_path, flash: { sign_in_error: "Email/password not correct" }
		else
			sign_in(user)
			redirect_to videos_path, flash: { message: "You are now signed in" }
		end
	end

	def destroy
		sign_out
		redirect_to root_path
	end
end
