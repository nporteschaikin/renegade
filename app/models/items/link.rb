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
			when /^(https?:\/\/(www.)?twitter.com\/)[A-Za-z0-9_]+(\/status\/)[0-9]{1,}(\/)?$/
				self.linked = Links::Tweet.find_or_create_by(tid: url.match(/[0-9]{1,}$/).to_s)
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