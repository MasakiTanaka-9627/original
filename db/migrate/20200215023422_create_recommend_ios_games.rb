class CreateRecommendIosGames < ActiveRecord::Migration[5.2]
  def change
    create_table :recommend_ios_games, id: false do |t|
      t.column :id
      t.string :title
      t.string :image

      t.timestamps
    end
  end
end
