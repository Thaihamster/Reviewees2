Rails.application.routes.draw do
  get 'child_category/index'

  get 'child_category/child_categories'

  root 'static_pages#home'
  get    '/about',    to: 'static_pages#about'
  get    '/privacy',  to: 'static_pages#privacy'
  get    '/contact',  to: 'static_pages#contact'
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

end
