class Book < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  attr_accessible :user_id, :impression, :title, :author, :category, :picture_file

  def picture_file= (p)
    if p
      self.picture_data = p.read
      self.content_type = p.content_type
    end
  end
end
