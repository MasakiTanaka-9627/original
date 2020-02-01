class User < ApplicationRecord
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    has_secure_password

    validates :name, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
    validates :profile, presence: true
    validates :password_digest, presence: true, uniqueness: true

    has_many :comments
    has_many :boards, dependent: :destroy
    has_many :boards
    has_many :favorites
    has_many :fav_boards, through: :favorites, source: :post
end
