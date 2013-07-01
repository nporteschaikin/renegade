module Items
	module Links
		class Youtube < Video
			
			cattr_accessor :api do
				'http://gdata.youtube.com/feeds/api/videos/*?v=2&alt=jsonc'
			end
			
			before_save do
				self.name = self.response["data"]["title"]
				self.author = self.response["data"]["uploader"]
				self.description = self.response["data"]["description"]
				self.cover = URI.parse(self.response["data"]["thumbnail"]["hqDefault"])
			end
			
		end
	end
end