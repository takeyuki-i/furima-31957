Rails.application.routes.draw do
  root to: 'items#new'
  resources :items, only: :new
end