Rails.application.routes.draw do
  root to: 'home#index', as: :root
  resources :currencies, only: %i(new create update)
  get 'admin', to: 'currencies#new'
  mount ActionCable.server => '/cable'
end
