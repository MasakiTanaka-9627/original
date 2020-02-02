class RecorDeleteRocords < ActiveRecord::Migration[5.2]
  def change
    drop_table :like_boards
  end
end
