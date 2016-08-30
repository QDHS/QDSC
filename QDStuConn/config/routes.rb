Rails.application.routes.draw do
  root 'portal#index'

  get 'users/login'
  post 'users/checklogin'
  get 'users/register'
  post 'users/new'
  get 'users/logout'

  get 'portal/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
