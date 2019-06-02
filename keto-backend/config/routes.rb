Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'sessions' }
  devise_scope :user do
    get 'users/current', to: 'sessions#show'
  end

  namespace :admin do
    # devise_for :users, only: :sessions
    # devise_scope :user do
    #   get 'users/current', to: 'sessions#show'
    # end
    resources :users, only: %i(index show new create edit update destroy)
    # resources :jwt_blacklists
    resources :articles, only: %i(index show new create edit update destroy)
    resources :tags
    resources :taggings
    resources :roles, only: %i(index show)

    root to: 'users#index'
  end

  root to: 'welcome#index'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :articles
    end
  end
end
