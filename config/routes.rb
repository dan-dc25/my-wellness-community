Rails.application.routes.draw do
  root 'application#home'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  resources :users  
  resources :users do
    resources :posts
    resources :recipes
  end
  resources :posts
  resources :recipes
  resources :comments
  resources :cookbooks
  
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
