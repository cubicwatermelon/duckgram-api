Rails.application.routes.draw do
  # add our register route
  post 'auth/login', to: 'users#login'
  post 'auth/register', to: 'users#create'
  get 'test', to: 'users#test'
end