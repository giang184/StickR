Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'users#new'
  
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

  resources :users do
    resources :images
  end



end


# if it doesn't work under user, then try sessions...