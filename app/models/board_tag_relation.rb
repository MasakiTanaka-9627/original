class BoardTagRelation < ApplicationRecord

  scope :tag_search, -> (tag_id) { where('id', tag_id) }

  belongs_to :board
  belongs_to :tag
end
