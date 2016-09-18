class Stat < ActiveRecord::Base
  has_one :player, :foreign_key => 'nba_player_id', :primary_key => 'nba_player_id'
end
