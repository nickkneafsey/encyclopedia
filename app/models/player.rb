class Player < ActiveRecord::Base
  # attr_accessor :info_url
  # attr_accessible :info_url

  def info_url
    Rails.application.routes.url_helpers.player_url(id)
  end

  def summary_url
    Rails.application.routes.url_helpers.url_for(controller: "summaries", action: "index", player_id: id)
  end

  searchable do
    text :first_name
    text :last_name, :default_boost => 2
  end
end
