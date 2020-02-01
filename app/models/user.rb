class User < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    has_secure_password
    validates :password_digest, presence: true, uniqueness: true
    validates :profile, presence: true


    
    has_many :comments
    has_many :boards, dependent: :destroy

    has_many :boards
    has_many :favorites
    has_many :fav_boards, through: :favorites, source: :post
end
