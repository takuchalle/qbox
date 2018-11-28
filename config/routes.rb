Rails.application.routes.draw do
  root 'questions#new'

  get 'admin/register', to: 'admins#new'
  post 'admin/register', to: 'admins#create'
  get 'admin/login', to: 'sessions#new'
  resources :questions, only: %i[new show index create delete], param: :token
end
