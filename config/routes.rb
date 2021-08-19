Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'index#show'
  
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  
  get '/signin' => 'sessions#new'
  get '/show' => 'sessions#show'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

  get '/admin' => 'users#admin'
  get '/index' => 'index#show'

  resources :users do
    resources :images
  end



end


# if it doesn't work under user, then try sessions...