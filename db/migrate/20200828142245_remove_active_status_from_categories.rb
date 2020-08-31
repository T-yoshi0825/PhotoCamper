class RemoveActiveStatusFromCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :active_status, :boolean
  end
end
