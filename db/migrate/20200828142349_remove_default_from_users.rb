class RemoveDefaultFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :default, :string
  end
end
