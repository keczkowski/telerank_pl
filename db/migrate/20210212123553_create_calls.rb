class CreateCalls < ActiveRecord::Migration[6.0]
  def change
    create_table :calls do |t|
      t.integer :user_id
      t.integer :client_id
      t.integer :screenplay_id
      t.string :status

      t.timestamps
    end
  end
end
