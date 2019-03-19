Rails.application.routes.draw do


  root to: "static#index"

  resources :tasks, only: [:index, :show]
  resources :routines, only: [:index, :show, :show]

  get '/auth/google_oauth2/callback' => 'sessions#create_with_google'


  resources :users do
    get '/my_routines', to: 'users#my_routines'
    get '/my_tasks', to: 'users#my_tasks'
    resources :routines, only: [:new, :edit, :update, :create] do
      get '/add', to: 'users#add_routine'
      resources :tasks, only: [:new, :edit, :update, :create]
    end
  end


  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
