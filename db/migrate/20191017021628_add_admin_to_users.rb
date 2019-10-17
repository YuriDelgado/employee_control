class AddAdminToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin_id, :integer, foreign_key: true
  end
end
