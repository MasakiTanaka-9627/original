class CreateFavoriteComments < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_comments do |t|
      t.references :user
      t.references :comment

      t.timestamps
    end
  end
end
