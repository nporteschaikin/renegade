Renegade::Application.routes.draw do
  
	root to: 'home#index'
	
	resources :rooms do
		collection do
			get 'popular(/when/:time)(/where/:location)', action: :popular
		end
		member do
			match 'composer/link', to: 'composer#link', via: :post
			get 'close'
		end
	end
	
	resources :tags, only: :show
	
	resources :items, only: :show do
		resources :comments, only: [:index, :create]
	end
	
	resources :comments, only: [:show, :create] do
		member do
			get 'reply'
		end
	end
	
	resources :users
	resources :notifications, only: :index do
		collection do
			get 'events'
		end
	end
	
	resources :sessions, only: :create
	get '/in' => 'sessions#new'
	post '/in' => 'sessions#create'
	delete '/out' => 'sessions#destroy'
	
end
