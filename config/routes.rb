Renegade::Application.routes.draw do
  
	namespace :items do
		resources :links
	end
	
end
