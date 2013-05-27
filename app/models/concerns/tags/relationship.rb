module Tags
	module Relationship
		extend ActiveSupport::Concern
		included do
			has_many :tags, as: :tagged, class_name: "Tag", dependent: :destroy 
		end
	end
end