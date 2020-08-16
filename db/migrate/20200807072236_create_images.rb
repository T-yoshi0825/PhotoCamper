class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.integer "user_id" 
	  t.string "image_id"  
	  t.string "caption"
	  t.integer "category_id"
	  t.text "address"
	  t.float "latitude"
	  t.float "longitude"

      t.timestamps
    end
  end
end
