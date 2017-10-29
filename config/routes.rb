Rails.application.routes.draw do
  get 'collages', to: 'collages#index'
  get 'collages/random', to: 'collages#random'
  get 'collages/:id', to: 'collages#show'

  get 'artists', to: 'artists#index'
  get 'artists/random', to: 'artists#random'
  get 'artists/:id', to: 'artists#show'

  get 'groups', to: 'groups#index'
  get 'groups/:id', to: 'groups#show'
end
