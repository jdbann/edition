Rails.application.routes.draw do
  resources :messages, only: [:new, :create, :show]
end
