Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}

  root to: 'home#index'

  resources :users, only: [:show] do

  end
  resources :orders do
    post 'purchase', to: 'orders#purchase'
    get 'begin', to: 'orders#begin'
    post 'complete', to: 'orders#complete'
    post 'update_line_items', to: 'orders#update_line_items'
  end
  get 'purchased_queue', to: 'orders#purchased_queue'

  # redirect to root if bad path
  #get '*path' => redirect('/')
end
