class SessionsController < ApplicationController
	def create
		user = User.find_by(email: params[:user][:email]).try(:authenticate, params[:user][:password])
		if user === false || user.nil?
			redirect_to root_path, flash: { message: "Email/password not correct" }
		else
			sign_in(user)
			redirect_to photos_path
		end
	end

	def destroy
		sign_out
		redirect_to root_path
	end
end
