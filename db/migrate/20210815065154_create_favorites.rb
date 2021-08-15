class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer :end_user_id, null: false
      t.integer :musician_profile_id
      t.integer :shop_profile_id

      t.timestamps
    end
  end
end
