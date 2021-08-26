class CreateShopFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_favorites do |t|
      t.references :end_user, foreign_key: true
      t.references :shop_profile, foreign_key: true

      t.timestamps
    end
  end
end
