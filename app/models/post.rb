class Post < ApplicationRecord
    has_rich_text :description

    validates :author, presence: true
    validates :title, presence: true
    validates :description, presence: true
end
