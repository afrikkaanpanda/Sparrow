class Post < ApplicationRecord

    belongs_to :user

    has_rich_text :body

    has_one_attached :image

    has_many :comments, dependent: :destroy
    
    validates :title, presence: true
    validates :body, presence: true
end