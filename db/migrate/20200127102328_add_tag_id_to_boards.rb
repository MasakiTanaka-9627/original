class AddTagIdToBoards < ActiveRecord::Migration[5.2]
  def change
    add_column :boards, :tag_id, :integer
  end
end
