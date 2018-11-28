Rails.application.routes.draw do
  get 'admins/new'
  root 'questions#new'

  resources :questions, only: %i[new show index create delete], param: :token
end
