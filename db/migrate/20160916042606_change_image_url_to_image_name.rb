class ChangeImageUrlToImageName < ActiveRecord::Migration
  def change
    rename_column :images, :image_url, :image_name
  end
end
