class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.integer :team_one
      t.integer :team_two
      t.timestamps
    end
  end
end
