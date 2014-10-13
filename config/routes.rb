Rails.application.routes.draw do
  resources :races, only: [:index, :show]
  resources :race_variants, only: [:show]
end
