module Items
	module Links
		class Youtube < Video
			
			cattr_accessor :api do
				'http://gdata.youtube.com/feeds/api/videos/*?v=2&alt=jsonc'
			end
			
			cattr_accessor :regex do
				/^(?:https?:\/\/)?(?:www\.)?(?:youtu\.be\/|youtube\.com\/(?:embed\/|v\/|watch\?v=|watch\?.+&v=))((\w|-){11})(?:\S+)?$/
			end
			
			cattr_accessor :id do
				/((\w|-){11})(?:\S+)?/
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