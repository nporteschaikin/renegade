module Items
	module Links
		class OpenGraphTag < ActiveRecord::Base
			
			validates :name, presence: true
			validates :content, presence: true
			
			before_save do
				self.name = self.name[3..-1] if self.name.match(/^og:(.+)$/i)
			end
			
		end
	end
end