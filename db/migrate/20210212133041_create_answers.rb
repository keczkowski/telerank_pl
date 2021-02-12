class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.integer :call_id
      t.string :name

      t.timestamps
    end
  end
end
