class ChangeImageNameToPicture < ActiveRecord::Migration
  def change
    rename_column :images, :image_name, :picture
  end
end
