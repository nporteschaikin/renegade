module Items
	module Links
		class Vimeo < Video
			
			cattr_accessor :api do
				'http://vimeo.com/api/v2/video/*.json'
			end
			
			cattr_accessor :regex do
				/^(https?:\/\/(www.)?vimeo.com\/)[0-9]{1,}(\/)?$/
			end
			
			cattr_accessor :id do
				/[0-9]{1,}/
			end
				
			before_save do
				self.name = self.response.first["title"]
				self.author = self.response.first["user_name"]
				self.aid = self.response.first["user_id"]
				self.profile_image = URI.parse(self.response.first["user_portrait_medium"])
				self.description = self.response.first["description"]
				self.cover = URI.parse(self.response.first["thumbnail_medium"])
			end
			
		end
	end
end