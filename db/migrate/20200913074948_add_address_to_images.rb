class AddAddressToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :address, :string
  end
end
