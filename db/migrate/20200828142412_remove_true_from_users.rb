class RemoveTrueFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :true, :string
  end
end
