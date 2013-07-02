Renegade::Application.routes.draw do
  
	root to: 'home#index'
	
	namespace :items do
		resources :links
	end
	
	resources :rooms
	resources :users
	
	resources :sessions, only: :create
	get '/in' => 'sessions#new'
	post '/in' => 'sessions#create'
	delete '/out' => 'sessions#destroy'
	
end
