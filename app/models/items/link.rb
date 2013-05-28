module Items
	class Link < ActiveRecord::Base

		include Relationship
		
		belongs_to :linked, polymorphic: true
		validates :url, url: true
		
		after_validation do
			self.url = URI(self.url).normalize.to_s
		end
		
		before_save do
			case url
			when Links::Tweet.regex
				self.linked = Links::Tweet.find_or_create_by(tid: url.match(Links::Tweet.id).to_s)
			when Links::Youtube.regex
				self.linked = Links::Youtube.find_or_create_by(vid: url.match(Links::Youtube.id).to_s)
			when Links::Vimeo.regex
				self.linked = Links::Vimeo.find_or_create_by(vid: url.match(Links::Vimeo.id).to_s)
			else
				exists = Link.find_by_url(url)
				case url
				when /(?:jpe?g|gif|png|ico)$/
					self.linked = exists ? exists : Links::Photo.create(url: url)
				else
					self.linked = exists ? exists : Links::Site.create(url: url)
				end
			end
		end
	
	end
end