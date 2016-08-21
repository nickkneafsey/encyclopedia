class AddFirstAndLastNameIndexesToPlayers < ActiveRecord::Migration
  def change
    add_index :players, :first_name
    add_index :players, :last_name
  end
end
