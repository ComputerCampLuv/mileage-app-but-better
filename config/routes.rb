Rails.application.routes.draw do
  root to: 'partial_fills#new'
  resources :partial_fills
  get '/info' => 'partial_fills#index'
end
