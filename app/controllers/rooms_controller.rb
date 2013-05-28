class RoomsController < ApplicationController
	
	before_filter { |r| @room = Room.find(params[:id]); r.redirect_incorrect_user @room.user }, only: [:edit, :update]
	
	def new; @room = Room.new(params[:room]); end
	
	def create
		@room = current_user.rooms.new(params[:room])
		if @room.save
			redirect_to items_link_path(@link)
		else
			render 'new'
		end
	end
	
	def edit; end
	
	def update
		@room.update_attributes(params[:link])
		redirect_to room_path(@room)
	end
	
	def show; @room = Room.find(params[:id]); end
	
end