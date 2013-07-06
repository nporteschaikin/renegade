Renegade::Application.routes.draw do
  
	root to: 'home#index'
	
	resources :rooms do
		collection do
			get 'popular(/when/:time)(/where/:location)', action: :popular
		end
		member do
			match 'composer/link', to: 'composer#link', via: :post
		end
	end
	
	resources :tags, only: :show
	resources :items, only: :show
	resources :comments, only: :show
	
	resources :users
	
	resources :sessions, only: :create
	get '/in' => 'sessions#new'
	post '/in' => 'sessions#create'
	delete '/out' => 'sessions#destroy'
	
end
