module Items
	module Links
		module Relationship
			extend ActiveSupport::Concern
			included do
				has_many :links, as: :link, class_name: "Items::Link", dependent: :destroy
			end
		end
	end
end