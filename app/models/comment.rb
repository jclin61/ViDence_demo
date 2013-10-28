class Comment < ActiveRecord::Base
  belongs_to :association, polymorphic: true
end
