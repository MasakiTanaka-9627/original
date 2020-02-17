class Comment < ApplicationRecord
  default_scope -> { order(created_at: :desc) }

  validates :content, length: { minimum: 5 }

  belongs_to :user
  belongs_to :board
  has_many :favorite_comments, dependent: :destroy
end
