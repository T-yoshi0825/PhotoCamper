class RemoveAddressFromImages < ActiveRecord::Migration[5.2]
  def change
    remove_column :images, :address, :text
  end
end
