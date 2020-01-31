class Comment < ApplicationRecord
  validates :content, presence: true

  default_scope -> { order(created_at: :desc) }
  belongs_to :user
  belongs_to :board
end
