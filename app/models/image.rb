class Image < ActiveRecord::Base
  has_many :image_votes
  belongs_to :user
  belongs_to :player

  mount_uploader :picture, PictureUploader
end
