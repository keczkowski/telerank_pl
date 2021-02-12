class CreateAgreements < ActiveRecord::Migration[6.0]
  def change
    create_table :agreements do |t|
      t.string :name
      t.text :body
      t.integer :user_id
      t.integer :client_id
      t.integer :partner_id
      t.integer :call_id

      t.timestamps
    end
  end
end
