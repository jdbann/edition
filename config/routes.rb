Rails.application.routes.draw do
  root to: redirect("/messages")

  resource :account, only: [:new, :create]
  resources :messages
end
