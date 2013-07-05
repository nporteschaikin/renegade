module Items
	class LinksController < ApplicationController
		
		before_filter :signed_in_user
		
		def new; @link = Link.new(params[:items_link]); end
		
		def create
			@object = Items::Link.create items_link_params
			respond_to do |f|
				f.js { render 'items/create', layout: false }
				f.html { redirect_to @object.item }
			end
		end
		
			def items_link_params
				params.require(:items_link).permit(:url, :room, :message).merge!(user: current_user)
			end
		
	end
end