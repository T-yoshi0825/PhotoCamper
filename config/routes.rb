Rails.application.routes.draw do
  devise_for :users
	root "home#top"
	get "home/about" => "home/about"
  
  resources :users
  resources :campers
  resources :gears
  resources :camp_sites
  resources :recipes


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
