class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.text :content
      t.string :tag
      t.references :user, foreign_key: true, type: :integer

      t.timestamps
    end
  end
end
