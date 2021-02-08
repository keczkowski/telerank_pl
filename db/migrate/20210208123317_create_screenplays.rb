class CreateScreenplays < ActiveRecord::Migration[6.0]
  def change
    create_table :screenplays do |t|
      t.string :name
      t.text :body
      t.integer :partner_id

      t.timestamps
    end
  end
end
