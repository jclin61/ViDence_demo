class User < ActiveRecord::Base
	has_many :videos
	has_many :reviews
	has_many :comments, as: :association
end
