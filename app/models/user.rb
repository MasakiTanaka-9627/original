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
  has_many :fav_boards, through: :favorites, source: :post

  # 自分がフォローしているユーザーとの関連 
  #フォローする側のUserから見て、フォローされる側のUserを(中間テーブルを介して)集める。なので親はfollowing_id(フォローする側)
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  # 中間テーブルを介して「follower」モデルのUser(フォローされた側)を集めることを「followings」と定義
  has_many :followings, through: :active_relationships, source: :follower

  # 自分がフォローされるユーザーとの関連
  #フォローされる側のUserから見て、フォローしてくる側のUserを(中間テーブルを介して)集める。なので親はfollower_id(フォローされる側)
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  # 中間テーブルを介して「following」モデルのUser(フォローする側)を集めることを「followers」と定義
  has_many :followers, through: :passive_relationships, source: :following_id

  def followed_by?(user)
    # 今自分(引数のuser)がフォローしようとしているユーザー(レシーバー)がフォローされているユーザー(つまりpassive)の中から、引数に渡されたユーザー(自分)がいるかどうかを調べる
    passive_relationships.find_by(following_id: user.id).present?
  end
end
