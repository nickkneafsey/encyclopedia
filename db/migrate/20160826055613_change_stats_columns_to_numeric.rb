class ChangeStatsColumnsToNumeric < ActiveRecord::Migration
  def change
    change_column :stats, :minutes, :numeric
    change_column :stats, :fgm, :numeric
    change_column :stats, :fga, :numeric
    change_column :stats, :fg3m, :numeric
    change_column :stats, :fg3a, :numeric
    change_column :stats, :ftm, :numeric
    change_column :stats, :fta, :numeric
    change_column :stats, :ft_pct, :numeric 
  end
end
