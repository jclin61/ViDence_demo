class Video < ActiveRecord::Base
	#No need for attr_accessible because we pass parameters in controller. attr_accessible is for old rails
  # attr_accessible :video
  belongs_to :user
  belongs_to :category
  belongs_to :camera
  has_many :comments, as: :association
  mount_uploader :video, VideoUploader



  validates :title, :description, :location, presence: true
  #needs validation for :video or :link

  def self.search(search)
  		

  		# where('location LIKE? || title LIKE?', "%#{search}%", "%#{search}%").all
  		where('title LIKE ?', "%#{search}%").order("created_at DESC")

  		# if search

  		# 	find(:all, :conditions => ['title Like :search || description Like :search || location Like :search', {:search =>"%#{search}%"}])
  		# else
  		# 	find(:all)
  		# end
  end
end
