class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  validates :username
  validates :username, uniqueness: true
  has_secure_password

  def name
    "#{username}"
  end
end
