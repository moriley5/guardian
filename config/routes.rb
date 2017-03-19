Rails.application.routes.draw do

  resources :users, only: [:new, :create, :show]

  resources :sessions, only: [:new, :create, :destroy]

  resources :guardian_profiles, only: [:new, :create, :show, :edit, :update] do 
    resources :memories, only: [:new, :create, :show, :edit, :update, :delete]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
