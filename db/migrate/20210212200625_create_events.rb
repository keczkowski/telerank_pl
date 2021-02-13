class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.integer :user_id
      t.integer :client_id
      t.integer :call_id
      t.integer :agreement_id
      t.integer :reminder_id
      t.string :name
      t.text :body

      t.timestamps
    end
  end
end
