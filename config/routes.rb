Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'permaculture', to: 'pages#permaculture'
  get 'association', to: 'pages#association'
  get 'agenda', to: 'pages#agenda'
  get 'ecoasis', to: 'pages#ecoasis'

  localized do
    resources :events, only: [:show], param: :slug do
      resources :participations, only: [:create]
    end
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
