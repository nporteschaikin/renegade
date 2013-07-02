module Items
	module Links
		class Site < ActiveRecord::Base
			
			include Items::Links::UrlOpen
			
			attr_accessor :parsed
			has_attached_file :favicon, styles: {thumb: "16x16#"}
			has_attached_file :photo, styles: {thumb: "16x16#"}
			
			before_save do
				self.parsed = Nokogiri::HTML(self.response)
				self.name = get_name
				self.description = get_description
				self.favicon = get_favicon
				self.photo = get_photo
			end
			
			private 
			
				def get_name
					self.parsed.title
				end
				
				def get_description
					description = self.parsed.at('meta[@name="description"]')
					description[:content] unless description.nil?
				end
				
				def get_favicon
					favicon = self.parsed.at('[@rel="icon"]') || self.parsed.at('[@rel="shortcut icon"]') || self.parsed.at('meta[@itemprop="image"]')
					unless favicon.nil?
						URI.parse(self.url).merge(favicon[:content] || favicon[:href])
					end
				end
				
				def get_photo
					photo = self.parsed.at('meta[@property="og:image"]')
					URI.parse(photo[:content]) unless photo.nil?
				end
			
		end
	end
end