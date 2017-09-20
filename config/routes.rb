Rails.application.routes.draw do
  root 'doctor#image_questions'
  get 'companions' => 'companion#image_questions'
  get 'villains' => 'villain#image_questions'
  get 'secondaries' => 'secondary#image_questions'
end
