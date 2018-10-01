Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :events, only: [:index, :show]

  namespace :admin do
    resources :events, only: [:index, :show] do
      get 'close' , to: 'events#close'
      get 'open'  , to: 'events#open'
    end
  end
end
