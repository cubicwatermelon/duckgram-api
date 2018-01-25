Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users do
        resources :posts, only: [:show, :index]

        member do
          post   '/follow',   to: 'relationships#follow'
          delete '/unfollow', to: 'relationships#unfollow'
          get :following, :followers
        end
      end

      resources :posts do
        member do
          post   '/like',   to: 'likes#like'
          delete '/dislike', to: 'likes#dislike'
        end
      end

      post 'authenticate', to: 'authentication#login'

      get 'feed', to: 'users#feed'
    end
  end
end