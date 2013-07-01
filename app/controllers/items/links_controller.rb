module Items
	class LinksController < ApplicationController
		
		before_filter :signed_in_user, except: [:index, :show]
		before_filter :redirect_incorrect_user, only: [:edit, :update]
		
		def new; @link = Link.new(params[:items_link]); end
		
		def create
			@link = Items::Link.new(items_link_params)
			@link.save ? redirect_to(items_link_path(@link)) : render('new')
		end
		
		def edit; end
		
		def update
			@link.update_attributes(params[:items_link])
			redirect_to items_link_path(@link)
		end
		
		def show; @link = Link.find(params[:id]); end
		
		private 
		
			def items_link_params
				params.require(:items_link).permit(:url, :room).merge!(user: current_user)
			end
			
			def redirect_incorrect_user
				@link = Link.find params[:id]
				redirect_incorrect_user @link.item.user
			end
		
	end
end