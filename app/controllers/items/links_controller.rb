module Items
	class LinksController < Controller
		
		def new; @link = Link.new(params[:link]); end
		
		def create
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