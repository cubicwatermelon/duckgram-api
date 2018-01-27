Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users do
        resources :posts, only: [:show, :index]

        member do
          post '/follow',   to: 'relationships#follow'
          post '/unfollow', to: 'relationships#unfollow'
          get :following, :followers
          get 'is_following', to: 'users#is_following'
        end
      end

      resources :posts do
        resource :likes, only: [:index]

        member do
          post '/like',    to: 'likes#create'
          post '/dislike', to: 'likes#destroy'
        end
      end

      post 'authenticate', to: 'authentication#login'

      get 'feed',         to: 'users#feed'
      get 'recent_likes', to: 'users#recent_likes'
    end
  end
end