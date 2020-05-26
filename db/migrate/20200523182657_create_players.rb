class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name 
      t.integer :age
      t.integer :games_played
      t.integer :games_started
      t.integer :minutes
      t.integer :fg
      t.integer :fga
      t.float :fgp 
      t.integer :three_point_gpg
      t.integer :three_point_attempts 
      t.float :three_point_percentage 
      t.integer :two_point_gpg
      t.integer :two_point_attempts
      t.float :two_point_percentage
      t.float :efg
      t.integer :ft 
      t.integer :fta
      t.float :ft_percentage 
      t.integer :orb
      t.integer :drb
      t.integer :trb 
      t.integer :ast
      t.integer :steals
      t.integer :blocks 
      t.integer :turnovers
      t.integer :fouls 
      t.integer :ppg 
      t.string :team
      t.string :img_url
      t.timestamps
    end
  end
end
