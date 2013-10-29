class CommentsController < ApplicationController
	def new
 	 	@comment = Comment.new
 	end

	def create
		@comment = Comment.new(video_params)
		if @comment.save
			redirect_to new_video_path, flash: { message: "Video Submitted" }
		else
			redirect_to new_video_path, flash: { errors: @comment.errors.full_messages }
		end
	end
	

 	def show
 	end


	private

	def video_params
		params.require(:comment).permit(:name, :comment, :user_id)
	end

end
