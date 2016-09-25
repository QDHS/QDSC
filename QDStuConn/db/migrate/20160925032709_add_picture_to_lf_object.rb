class AddPictureToLfObject < ActiveRecord::Migration[5.0]
  def change
    add_column :lf_objects, :picture_data, :image
  end
end
