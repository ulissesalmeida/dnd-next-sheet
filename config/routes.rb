Rails.application.routes.draw do
  root to: 'races#index'
  resources :races, only: [:index, :show] do
    resources :variants, only: [:show, :create], controller: 'race_variants'
  end
  resources :character_classes, only: [:index, :show, :create], path: 'classes'
  resources :backgrounds, only: [:index, :show, :create]
end
