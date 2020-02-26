class CreateBoardTagRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :board_tag_relations do |t|
      t.references :board
      t.references :tag
      
      t.timestamps
    end
  end
end
