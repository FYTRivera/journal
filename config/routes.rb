Rails.application.routes.draw do
  devise_for :users
  get '/categories/today' => 'categories#today'
  resources :categories do
    get '/tasks/today' => 'tasks#today'
    resources :tasks
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "categories#index"
end
