Rails.application.routes.draw do
  root "welcome#index"
  get "/search", to: "search#index"
  post "/users/:id/favorites", to: "favorites#create", as: "favorite"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
