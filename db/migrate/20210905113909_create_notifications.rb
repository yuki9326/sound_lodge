class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.text "url"
      t.integer "to_user_id"
      t.integer "from_user_id"
      t.integer "notification_type"
      t.datetime "open_time"

      t.timestamps
    end
  end
end
