class RoomsController < ApplicationController
	
	def new; @room = Room.new(params[:room]); end
	
	def create
		@room = current_user.rooms.new(params[:room])
		@room.save ? redirect_to(items_link_path(@link)) : render('new')
	end
	
	def edit; end
	
	def update
		@room.update_attributes(params[:link])
		redirect_to room_path(@room)
	end
	
	def show 
		@room = Room.find_by_slug_and_visit(params[:id], request)
	end
	
end