class Post < ApplicationRecord
    # Adds validations to the post
    validates_presence_of :title
    validates_presence_of :content
    
    # Adds rich text to content
    has_rich_text :content

    # Adds comments
    has_many :comments, dependent: :destroy

    #Post belongs to an user
    belongs_to :user
end
