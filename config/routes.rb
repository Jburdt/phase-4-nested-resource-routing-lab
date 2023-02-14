Rails.application.routes.draw do
  resources :items, only: [:index]
  resources :users, only: [:show] 
  

  get "/users/:user_id/items", to: 'users#user_items'
  get "/users/:user_id/items/:id", to: "users#items"
  post "/users/:user_id/items", to: "items#create"

end
