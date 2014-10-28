class User < ActiveRecord::Base
  has_many :books, :dependent => :destroy

  has_many :from_friend_relations, :foreign_key => "from_user_id", :class_name => "Friend"
  has_many :to_friend_relations, :foreign_key => "to_user_id", :class_name => "Friend"
 
  has_many :from_friends, :through => :from_friend_relations, :source => :to_user
  has_many :to_friends, :through => :to_friend_relations, :source => :from_user


  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  # attr_accessible :title, :body
end
