Rails.application.routes.draw do
  resources :races, only: [:index, :show] do
    resources :variants, only: [:show], controller: 'race_variants'
  end
end
