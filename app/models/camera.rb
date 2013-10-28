class Camera < ActiveRecord::Base
  belongs_to :video
  belongs_to :review
end
