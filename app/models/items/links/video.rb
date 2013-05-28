module Items
	module Links
		class Video < ActiveRecord::Base
			
			require 'open-uri'
			attr_accessor :json
			validates :vid, presence: true
			validate :is_valid_response
			has_attached_file :cover
			has_attached_file :profile_image
			
			def is_valid_response
				begin
					puts self.response
				rescue OpenURI::HTTPError
					errors.add(:vid, "is invalid")
				end
			end
			
			def response
				self.json = self.json || JSON.parse(open(api.gsub("*", self.vid.to_s)).read)
				self.json
			end
			
		end
	end
end