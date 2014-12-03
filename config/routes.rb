Rails.application.routes.draw do
  root to: 'races#index'
  resources :races, only: [:index, :show] do
    resources :variants, only: [:show], controller: 'race_variants'
  end
  resources :character_classes, only: [:index, :show], path: 'classes'
  resources :backgrounds, only: [:index, :show]
  resources :character_sheets, only: [] do
    collection do
      put 'race_variant'
      put 'background'
      put 'character_class'
    end
  end
end
