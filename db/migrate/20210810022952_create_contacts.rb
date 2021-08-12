class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.integer :end_user_id, null: false
      t.string :subject, null: false
      t.string :name, null: false
      t.string :email, null: false
      t.text :mail_body, null: false

      t.timestamps
    end
  end
end
