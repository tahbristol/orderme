Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations", :sessions => 'users/sessions'}

  root to: 'home#index'

  resources :users, only: [:show] do
    get 'purchased_queue', to: 'users#purchased_queue'
    get 'picture', to: 'users#picture'
    patch 'add_picture', to: 'users#add_picture'
  end

  resources :orders do
    post 'purchase', to: 'orders#purchase'
    get 'begin', to: 'orders#begin'
    post 'complete', to: 'orders#complete'
    post 'invoice', to: 'orders#invoice'
    post 'update_line_items', to: 'orders#update_line_items'
    resources :notes
    resources :line_items
  end

  resources :line_items do
    resources :notes
  end
  resources :notes
  # redirect to root if bad path
  #get '*path' => redirect('/')
end
