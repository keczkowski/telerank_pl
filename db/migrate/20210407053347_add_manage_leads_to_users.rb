class AddManageLeadsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :manage_leads, :boolean
  end
end
