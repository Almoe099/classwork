# == Schema Information
#
# Table name: answer_choices
#
#  id          :bigint           not null, primary key
#  question_id :bigint           not null
#  text        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class AnswerChoice < ApplicationRecord

    belongs_to :question, 
    foreign_key: :question_id,
    class_name: :Question

    has_many :responses, 
    foreign_key: :answer_choice_id,
    class_name: :Response,
    dependent: :destroy

end
