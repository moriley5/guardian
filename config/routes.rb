Rails.application.routes.draw do

  root "application#index"

  resources :users, only: [:index, :new, :create, :show]
  resources :sessions, only: [:new, :create]

  resources :guardian_profiles, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :memories, only: [:new, :create, :edit, :update, :destroy]
    resources :notes, only: [:new, :show, :destroy, :create, :edit, :update]
  end

  get '/logout', to: 'sessions#destroy', as: :logout

end

