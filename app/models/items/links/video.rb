module Items
	module Links
		class Video < ActiveRecord::Base
			
			require 'open-uri'
			attr_accessor :json
			validates :vid, presence: true
			has_attached_file :cover
			has_attached_file :profile_image
			
			def response
				self.json = self.json || JSON.parse(open(api.gsub("*", self.vid.to_s)).read)
				self.json
			end
			
		end
	end
end