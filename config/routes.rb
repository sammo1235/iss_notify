Rails.application.routes.draw do
  resources :users
  get "/new", to: "locations#new"
  post "/new", to: "locations#check"
end
