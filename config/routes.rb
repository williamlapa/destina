Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :requests do
    resources :products, only: :index do
      resources :orders, only: %i[new create show]
    end
  end
  resources :products
  resources :categories, only: :index
  resources :orders, only: %i[index edit show update]
end
