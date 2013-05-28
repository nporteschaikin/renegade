module Tags
	module Relationship
		
		extend ActiveSupport::Concern
		
		included do
			has_many :tag_relationships, as: :tagged, dependent: :destroy
			has_many :tags, through: :tag_relationships, source: :tag
		end
		
	end
end