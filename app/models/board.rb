class Board < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :user
  has_many :comments
  validates :user_id, presence: true

  has_many :board_tag_relations, dependent: :destroy
  has_many :tags, through: :board_tag_relations, dependent: :destroy

  has_many :favorites
  has_many :users, through: :favorites

  scope :search, -> (keyword) { where('title LIKE ?', "%#{keyword}%") }
end
