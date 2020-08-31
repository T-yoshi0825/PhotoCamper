class RemoveDefaultFromCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :default, :string
  end
end
