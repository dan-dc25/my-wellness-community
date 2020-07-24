Rails.application.routes.draw do
  root 'application#home'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/user/:id' => 'users#show', as: 'user_path' 

  resources :users  
  resources :users, only: [:new, :show] do
    resources :posts, only: [:show, :index, :new, :edit]
    resources :recipes
  end
  resources :posts
  resources :recipes
  resources :comments
  resources :cookbooks
  
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
