Rails.application.routes.draw do
  namespace :api do
    get 'test/:id', to: 'main#test'
    get 'associations/:name/:email/:phone', to: 'main#new_association'
  end
end
