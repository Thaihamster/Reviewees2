Rails.application.routes.draw do
  get 'child_category/child_categories'

  root 'static_pages#home'
  controller :static_pages do
    get :about
    get :privacy
    get :contact
    get :search
  end

  get    '/signup',   to: 'users#new'
  get    '/login',    to: 'sessions#new'
  post   '/login',    to: 'sessions#create'
  delete '/logout',   to: 'sessions#destroy'

  resources :users

  resources :posts do
    collection do
      get 'get_category_children'
    end
    member do
      get 'get_category_children'
    end
    resources :reviews
    resources :likes, only: [:create, :destroy]
  end

  resources :categories, only: [:show]

  resources :child_categories, only: [:show]

end
