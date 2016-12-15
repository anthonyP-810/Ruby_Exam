Rails.application.routes.draw do
 resources :user, :session
 root 'user#index'
 get '/user' => 'user#index'
 post '/user' => 'user#create'
 get '/user/new' => 'user#new'
 get '/user/:id' => 'user#show'
 patch '/user/:id' => 'user#update'
 delete '/user/:id' => 'user#delete'
 get '/session/new' => 'session#login'
 delete '/session/:id' => 'session#destroy'
 
end
