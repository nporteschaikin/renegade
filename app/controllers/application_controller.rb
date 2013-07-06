class ApplicationController < ActionController::Base
  
	include Sessions
	include TextHelper
	include CommentHelper
	protect_from_forgery with: :exception
	
end
