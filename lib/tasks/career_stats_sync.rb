ENV['RAILS_ENV'] = ARGV.first || ENV['RAILS_ENV'] || 'development'
require File.expand_path('../../../config/environment', __FILE__)
require 'json'
require 'net/http'
require 'rest-client'

# semaphore = Mutex.new

def create_player_stats(response)
  career_stats = response['resultSets'][1]['rowSet'][0]
  Stat.create(
    nba_player_id: career_stats[0],
    games_played: career_stats[3],
    games_started: career_stats[4],
    minutes: career_stats[5],
    fgm: career_stats[6],
    fga: career_stats[7],
    fg_pct: career_stats[8],
    fg3m: career_stats[9],
    fg3a: career_stats[10],
    fg_3pct: career_stats[11],
    ftm: career_stats[12],
    fta: career_stats[13],
    ft_pct: career_stats[14],
    oreb: career_stats[15],
    dreb: career_stats[16],
    reb: career_stats[17],
    ast: career_stats[18],
    steal: career_stats[19],
    blk: career_stats[20],
    tov: career_stats[21],
    pf: career_stats[22],
    pts: career_stats[23]
  )
end


def read_player_file(player_id)
  begin
    id = player_id.to_s
    path = "lib/assets/#{id}.txt"
    contents = File.readlines(path, "r")
    parsed = JSON.parse(contents.join)
    create_player_stats(parsed)
  rescue => e
    puts e
  end
end

players = Player.all
players.each do |player|
  player_id = player.nba_player_id.to_s
  read_player_file(player_id)
end
