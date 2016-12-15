Rails.application.routes.draw do
 resources :user, :products
 root 'user#index'
 get '/user' => 'user#index'
 post '/user' => 'user#create'
 get '/user/new' => 'user#new'
 get '/user/:id' => 'user#show'
 patch '/user/:id' => 'user#update'
 delete '/user/:id' => 'user#delete'
 get '/session/new' => 'session#login'
 delete '/session/:id' => 'session#destroy'
 get '/dashboard/:id' => 'products#index'
 post '/products' => 'products#create'
 get '/shoes' => 'products#show'
 patch '/product/:id/buy' => 'products#buy'
 delete '/product/:id/destroy' => 'products#destroy'

 
end
