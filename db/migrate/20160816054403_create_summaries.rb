class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.string :text
      t.references :player, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
