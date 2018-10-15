Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'permaculture', to: 'pages#permaculture'
  get 'association', to: 'pages#association'

  resources :events, only: [:index, :show] do
    resources :participations, only: [:create]
  end

  namespace :admin do
    resources :events do
      get 'close' , to: 'events#close'
      get 'open'  , to: 'events#open'
    end
  end
end
