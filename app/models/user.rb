class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         # User has many posts and comments
         has_many :posts, dependent: :destroy
         has_many :comments, dependent: :destroy

         # Validations for username
         validates :username, presence: true, uniqueness: { case_sensitive: false }, :length => {minimum: 5, maximum: 20 }
         validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
end
