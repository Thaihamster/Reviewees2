Rails.application.routes.draw do
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
    resources :reviews
    resources :likes, only: [:create, :destroy]
  end

end
