Rails.application.routes.draw do
  resources :races, only: [:index, :show] do
    resources :variants, only: [:show], controller: 'race_variants'
  end

  resources :character_classes, only: [:index, :show], path: 'classes'
end
