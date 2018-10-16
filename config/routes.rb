Rails.application.routes.draw do
  root to: 'partial_fills#new'
  resources :partial_fills
end
