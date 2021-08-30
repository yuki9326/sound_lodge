class CreateRoomUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :room_users do |t|

      t.references :room, foreign_key: true
      t.references :end_user, foreign_key: true

      t.timestamps
    end
  end
end
