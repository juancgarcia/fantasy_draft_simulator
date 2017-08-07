Rails.application.routes.draw do

  root to: 'leagus#index'

  resources :leagues do
    resources :teams, except: [:index, :show]
  end

  resources :players
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
