class RemoveTrueFromCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :true, :string
  end
end
