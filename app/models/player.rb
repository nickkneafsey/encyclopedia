class Player < ActiveRecord::Base
  has_many :images
  has_one :stat, :foreign_key => 'nba_player_id', :primary_key => 'nba_player_id'

  def info_url
    Rails.application.routes.url_helpers.player_url(id)
  end

  def summary_url
    Rails.application.routes.url_helpers.url_for(controller: "summaries", action: "index", player_id: id)
  end

  def player_image_url

  end

  searchable do
    text :first_name
    text :last_name, :default_boost => 2
  end
end
