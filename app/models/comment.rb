class Comment < ApplicationRecord
  # Comments belong to a post
  belongs_to :post
  broadcasts_to :post

  # Adds validations to the post
  validates_presence_of :content
end
