Rails.application.routes.draw do
  get 'about/index'

  resources :todos do
    resources :notes
  end

  root 'about#index'
end
