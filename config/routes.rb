Rails.application.routes.draw do

  resources :tasks
  resources :routines, only: [:index, :show]
  resources :users do
    resources :routines, only: [:new, :edit] do
      get '/add', to: 'users#add_routine'
    end
  end


  post '/login', to: 'sessions#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
