Rails.application.routes.draw do
  namespace :api do
    get 'test/:id', to: 'main#test'
  end
end
