class Tag < ApplicationRecord

    scope :tag_search, -> (keyword) { where('id', params[:tag_id]) }

    has_many :board_tag_relations, dependent: :destroy
    has_many :boards, through: :board_tag_relations, dependent: :destroy
end
