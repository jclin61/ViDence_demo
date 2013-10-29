class Comment < ActiveRecord::Base
  belongs_to :association, polymorphic: true
  belongs_to :user
end
