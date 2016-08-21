class Player < ActiveRecord::Base
  searchable do
    text :first_name
    text :last_name, :default_boost => 2
  end
end
