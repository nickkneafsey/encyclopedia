class CreateSummaryVotes < ActiveRecord::Migration
  def change
    create_table :summary_votes do |t|
      t.references :user, index: true,  foreign_key: true
      t.references :summary, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
