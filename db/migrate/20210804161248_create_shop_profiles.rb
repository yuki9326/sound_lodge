class CreateShopProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_profiles do |t|
      t.integer :genre_id, null: false
      t.integer :end_user_id, null: false
      t.integer :review_id, null: false
      t.string :username, null: false
      t.string :shop_name, null: false
      t.integer :area, null: false, default: 0
      t.boolean :is_vocal, null: false, default: true
      t.integer :shop_image_id
      t.string :image_id
      t.text :audio_equipment
      t.text :introduction
      t.integer :price, null: false
      t.float :rate


      t.timestamps
    end
  end
end
