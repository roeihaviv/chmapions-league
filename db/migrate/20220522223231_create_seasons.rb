class CreateSeasons < ActiveRecord::Migration[6.0]
  def change
    create_table :seasons do |t|
      t.string :season_year
      t.integer :stadium_id

      t.timestamps
    end
  end
end
