Rails.application.routes.draw do


  root to: "static#index"

  resources :tasks, only: [:index, :show]
  resources :routines, only: [:index, :show, :show]

  get '/auth/google_oauth2/callback' => 'sessions#create_with_google'


  resources :users do
    get '/my_routines', to: 'users#my_routines' #users/1/routines _form 
    get '/my_tasks', to: 'users#my_tasks'
    #get '/add', to: 'users#add_routine' put it here


    resources :routines, only: [:new, :edit, :update, :create, :destroy] do
      get '/add', to: 'users#add_routine'
    end
  end


  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
