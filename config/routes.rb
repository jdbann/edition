Rails.application.routes.draw do
  root to: redirect("/messages")

  resources :messages
end
