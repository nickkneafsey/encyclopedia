class CreateImageVotes < ActiveRecord::Migration
  def change
    create_table :image_votes do |t|
      t.references :user, index: true,  foreign_key: true
      t.references :image, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
