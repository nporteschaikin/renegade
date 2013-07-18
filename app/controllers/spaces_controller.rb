class SpacesController < ApplicationController
	
	before_filter :signed_in_user, except: [:show, :index]
	
	def show
		@space = Space.find_and_visit(params[:id], request)
		current_user.open @space
	end
	
end