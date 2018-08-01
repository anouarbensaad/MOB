Rails.application.routes.draw do
  resources :pannes
  get '/home', to: 'static_pages#home', as: 'home'
  root   'pannes#index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
