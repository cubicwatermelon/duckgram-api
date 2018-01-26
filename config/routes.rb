Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users do
        resources :posts, only: [:show, :index]

        member do
          post '/follow',   to: 'relationships#follow'
          post '/unfollow', to: 'relationships#unfollow'
          get :following, :followers
          get 'recent_likes', to: 'users#recent_likes'
          get 'is_following', to: 'users#is_following'
        end
      end

      resources :posts do
        member do
          post '/like',    to: 'likes#like'
          post '/dislike', to: 'likes#dislike'
        end
      end

      post 'authenticate', to: 'authentication#login'

      get 'feed', to: 'users#feed'
    end
  end
end