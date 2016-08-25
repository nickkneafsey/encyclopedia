class ChangeStatsColumnsToDecimal < ActiveRecord::Migration
  def change
    change_column :stats, :minutes, :decimal
    change_column :stats, :fgm, :decimal
    change_column :stats, :fga, :decimal
    change_column :stats, :fg3m, :decimal
    change_column :stats, :fg3a, :decimal
    add_column :stats, :ftm, :decimal
    add_column :stats, :fta, :decimal
    add_column :stats, :ft_pct, :decimal  
  end
end
