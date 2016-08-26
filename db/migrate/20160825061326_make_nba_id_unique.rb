class MakeNbaIdUnique < ActiveRecord::Migration
  def change
    add_index :players, :nba_player_id, :unique => true
    add_index :stats, :nba_player_id, :unique => true
  end
end
