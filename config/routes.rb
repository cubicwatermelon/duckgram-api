Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :index, :show, :update, :destroy]

      post 'authenticate', to: 'authentication#login'
    end
  end
end