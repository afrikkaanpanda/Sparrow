class User < ApplicationRecord
    has_secure_password

    has_many :posts, dependent: :destroy
  
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
    validates :first_name, presence: true

    validates :last_name, presence: true
  
    validates :username, presence: true,
                          uniqueness: { case_sensitive: false }
  
    validates :email, presence: true,
                      uniqueness: { case_sensitive: false },
                      length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX }
  
    validates :password, presence: true, confirmation: true,
                          length: { minimum: 8, maximum: 12 }, if: :password_digest_changed?
                          
    validates :password_confirmation, presence: true, if: :password_digest_changed?
end
