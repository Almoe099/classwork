# == Schema Information
#
# Table name: responses
#
#  id               :bigint           not null, primary key
#  answer_choice_id :bigint           not null
#  respondent_id    :bigint           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Response < ApplicationRecord

    belongs_to :answer_choice, 
    foreign_key: :answer_choice_id,
    class_name: :AnswerChoice

    belongs_to :respondent, 
    foreign_key: :respondent_id,
    class_name: :User

    has_one :question,
    through: :answer_choice,
    source: :question

    has_one :poll,
    through: :question,
    source: :poll


end
