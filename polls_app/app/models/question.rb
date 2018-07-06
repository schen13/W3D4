# == Schema Information
#
# Table name: questions
#
#  id            :bigint(8)        not null, primary key
#  question_text :text             not null
#  poll_id       :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Question < ApplicationRecord
  validates :question_text, presence: true 
  
  has_many :answer_choices,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :AnswerChoice
    
  belongs_to :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: :Poll
    
  has_many :responses,
     through: :answer_choices,
     source: :responses
     
  def results 
    
    # answer_choice_list = self.answer_choices.includes(:responses)    
    # select count, left join with responses, goup by, count(col_name)
    answer_choice_list = self.answer_choices.select('answer_text, COUNT(responses) AS num_answers')
      .left_outer_joins(:responses)
      .where(answer_choices: {question_id: "#{self.id}"})
      .group('answer_choices.id')
    result = Hash.new(0)
    answer_choice_list.each { |answer| result[answer.answer_text] += answer.num_answers}
    result
  end
end
