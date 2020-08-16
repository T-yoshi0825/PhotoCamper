class AddLongitudeToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :longitude, :float
  end
end
