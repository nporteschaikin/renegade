module Items
	module Links
		class Youtube < Video
			
			@@api = 'http://gdata.youtube.com/feeds/api/videos/'
			@@regex = /^(?:https?:\/\/)?(?:www\.)?(?:youtu\.be\/|youtube\.com\/(?:embed\/|v\/|watch\?v=|watch\?.+&v=))((\w|-){11})(?:\S+)?$/
			
		end
	end
end