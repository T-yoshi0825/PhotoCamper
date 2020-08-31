class RemoveAcountStatusFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :acount_status, :boolean
  end
end
