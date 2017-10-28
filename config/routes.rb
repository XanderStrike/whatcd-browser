Rails.application.routes.draw do
  get 'collages', to: 'collages#index'
  get 'collages/:id', to: 'collages#show'

  get 'artists/index'

  get 'artists/show'
end
