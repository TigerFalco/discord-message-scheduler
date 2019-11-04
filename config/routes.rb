Rails.application.routes.draw do
  get 'message/new'
  get 'message/create'
  get 'message/edit'
  get 'message/update'
  get 'message/delete'
  get 'user/new'
  post 'user/create'
  get 'user/login'
  post 'user/login_post'
  get 'user/home'
  get 'user/logout'
  get 'webhook/new'
  post 'webhook/create'
  get 'webhook/:id/edit', to: 'webhook#edit'
  put 'webhook/:id/update', to: 'webhook#update'
  delete 'webhook/:id/delete', to: 'webhook#delete'
  get 'webhook/list'
  get 'home/index'
  root 'home#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
