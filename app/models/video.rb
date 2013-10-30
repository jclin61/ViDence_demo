class Video < ActiveRecord::Base
	#No need for attr_accessible because we pass parameters in controller. attr_accessible is for old rails
  # attr_accessible :video
  belongs_to :user
  belongs_to :category
  belongs_to :camera
  has_many :comments, as: :association
  mount_uploader :video, VideoUploader
end
