class RemoveTagIdFromBoards < ActiveRecord::Migration[5.2]
  def change
    remove_column :boards, :tag_id, :intger
  end
end
