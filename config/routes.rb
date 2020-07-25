Rails.application.routes.draw do
  devise_for :users
	root "home#top"
	get "home/about" => "home/about"
  
  resources :users
  resources :images do
  	resources :comments, only: [:create, :destroy]
  	resources :favorites, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
