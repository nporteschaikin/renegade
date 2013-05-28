Renegade::Application.routes.draw do
  
	namespace :items do
		resources :links
	end
	
	resources :sessions, only: :create
	get '/in' => 'sessions#new'
	delete '/out' => 'sessions#destroy'
	
end
