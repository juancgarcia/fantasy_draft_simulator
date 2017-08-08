Rails.application.routes.draw do

  root to: 'leagus#index'

  resources :leagues do
    resources :teams
  end

  resources :players do
    resources :plays_on
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
