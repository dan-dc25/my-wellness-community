Rails.application.routes.draw do
  root 'application#home'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  resources :categories
  resources :cookbooks
  resources :comments
  resources :recipes
  resources :posts
  resources :users, only: [:show] do
    resources :posts
    resources :recipes
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
