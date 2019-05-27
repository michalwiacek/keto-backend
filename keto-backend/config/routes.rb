Rails.application.routes.draw do
  namespace :admin do
    resources :users, only: %i(index show new create edit update destroy)
    # resources :jwt_blacklists
    resources :examples, only: %i(index show new create edit update destroy)

    root to: 'users#index'
  end

  scope :api, defaults: { format: :json } do
    scope :v1 do
      resources :examples
      devise_for :users, controllers: { sessions: 'sessions' }
      devise_scope :user do
        get 'users/current', to: 'sessions#show'
      end
    end
  end
end
