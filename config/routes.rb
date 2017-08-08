Rails.application.routes.draw do

  root to: 'leagues#index'
  get '/leagues/:id/draft', to: 'plays_on#new'
  post '/leagues/:id/draft', to: 'plays_on#create'

  resources :leagues do
    resources :teams
  end

  resources :players do
    resources :plays_on
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
