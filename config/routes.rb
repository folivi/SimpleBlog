Rails.application.routes.draw do
  root 'home#index'

  resources :comments, except: :index do 
    member do
      post 'togge_approval'
    end
  end
  resources :articles do
    resources :comments
  end
  resources :tags

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
end
