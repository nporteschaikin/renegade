class RoomsController < ApplicationController
	
	include Filters
	include ActionController::Live
	
	def new; @room = object.new(params[:room]); end
	
	def index
		@rooms = Room.find :all
	end
	
	def create
		@room = current_user.rooms.new(params[:room])
		@room.save ? redirect_to(items_link_path(@link)) : render('new')
	end
	
	def edit
		@room = object.find_by_slug_and_visit(params[:id], request)
	end
	
	def update
		@room = object.find_by_slug_and_visit(params[:id], request)
		@room.update_attributes(params[:link])
		redirect_to room_path(@room)
	end
	
	def show
		@room = object.find_by_slug_and_visit(params[:id], request)
		@item = Item.new room: @room if signed_in?
	end
	
	private
		
		def object; Room; end
	
end