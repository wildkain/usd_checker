Rails.application.routes.draw do
  root to: 'home#index', as: :home
  resources :currencies, only: %i(new create update)
  get 'admin', to: 'currencies#new'
end
