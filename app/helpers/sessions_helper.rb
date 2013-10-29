module SessionsHelper
		def sign_in(user)
		session[:user_id] = user.id
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user
		@curent_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def signed_in?
		!current_user.nil?
	end

	def sign_out
		session[:user_id] = nil
		self.current_user = nil #check out with remi
	end

	def current_user?(user)
		user === current_user
	end

	def deny_access
		redirect_to videos_path, notice: "Please sign in to access this page."
	end
end
