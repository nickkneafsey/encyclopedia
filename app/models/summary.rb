class Summary < ActiveRecord::Base
  belongs_to :player
  belongs_to :user

  has_many :summary_votes
end
