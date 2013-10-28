class Video < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  belongs_to :camera
  has_many :comments, as: :association
end
