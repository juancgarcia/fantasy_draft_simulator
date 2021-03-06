Rails.application.routes.draw do

  root to: 'leagues#index'

  resources :leagues do
    resources :teams do
      resources :players do
        post 'draft'
      end
    end
    resources :plays_on
    member do
      get 'draft'
    end
  end

  resources :players 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
