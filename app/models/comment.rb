class Comment < ApplicationRecord
  # Comments belong to a post
  belongs_to :post
  broadcasts_to :post

  # Comments belong to an user
  belongs_to :user

  # Adds validations to the post
  validates_presence_of :content
end
