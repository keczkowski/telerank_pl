class AddDoneToReminders < ActiveRecord::Migration[6.0]
  def change
    add_column :reminders, :done, :boolean
  end
end
