Rails.application.routes.draw do
  get '/new', to: 'locations_controller#new'
end
