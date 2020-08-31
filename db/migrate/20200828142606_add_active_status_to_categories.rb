class AddActiveStatusToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :active_status, :boolean, default: true
  end
end
