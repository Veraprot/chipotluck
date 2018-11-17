Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  root to: 'home#index'


  match 'user_root' => 'users#profile', :via => [:get]
  resources :dishes

  resources :events

  get '/dishes/new/event/:id', to: "dishes#new", as: 'new_dish_event'

  post '/dishes', to: "dishes#create"

  match '/users/:id',     to: 'users#show',       via: 'get'

  # devise_for :users, :path_prefix => 'd'

  resources :users, :only =>[:show]

end
