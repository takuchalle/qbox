Rails.application.routes.draw do
  root 'questions#new'

  get 'questions/new'
  get 'questions/show'
  get 'questions/index'
end
