class AddLatitudeToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :latitude, :float
  end
end
