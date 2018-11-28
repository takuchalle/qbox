Rails.application.routes.draw do
  root 'questions#new'

  get 'admin/register', to: 'admins#new'
  post 'admin/register', to: 'admins#create'
  resources :questions, only: %i[new show index create delete], param: :token
end
