module Items
	class LinksController < ApplicationController
	
		def new
			@item = Link.new(params[:link])
		end
		
		def create
			@item = Link.create(params[:link])
		end
		
	end
end