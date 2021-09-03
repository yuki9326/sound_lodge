class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :content
      t.string :image_id
      t.references :room, foreign_key: true
      t.references :end_user, foreign_key: true

      t.timestamps
    end
  end
end
