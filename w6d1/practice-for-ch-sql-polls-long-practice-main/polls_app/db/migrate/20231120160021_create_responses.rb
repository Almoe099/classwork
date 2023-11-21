class CreateResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :responses do |t|
      t.references :answer_choice, foreign_key: true, null: false
      t.references :respondent, foreign_key: { to_table: :users }, null: false
      t.timestamps
    end
  end
end
