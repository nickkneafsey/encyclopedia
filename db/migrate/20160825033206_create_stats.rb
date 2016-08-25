class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.integer   :nba_player_id
      t.integer   :games_played
      t.integer   :games_started
      t.integer   :minutes
      t.integer   :fgm
      t.integer   :fga
      t.decimal   :fg_pct
      t.integer   :fg3m
      t.integer   :fg3a
      t.decimal   :fg_3pct
      t.decimal   :oreb
      t.decimal   :dreb
      t.decimal   :reb
      t.decimal   :ast
      t.decimal   :steal
      t.decimal   :blk
      t.decimal   :tov
      t.decimal   :pf
      t.decimal   :pts

      t.timestamps null: false
    end
  end
end
