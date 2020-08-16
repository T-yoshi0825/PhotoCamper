Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
  devise_for :users,controllers: { omniauth_callbacks: 'users/omniauth_callbacks'}

	root "home#top"
	get "home/about" => "home/about"
  get '/map_request', to: 'images#map', as: 'map/request'
  
  resources :users
  resources :inquiries do
      collection do
      get 'confirm'
      get 'thanks'
    end
  end
  
  resources :images do
  	resources :comments, only: [:create, :destroy]
  	resources :favorites, only: [:create, :destroy]
  end

  namespace :admins do
    get "home" => "home#top"
    resources :users
    resources :images
    resources :categories
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
