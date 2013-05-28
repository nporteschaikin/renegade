module Items
	class LinksController < Controller
		
		before_filter { |r| @link = Link.find(params[:id]); r.redirect_incorrect_user @link.item.user }, only: [:edit, :update]
		
		def new; @link = Link.new(params[:link]); end
		
		def create
			params[:link][:item_attributes][:user] = current_user
			@link = Link.new(params[:link])
			if @link.save
				redirect_to items_link_path(@link)
			else
				render 'new'
			end
		end
		
		def edit; @link = Link.find(params[:id]); end
		
		def update
			@link = @link = Link.find(params[:id])
			@link.update_attributes(params[:link])
			redirect_to items_link_path(@link)
		end
		
		def show; @link = Link.find(params[:id]); end
		
	end
end