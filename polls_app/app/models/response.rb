# == Schema Information
#
# Table name: responses
#
#  id            :bigint(8)        not null, primary key
#  answer_id     :integer          not null
#  respondent_id :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Response < ApplicationRecord
  
  validate :respondent_already_answered?, :responding_user_authored_poll?
  
  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_id,
    class_name: :AnswerChoice
    
  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :respondent_id,
    class_name: :User
    
  has_one :question,
    through: :answer_choice,
    source: :question
    
    
  def sibling_responses
    self.question.responses.where.not(id: self.id)
  end
  
  def respondent_already_answered?
    responses = sibling_responses
    if responses.any?{|response| response.respondent_id == self.respondent_id}
      errors[:respondent_id] << 'can\'t respond to previously answered question'
    end 
  end
  
  def responding_user_authored_poll?
    if self.respondent_id == self.question.poll.user_id
      errors[:respondent_id] << 'can\'t respond to your own question'
    end
  end
end
