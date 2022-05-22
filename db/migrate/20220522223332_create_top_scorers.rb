class CreateTopScorers < ActiveRecord::Migration[6.0]
  def change
    create_table :top_scorers do |t|
      t.string :player_name
      t.integer :number_of_goals
      t.integer :season_id
      t.string :player_image
      t.integer :club_id

      t.timestamps
    end
  end
end
