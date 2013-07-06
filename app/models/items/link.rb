module Items
	class Link < ActiveRecord::Base

		include Relationship
		
		belongs_to :linked, polymorphic: true
		validates :url, url: true, uniqueness: {case_sensitive: false}
		default_scope {includes(:linked)}
		
		after_validation do
			self.url = URI(self.url).normalize.to_s
		end
		
		before_save do
			case url
			when /^(https?:\/\/(www.)?twitter.com\/)[A-Za-z0-9_]+(\/status\/)[0-9]{1,}(\/)?$/
				self.linked = Links::Tweet.find_or_create_by(tid: url.match(/[0-9]{1,}$/).to_s)
			when /^(?:https?:\/\/)?(?:www\.)?(?:youtu\.be\/|youtube\.com\/(?:embed\/|v\/|watch\?v=|watch\?.+&v=))((\w|-){11})(?:\S+)?$/
				self.linked = Links::Youtube.find_or_create_by(vid: url.match(/((\w|-){11})(?:\S+)?/).to_s)
			when /^(https?:\/\/(www.)?vimeo.com\/)[0-9]{1,}(\/)?$/
				self.linked = Links::Vimeo.find_or_create_by(vid: url.match(/[0-9]{1,}/).to_s)
			when /(?:jpe?g|gif|png|ico)$/
				self.linked = Links::Photo.create(url: url)
			else
				self.linked = Links::Site.create(url: url)
			end
		end
	
	end
end