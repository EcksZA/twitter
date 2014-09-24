Rails.application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  root to: 'posts#index'

  resources :users do
    resources :posts, except: [:index, :edit, :update]
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts, only: [:index]

end
