class SpacesController < ApplicationController
	
	before_filter :signed_in_user, except: [:show, :index]
	
end