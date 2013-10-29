class CommentsController < ApplicationController
	def new
		@video = Video.find(params[:video_id])
 	 	@comment = @video.comments.new
 	end

	def create
		@video = Video.find(params[:video_id])
		@comment = @video.comments.new(comment_params)
		if @comment.save
			redirect_to videos_path, flash: { message: "Comment added" }
		else
			redirect_to videos_path, flash: { errors: @comment.errors.full_messages }
		end
	end
	

 	def show
 	end


	private

	def comment_params
		params.require(:comment).permit(:name, :comment, :user_id, :association_id, :association)
	end

end
