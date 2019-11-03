Rails.application.routes.draw do
  get 'message/new'
  get 'message/create'
  get 'message/edit'
  get 'message/update'
  get 'message/delete'
  get 'user/new'
  get 'user/create'
  get 'user/login'
  get 'user/logout'
  get 'webhook/new'
  get 'webhook/create'
  get 'webhook/edit'
  get 'webhook/update'
  get 'webhook/delete'
  get 'webhook/list'
  get 'users/login'
  get 'users/logout'
  get 'home/index'
  root 'home#index'

  resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
