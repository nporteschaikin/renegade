module Items
	module Links
		class Photo < ActiveRecord::Base
	
			include Items::Links::UrlOpen
			has_attached_file :image
			
			before_save do
				self.image = self.response
			end
	
		end
	end
end