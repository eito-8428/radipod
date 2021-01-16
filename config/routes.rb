Rails.application.routes.draw do
  get 'radios/new'
  get 'sessions/new'

  root 'pages#index'
  get  'pages/help'


  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  
  resources :radios do
   resources :comments, only: [:create, :destroy]
  end
  resources :users
  resources :favorites
  
  # get    'favorites/index'
  # post   '/favorites/index', to: 'favorites#create'
  # delete '/favorites/', to: 'favorites#destroy'
  
  
  # delete "radios/:id" => "radios#destroy"

end
