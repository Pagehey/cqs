Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'permaculture', to: 'pages#permaculture'
  get 'association', to: 'pages#association'
  get 'agenda', to: 'pages#agenda'

  resources :events, only: [:index, :show] do
    resources :participations, only: [:create]
  end

  namespace :admin do
    resources :events do
      member do
        get 'close'
        get 'open'
        get 'mark_participations_as_read'
      end
    end
  end
end
