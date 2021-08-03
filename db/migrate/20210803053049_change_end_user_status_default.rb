class ChangeEndUserStatusDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default :end_users, :end_user_status, to: 0
  end
end
