class CreateRecommendIosGames < ActiveRecord::Migration[5.2]
  def change
    create_table :recommend_ios_games do  |t|
      t.string :title
      t.string :image

      t.timestamps
    end
  end
end
