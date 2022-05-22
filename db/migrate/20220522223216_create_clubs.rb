class CreateClubs < ActiveRecord::Migration[6.0]
  def change
    create_table :clubs do |t|
      t.string :club_name
      t.string :founding_year
      t.string :logo
      t.integer :stadium_id

      t.timestamps
    end
  end
end
