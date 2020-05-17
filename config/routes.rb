Rails.application.routes.draw do

  devise_for :users
  root 'items#index'
  resources :items do
    collection do
      get 'buy'
      get 'search'
    end
  end
  resources :users, only: :show
end
