class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :image_url
      t.references :player, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      
      t.timestamps null: false
    end
  end
end
