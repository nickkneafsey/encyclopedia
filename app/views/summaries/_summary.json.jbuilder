json.extract! summary, :id, :text, :player_id, :user_id, :created_at, :updated_at
json.url summary_url(summary, format: :json)