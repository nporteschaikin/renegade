module Close
	
	def close
		@object = params[:controller].classify.constantize.find_by_slug(params[:id])
		current_user.close @object
		respond_to do |f|
			f.js
			f.html
		end
	end
	
end