module Items
	module Links
		class Site < ActiveRecord::Base
			
			include Items::Links::UrlOpen
			
			attr_accessor :parsed
			has_many :open_graph_tags, class_name: "Items::Links::OpenGraphTag"
			default_scope {includes(:open_graph_tags)}
			has_attached_file :favicon, styles: {thumb: "16x16#"}
			has_attached_file :photo, styles: {thumb: "16x16#"}
			
			before_save do
				self.parsed = Nokogiri::HTML(self.response)
				self.name = get_name
				self.description = get_description
				self.favicon = get_favicon
				self.photo = get_photo
			end
			
			def title; self.og_title || self.name; end
			def source; self.og_site_name; end
			def excerpt; self.og_description || self.description; end
			
			after_save :create_open_graph_tags
			
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
				
				def create_open_graph_tags
					meta_tags = self.parsed.css('meta')
					meta_tags.each do |m|
						self.open_graph_tags.create(name: m.attribute('property').to_s, content: m.attribute('content').to_s) if m.attribute('property') && m.attribute('property').to_s.match(/^og:(.+)$/i)
					end
				end
				
				def method_missing(m, *args, &block)
					if m =~ /(og_)/
						tag = self.open_graph_tags.find{|o| o.name == m.to_s[3..-1]}
						tag.content unless tag.nil?
					else
						super
					end
				end
			
		end
	end
end