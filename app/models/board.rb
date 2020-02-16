class Board < ApplicationRecord
  
  default_scope -> { order(created_at: :desc) }
  scope :search, -> (keyword) { where('title LIKE ?', "%#{keyword}%") }

  validates :title, presence: true
  validates :content, presence: true

  belongs_to :user
  has_many :users, through: :favorites
  has_many :comments
  has_many :board_tag_relations, dependent: :destroy
  has_many :tags, through: :board_tag_relations, dependent: :destroy
  has_many :favorites, dependent: :destroy

end
