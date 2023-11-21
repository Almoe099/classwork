class CreateAnswerChoices < ActiveRecord::Migration[7.0]
  def change
    create_table :answer_choices do |t|
      t.references :question, foreign_key: true, null: false
      t.string :text, null: false
      t.timestamps
    end
  end
end
