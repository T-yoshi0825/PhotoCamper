class AddImpressionsCountToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :impressions_count, :integer, default: 0
  end
end
