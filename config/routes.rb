Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  
  root to: 'home#index'
  
  resources :users, only: [:show]
  resources :orders do
    post 'purchase', to: 'orders#purchase'
  end
  
  # redirect to root if bad path
  get '*path' => redirect('/')
end
