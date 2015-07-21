class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :password, presence: true

  has_secure_password

  def name
    #{username}
  end
end
