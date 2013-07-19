module Items
	module Links
		module UrlOpen
			
			extend ActiveSupport::Concern
			
			included do
				require 'open-uri'
				attr_accessor :url, :response
				validate :is_openable_url
				before_validation do
					self.url = 'http://' + self.url unless URI(self.url).absolute?
				end
			end
			
			def is_openable_url
				begin
					self.response = open(self.url).read
				rescue OpenURI::HTTPError
					errors.add(:url, "is inaccessible")
				rescue RuntimeError
					url = URI.parse(self.url)
					url.scheme = 'https'
					self.response = open(url).read
				end
			end
			
		end
	end
end