module Filters
	
	def popular
		object.popular(
			time: params[:time] && 1.respond_to?(params[:time]) ? 1.send(params[:time]) : false, 
			location: params[:location], 
			limit: 20
		)
		render 'index'
	end
	
end