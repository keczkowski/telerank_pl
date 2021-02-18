class AddManageUsersToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :manage_users, :boolean
  end
end
