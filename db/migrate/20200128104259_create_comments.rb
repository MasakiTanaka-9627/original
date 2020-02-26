class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :content
      t.references :user
      t.references :board
      t.timestamps
    end
  end
end
