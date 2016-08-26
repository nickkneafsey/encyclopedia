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

# working
# begin
#   url = 'http://stats.nba.com/stats/playercareerstats?LeagueID=00&PerMode=PerGame&PlayerID=201939'
#   uri = URI(url)
#   res = Net::HTTP.get(uri)
#   puts JSON.parse(res)
# rescue => e
#   puts e
# end
# def request(player_id)
#   url = 'http://stats.nba.com/stats/playercareerstats?LeagueID=00&PerMode=PerGame&PlayerID='+player_id.to_s
#   # uri = URI(url)
#   RestClient.get(url){ |response, request, result, &block|
#     if [301, 302, 307].include? response.code
#       puts "hi"
#       response.follow_redirection(request, result, &block)
#     else
#       create
#       # response.return!(request, result, &block)
#     end
#   }
# end

def request(player_id)
  begin
    url = 'http://stats.nba.com/stats/playercareerstats?LeagueID=00&PerMode=PerGame&PlayerID=' + player_id
    uri = URI(url)
    puts uri
    res = Net::HTTP.get(uri)
    body = JSON.parse(res)
    puts "boom"
    # puts body
    create_player_stats(body)
  rescue => e
    puts e
  end
end
#
players = Player.first(3)
# request(Player.first.nba_player_id)
# request(76001)
players.each do |player|
  puts player.nba_player_id.to_s
  request(player.nba_player_id.to_s)
  sleep 60
end
