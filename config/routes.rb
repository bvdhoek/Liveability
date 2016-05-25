Rails.application.routes.draw do
  root 'communes#index'

  get 'communes/:commune_id' => 'neighbourhoods#index'

  resources :communes, only: [:index] do
    resources :neighbourhoods, only: [:index, :show]
  end
end
