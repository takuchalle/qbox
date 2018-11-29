Rails.application.routes.draw do
  root 'questions#new'

  get 'admin/register', to: 'admins#new'
  post 'admin/register', to: 'admins#create'
  get 'admin/login', to: 'sessions#new'
  post 'admin/login', to: 'sessions#create'
  delete 'admin/logout', to: 'sessions#destroy'
  resources :questions, param: :token
end
