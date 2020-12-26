Rails.application.routes.draw do
  get 'products_imports/new'
  get 'products_imports/create'
  get 'products_imports/modelo'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :requests do
    resources :products, only: %i[index show] do
      resources :orders, only: %i[new create show]
    end
  end
  resources :products do
    get 'charts', on: :collection
  end
  resources :categories, only: :index
  resources :orders, only: %i[index edit show update destroy]
  resources :products_imports, only: %i[index new create]

  patch '/accept_orders/:id', to: "orders#accept", as: :accept
  patch '/reject_orders/:id', to: "orders#reject", as: :reject
end
