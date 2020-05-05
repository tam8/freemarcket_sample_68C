Rails.application.routes.draw do

  devise_for :users
  root 'items#index'
  resources :items do
    collection do
      get 'buy'
    end
  end
  resources :users, only: :show
end
