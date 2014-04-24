class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :posts
  has_many :comments
  has_many :votes

  validates :username, presence: true, uniqueness: true
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
end
