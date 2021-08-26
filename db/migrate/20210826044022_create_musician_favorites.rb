class CreateMusicianFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :musician_favorites do |t|
      t.references :end_user, foreign_key: true
      t.references :musician_profile, foreign_key: true

      t.timestamps
    end
  end
end
