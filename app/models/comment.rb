class Comment < ApplicationRecord
  belongs_to :post
  broadcasts_to :post

  validates_presence_of :content
end
