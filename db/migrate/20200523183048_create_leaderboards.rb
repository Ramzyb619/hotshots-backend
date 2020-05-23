class CreateLeaderboards < ActiveRecord::Migration[6.0]
  def change
    create_table :leaderboards do |t|
      t.integer :wins
      t.integer :losses
      t.integer :user_id

      t.timestamps
    end
  end
end
