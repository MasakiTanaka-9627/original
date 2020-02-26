class User < ApplicationRecord
  acts_as_google_authenticated
  mount_uploader :image, ImageUploader
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  acts_as_google_authenticated drift: 30, issuer: 'GameBoard'
  after_create { |record| record.set_google_secret }

  validates :name, presence: true
  validates :email, format: { with: VALID_EMAIL_REGEX }
  validates :password, length: { minimum: 5 }, on: :create
  has_secure_password

  has_many :comments, dependent: :destroy
  has_many :boards, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_comments, dependent: :destroy
  has_many :fav_boards, through: :favorites, source: :post
  
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower

  has_many :passive_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followers, through: :passive_relationships, source: :following

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end
end
