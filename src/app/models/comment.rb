class Comment < ActiveRecord::Base
  belongs_to :book
  attr_accessible :body, :commenter
end
