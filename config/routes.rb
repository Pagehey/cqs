Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users, skip: :all
  devise_scope :user do
    get 'connexion', to: 'devise/sessions#new', as: :new_user_session
    post 'connexion', to: 'devise/sessions#create', as: :user_session
    delete 'deconnexion', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  get 'permaculture', to: 'pages#permaculture'
  get 'association', to: 'pages#association'
  get 'agenda', to: 'pages#agenda'
  get 'ecoasis', to: 'pages#ecoasis'

  localized do
    resources :events, only: [:show], param: :slug do
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

end
