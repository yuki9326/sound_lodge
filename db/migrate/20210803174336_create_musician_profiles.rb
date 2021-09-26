class CreateMusicianProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :musician_profiles do |t|
      t.integer :genre, null: false
      t.integer :end_user_id, null: false
      t.integer :musician_review_id
      t.integer :area, null: false, default: 0
      t.string :instrument, null: false
      t.integer :total_member, null: false
      t.boolean :is_vocal, null: false, default: true
      t.integer :video_id
      t.text :introduction
      t.integer :price, null: false
      t.float :rate
      t.string :image_id

      t.timestamps
    end
  end
end
