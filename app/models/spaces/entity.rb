module Spaces
	class Entity < ActiveRecord::Base
		
		belongs_to :space
		belongs_to :entity, polymorphic: true
		
		validates :space, presence: true
		validate :is_a_valid_entity
	
		private
		
			def is_a_valid_entity
				errors.add(:entity, "is invalid") unless entity_type.constantize.reflect_on_association(:spaces)
			end
			
	end
end