class ApplicationController < ActionController::Base
  
	include Sessions
	include TextHelper
	protect_from_forgery with: :exception
	
end
