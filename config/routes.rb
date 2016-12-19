Rails.application.routes.draw do
  devise_for :users, controllers: { sessions:'users/sessions', registrations: "users/registrations", passwords: 'users/passwords', confirmations: 'users/confirmations', unlocks: "users/unlocks"}, skip: [:omniauth_callbacks]
  root 'homes#index'

  namespace :api do
    scope :v1, defaults: {format: :json} do
      mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks], controllers: { sessions: 'api/overrides/sessions', 'registrations': 'api/users'}
      resources :users, only: [:update, :create, :show, :index]
      resources :patients
      resources :cites do
        resources :payments
      end
      resources :services
      resources :doctors
      resources :cites_patients
      resources :cites_doctors
      resources :attendants
      resources :histories
      resources :histories_patients
    end
  end
end
