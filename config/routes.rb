# Rails.application.routes.draw do
Blog::Application.routes.draw do
  root to: 'articles#index'
  resources :articles
  resources :tags
  resources :authors
  resources :author_sessions, only: [ :new, :create, :destroy ]
  resources :categories

  get 'login'  => 'author_sessions#new'
  get 'logout' => 'author_sessions#destroy'
end
