class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :end_user, foreign_key: true
      t.references :musician_profile, foreign_key: true
      t.references :shop_profile, foreign_key: true
      t.string :comment
      t.integer :score

      t.timestamps
    end
  end
end
