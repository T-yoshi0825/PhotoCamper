Rails.application.routes.draw do

  get 'search/search'
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

  devise_for :users,controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

	root "home#top"
	get "home/about" => "home/about"
  get '/map_request', to: 'images#map', as: 'map/request'
  get "search" => "users#search"
  resources :users do
    member do
      get "check"
      patch "withdrawl"
    end
  end

  resources :categories, only: [:show]

  resources :inquiries do
    collection do
      get 'confirm'
      get 'thanks'
    end
  end
  
  resources :images do
    collection do 
      get 'favorite'
      get 'access'
    end
  	resources :comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  end

  namespace :admins do
    get "home" => "home#top"
    resources :users


    resources :images do 
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end

    resources :categories
    
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
