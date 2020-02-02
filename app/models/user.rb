class User < ApplicationRecord
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
    validates :name, uniqueness: true, length: { in: 5..15 } 
    validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
    validates :profile, length: { minimum: 8 }
    validates :password, uniqueness: true, length: { minimum: 8 }
    
    has_secure_password

    has_many :comments, dependent: :destroy
    has_many :boards, dependent: :destroy
    has_many :favorites
    has_many :fav_boards, through: :favorites, source: :post
end
