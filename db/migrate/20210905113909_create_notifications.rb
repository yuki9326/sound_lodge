class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :end_user_id, null: false
      t.integer :message_id
      t.integer :musician_favorite_id
      t.integer :musician_review_id
      t.integer :shop_favorite_id
      t.integer :shop_review_id
      t.boolean :is_read, default: true, null: false
      t.string :content

      t.timestamps
    end
  end
end
