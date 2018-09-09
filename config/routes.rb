Rails.application.routes.draw do
  root to: 'home#index', as: :home
  resources :currencies, except: %i(index show)
  get 'admin', to: 'currencies#new'
end
