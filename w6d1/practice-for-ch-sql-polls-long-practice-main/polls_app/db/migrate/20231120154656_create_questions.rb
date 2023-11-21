class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.references :poll, foreign_key: true, null: false
      t.string :text, null: false
      t.timestamps
    end
  end
end
