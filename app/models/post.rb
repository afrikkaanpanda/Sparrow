class Post < ApplicationRecord
    has_rich_text :description

    belongs_to :user

    validates :author, presence: true
    validates :title, presence: true
    validates :description, presence: true
end
