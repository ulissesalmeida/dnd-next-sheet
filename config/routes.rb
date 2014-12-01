Rails.application.routes.draw do
  root to: 'races#index'
  resources :races, only: [:index, :show] do
    resources :variants, only: [:show], controller: 'race_variants'
  end
  post 'races/:id' => 'races#create'
  post 'races/:id/variants/:id' => 'race_variants#create'
  post 'classes/:id' => 'character_classes#create'
  post 'backgrounds/:id' => 'backgrounds#create'
  resources :character_classes, only: [:index, :show], path: 'classes'
  resources :backgrounds, only: [:index, :show]
end
:create
