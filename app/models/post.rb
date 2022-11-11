class Post < ApplicationRecord
    # Add validations to the post
    validates_presence_of :title
    validates_presence_of :content
    
    has_rich_text :content
end
