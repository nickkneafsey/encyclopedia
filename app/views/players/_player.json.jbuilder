json.extract! player, :id, :first_name, :last_name, :team, :created_at, :updated_at, :info_url, :summary_url
json.url player_url(player, format: :json)
