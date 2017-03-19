Rails.application.routes.draw do

  resources :users, only: [:new, :create, :profile]

  resources :sessions, only: [:new, :login, :logout]

  resources :guardian_profiles, only: [:new, :create, :show, :update] do 
    resources :memories, only: [:new, :create, :show, :edit, :delete]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
