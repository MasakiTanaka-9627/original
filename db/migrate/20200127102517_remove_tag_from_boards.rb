class RemoveTagFromBoards < ActiveRecord::Migration[5.2]
  def change
    remove_column :boards, :tag, :string
  end
end
