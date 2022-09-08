class User < ApplicationRecord
  has_secure_password

  # has_many :posts

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :username, presence: true,
                        uniqueness: { case_sensitive: false }

  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }

  validates :password, presence: true,
                        length: { minimum: 8, maximum: 12 }
                        
  validates :password_confirmation, presence: true,
                                    length: { minimum: 8, maximum: 12 }
end
