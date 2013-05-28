module Items
	module Links
		class Video < ActiveRecord::Base
			
			require 'open-uri'
			attr_accessor :url
			has_attached_file :cover
			
			# before_save do
			# 	case url
			# 	when 
			# end
	
		end
	end
end