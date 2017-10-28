Rails.application.routes.draw do
  get 'collages', to: 'collages#index'
  get 'collages/:id', to: 'collages#show'

  get 'artists', to: 'artists#index'
  get 'artists/:id', to: 'artists#show'
end
