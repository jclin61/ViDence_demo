class VideosController < ApplicationController
  	def index
  		if params[:search] != nil
  		@videos = Video.search(params[:search].downcase)
	  	else
  		@videos = Video.all.order('created_at DESC')
	  	end
  	end

  	def new
 	 	@video = Video.new
 	end

	def create
		@video = Video.new(video_params)
		if @video.save
			redirect_to new_video_path, flash: { message: "Video Submitted" }
		else
			redirect_to new_video_path, flash: { errors: @video.errors.full_messages }
		end
	end
	
	def welcome

	end

	def map

	end
	
 	def show
 	end


	private

	def video_params
		params.require(:video).permit(:title, :description, :link, :video, :location, :rating, :tags, :user_id)
	end

end
