ENV['RAILS_ENV'] = ARGV.first || ENV['RAILS_ENV'] || 'development'
# require File.expand_path(File.dirname(__FILE__) + "../../config/environment")
require File.expand_path('../../../config/environment', __FILE__)
require 'rest-client'
require 'json'


def player_does_not_exist?(nba_player_id)
  Player.find_by_nba_player_id(nba_player_id).nil?
end

def player_data_correct?(player)

end

def add_player (nba_player_id, first_name, last_name, first_year, last_year, team)
  player = Player.create(
    first_name: first_name,
    last_name: last_name,
    team: team,
    first_year: first_year,
    nba_player_id: nba_player_id
  )
end

def update_player (nba_id, first_name, last_name, first_year, last_year, team)

end

url = 'http://stats.nba.com/stats/commonallplayers?IsOnlyCurrentSeason=0&LeagueID=00&Season=2016-17'
response = RestClient.get url

player_hash = JSON.parse(response)
players = player_hash["resultSets"][0]["rowSet"]

players.each do |player|
  nba_player_id = player[0]
  first_name = player[1].split(', ')[1]
  last_name = player[1].split(', ')[0]
  first_year = player[4]
  last_year = player[5]
  team = "#{player[8]} #{player[9]}"

  if player_does_not_exist?(nba_player_id)
    add_player(nba_player_id, first_name, last_name, first_year, last_year, team)
  end
end
