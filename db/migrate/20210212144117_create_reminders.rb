class CreateReminders < ActiveRecord::Migration[6.0]
  def change
    create_table :reminders do |t|
      t.datetime :remind_at
      t.string :name
      t.integer :user_id
      t.integer :client_id
      t.text :body

      t.timestamps
    end
  end
end
