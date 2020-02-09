Rails.application.routes.draw do
  namespace :api do
    get 'test/:id', to: 'main#test'
    get 'associations/:name/:email/:phone', to: 'main#new_association'
    get '/token', to: 'main#header_test'
    get '/user', to: 'main#my_user'
    get '/user/all', to: 'main#user_all'
    get '/user/friends', to: 'main#get_my_friends'
    get '/user/achievements', to: 'main#user_achievements'
    get '/user/:user_id', to: 'main#get_user'
    get '/user/friends/:user_id', to: 'main#get_user_friends'
    post '/login', to: 'login#login'
    post '/register', to: 'login#register'
  end
end
