Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  get 'radios/new'
  get 'sessions/new'

  root 'pages#index'
  get  'pages/help'


  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :users
  resources :radios
  
  get    'favorites/index'
  post   '/favorites/index', to: 'favorites#create'
  delete '/favorites/index', to: 'favorites#destroy'
  delete '/radios', to: 'favorites#destroy'
  post "radios/:id/destroy" => "radios#destroy"

end
