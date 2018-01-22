Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users do
        resources :posts, only: [:show, :index]
      end
      resources :posts
      post 'authenticate', to: 'authentication#login'
    end
  end
end