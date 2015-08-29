class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  validates :username, presence: true
  validates :username, uniqueness: true
  has_secure_password

end
