Rails.application.routes.draw do
  resources :videos
  get '/register' => 'users#new'
  #resources :users, only:[:create]
  post '/register' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
end
