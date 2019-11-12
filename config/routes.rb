Rails.application.routes.draw do
  default_url_options host: ENV['APP_HOST']
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
  end
  post '/graphql', to: 'graphql#execute'
  devise_for :users, controllers: { sessions: 'sessions' }
  devise_scope :user do
    get 'users/current', to: 'sessions#show'
  end

  namespace :admin do
    mount GraphdocRuby::Application, at: 'graphdoc'
    resources :users, only: %i[index show new create edit update destroy]
    resources :categories, only: %i[index show new create edit update destroy]
    resources :articles, only: %i[index show new create edit update destroy]
    resources :recipes, only: %i[index show new create edit update destroy]
    resources :steps, only: %i[index show new create edit update destroy]
    resources :ingredients, only: %i[index show new create edit update destroy]
    resources :components, only: %i[index show new create edit update destroy]
    resources :roles, only: %i[index show]

    root to: 'users#index'
  end

  root to: 'welcome#index'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :articles
    end
  end
end
