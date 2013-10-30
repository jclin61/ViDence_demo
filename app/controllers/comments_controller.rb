class CommentsController < ApplicationController
	def new
		@video = Video.find(params[:video_id])
 	 	@comment = @video.comments.new
 	end

	def create
		@video = Video.find(params[:video_id])
		@comment = @video.comments.new(comment_params)
		if @comment.save
			redirect_to "/videos/#{params[:video_id]}", flash: { message: "Comment added" }
		else
			redirect_to videos_path, flash: { errors: @comment.errors.full_messages }
		end
	end
	

 	def show
 	end

 	def destroy
 		@video = Video.find(params[:video_id])
	  	@comment = @video.comments.find(params[:id]).destroy
	    	
	    redirect_to "/videos/#{params[:video_id]}"
  	end


	private

	def comment_params
		params.require(:comment).permit(:name, :comment, :user_id, :association_id, :association)
	end

end
