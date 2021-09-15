class CreateShopReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_reviews do |t|
      t.references :end_user
      t.references :shop_profile
      t.float :rate, default: 0
      t.text :comment

      t.timestamps
    end
  end
end
