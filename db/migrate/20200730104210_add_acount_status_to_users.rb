class AddAcountStatusToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :acount_status, :boolean
  end
end
