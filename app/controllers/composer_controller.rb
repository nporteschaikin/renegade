class ComposerController < ApplicationController
	
	def link
		@room = Room.unscoped.find_by_slug params[:id]
		@item = @room.items.new item_params.merge!(item: Items::Link.unscoped.find_or_initialize_by(link_params), user: current_user)
		save_and_respond
	end
	
	private
		
		def save_and_respond
			@item.save!
			respond_to do |f|
				f.js { render 'create', layout: false }
				f.html { redirect_to @item }
			end
		end
		
		def item_params
			params.require(:item).permit(:message)
		end
		
		def link_params
			params.require(:item).require(:link).permit(:url)
		end
	
end