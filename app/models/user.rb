class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         #User has many posts and comments
         has_many :posts, dependent: :destroy
         has_many :comments, dependent: :destroy
end
