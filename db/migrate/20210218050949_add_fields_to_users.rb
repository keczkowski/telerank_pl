class AddFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :manage_agreements, :boolean
    add_column :users, :manage_calls, :boolean
    add_column :users, :manage_clients, :boolean
    add_column :users, :manage_events, :boolean
    add_column :users, :manage_partners, :boolean
    add_column :users, :manage_reminders, :boolean
    add_column :users, :manage_screenplays, :boolean
  end
end
