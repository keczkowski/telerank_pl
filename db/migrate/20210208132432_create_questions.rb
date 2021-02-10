class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.integer :screenplay_id
      t.string :name
      t.text :body
      t.integer :sequence

      t.timestamps
    end
  end
end
