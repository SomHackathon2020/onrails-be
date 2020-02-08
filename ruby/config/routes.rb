Rails.application.routes.draw do
  namespace :api do
    get 'test/:id', to: 'main#test'
    get 'associations/:name/:email/:phone', to: 'main#new_association'
    get '/token', to: 'main#header_test'
  end
end
