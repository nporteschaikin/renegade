module Items
	module Links
		class Vimeo < Video
			
			def api
				'http://vimeo.com/api/v2/video/$.json'
			end
			
			def regex
				/^(https?:\/\/(www.)?vimeo.com\/)[0-9]{1,}(\/)?$/
			end
			
		end
	end
end