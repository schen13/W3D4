# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users = User.create([{username: 'Nick'}, {username: 'Steven'}, {username: 'The_Donald'}])
polls = Poll.create([
  {title: 'Spelling Poll', user_id: 1 }, 
  {title: 'Broke Poll', user_id: 2},
  {title: 'Tweets Poll', user_id: 3},
  {title: 'Hand Size Poll', user_id: 3}
])

questions = Question.create([
  {question_text: 'Why can''t Nick spell?', poll_id: 1},
  {question_text: 'Why is Steven so broke?', poll_id: 2},
  {question_text: 'How good are Donald Trump''s tweets?', poll_id: 3},
  {question_text: 'How big are Donald Trump''s hands?', poll_id: 4}
  ])
  
answer_choices = AnswerChoice.create([
  {answer_text: 'He has dyslexia! =(', question_id: 1},
  {answer_text: 'English is hard!', question_id: 1},
  {answer_text: 'He got mugged! ;[ <==|=', question_id: 2},
  {answer_text: 'He spent $250k on a diploma he is never going to use again T_T', question_id: 2},
  {answer_text: 'Good.', question_id: 3},
  {answer_text: 'The best! He has the best tweets!', question_id: 3},
  {answer_text: 'Big', question_id: 4},
  {answer_text: 'YUUUUUUUUUUUUUUUUGE', question_id: 4}
  ])
    
respones = Response.create([
  {answer_id: 3, respondent_id: 1},
  {answer_id: 6, respondent_id: 1},
  {answer_id: 8, respondent_id: 2},
  {answer_id: 2, respondent_id: 3}
])