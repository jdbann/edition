Rails.application.routes.draw do
  root to: redirect("/entries")

  resource :account, only: [:new, :create]
  resource :profile, only: [:new, :create]
  resource :session, only: [:new, :create]

  resources :entries, only: [:index, :show, :destroy]
  resources :messages, only: [:new, :create, :edit, :update]
  resources :people, only: :show
end
