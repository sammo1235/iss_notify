Rails.application.routes.draw do
  get "/new", to: "locations#new"
  post "/new", to: "locations#check"
end
