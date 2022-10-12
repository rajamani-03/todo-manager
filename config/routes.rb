Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/", to: "home#index"
  
  get "todos", to: "todos#index"
  post "todos", to: "todos#create"
  put "todos/:todo_id", to: "todos#update"
  delete "todos/:todo_id", to: "todos#destroy"

  # resources :users
  # get "/users" => "users#index"
  get "/users/new" => "users#new"
  post "/users" => "users#create"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create", as: :signin_new
  delete "/logout" => "sessions#destroy"

end 

 