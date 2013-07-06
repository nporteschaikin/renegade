module Tags
	module Relationship
		
		extend ActiveSupport::Concern
		
		included do
			has_many :tag_relationships, as: :tagged, dependent: :destroy
			has_many :tags, through: :tag_relationships, source: :tag
			attr_accessor :taggable
			
			after_save do
				self.taggable.scan(/(?:\s|^)(?:#(?!\d+(?:\s|$)))(\w+)(?=\s|$)/i).each do |tag|
					tag = Tag.find_or_create_by tag: tag.first
					relationship = self.tag_relationships.find_or_create_by tag: tag
				end
			end
		end
		
	end
end