class AddYearsAndPlayerIdToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :first_year, :string
    add_column :players, :last_year, :string
    add_column :players, :nba_player_id, :integer
  end
end
