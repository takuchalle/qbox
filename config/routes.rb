Rails.application.routes.draw do
  root 'questions#new'

  resources :questions, only: %i[new show index create delete]
end
