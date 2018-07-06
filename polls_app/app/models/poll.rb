# == Schema Information
#
# Table name: polls
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Poll < ApplicationRecord
  
  validates :title, presence: true
  
  has_many :questions,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: :Question
    
  belongs_to :pollster,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
end